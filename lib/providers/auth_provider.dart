import 'dart:convert';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_udid/flutter_udid.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:http_parser/http_parser.dart';
import 'package:i_scan/Widgets/custom_snack_back.dart';
import 'package:i_scan/model/firebase_user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Utils/functions.dart';
import '../Utils/go_router_route_names.dart';
import '../model/first_step_account_creationl.dart';
import '../model/registration_error_model.dart';
import '../model/second_step_account_creation.dart';
import '../model/third_step_account_creation_model.dart';
import '../model/user_hive_model.dart';
import '../model/user_model.dart';
import '../model/user_profile_model.dart';
import '../resources/constants/connectivity.dart';
import '../resources/constants/constants.dart';
import '../resources/constants/endpoints.dart';
import '../resources/constants/string_constants.dart';
import '../resources/navigation_utils.dart';
import '../services/data_service.dart';
import '../ui/login_screen/login_screen.dart';

class AuthProvider extends ChangeNotifier {
  bool _isAccountCreated = false;
  bool get isAccountCreated => _isAccountCreated;

  bool _isDoctor = true;
  bool get isDoctor => _isDoctor;

  void updateIsDoctor(bool value) {
    _isDoctor = value;
    notifyListeners();
  }

  User? _firebaseUser;
  User? get firebaseUser => _firebaseUser;

  void updateFirebaseUser(User? user) {
    _firebaseUser = user;
    notifyListeners();
  }

  Future<User?> firebaseSignUpWithEmailAndPassword(
      {required BuildContext context}) async {
    try {
      debugPrint("Firebase signup with email and password called===========");
      showIScanLoader(context, message: "Signing up...");
      debugPrint(
          "Email to sign up: Password: ${_createAccountInfo?.email} ${_createAccountInfo?.password}");
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: _createAccountInfo?.email ?? "",
              password: _createAccountInfo?.password ?? "");
      debugPrint("Email And Password sign up==============");
      FirebaseAuth.instance.currentUser?.sendEmailVerification();
      debugPrint(userCredential.user?.email);
      debugPrint(userCredential.user?.uid);

      _firebaseUser = userCredential.user;
      await DatabaseService(uId: userCredential.user?.uid ?? "")
          .saveDeviceId(userCredential.user?.email ?? "");
      await DatabaseService(uId: userCredential.user?.uid ?? "")
          .updateUserData(firstStep: _createAccountInfo!);
      notifyListeners();
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        debugPrint("The password provided is too weak.==============");
        _resMessage = "Weak password";
        notifyListeners();
      } else if (e.code == 'email-already-in-use') {
        debugPrint("Email already exist.==============");
        // IF THE EMAIL ALREADY EXIST, SIGN SIGN IN THE USER
        _resMessage = "Email already exist";
        notifyListeners();
      } else {
        _resMessage = "Could not sign up, please try again later";
        notifyListeners();
        debugPrint(
            "Could not sign up with email and password.==============${e.toString()}");
        // debugPrint("Cound not sign up with email and password ${e.toString()}");
      }
      return null;
    } catch (e) {
      _resMessage = "Error occurred: please try again later";
      notifyListeners();
      debugPrint("Sign up exception: ${e.toString()}");
      return null;
    }
  }

  final CollectionReference users =
      FirebaseFirestore.instance.collection('users');

  FirebaseUserModel? _firebaseUserProfile;
  FirebaseUserModel? get firebaseUserProfile => _firebaseUserProfile;

  bool _hasChangedDevice = false;
  bool get hasChangedDevice => _hasChangedDevice;

  Future<bool> signInUserWithEmailAndPassword({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    bool isLoggedIn = false;
    _hasChangedDevice = false;
    notifyListeners();
    showIScanLoader(context, message: "Loading...");
    try {
      final userCredential = await FirebaseAuth.instance.signInWithCredential(
          EmailAuthProvider.credential(email: email, password: password));
      DocumentSnapshot doc = await users.doc(userCredential.user?.uid).get();
      if (doc.exists) {
        debugPrint("USER ID==============${userCredential.user?.uid}");
        _firebaseUserProfile = FirebaseUserModel.fromDocument(doc);
        debugPrint("User Profile ID: ${_firebaseUserProfile?.userId}");

        //Check is user has logged in with a different device
        debugPrint("===========Registered Device: ${_firebaseUserProfile!.deviceId} Logged in Device ID $_deviceId======================");
        if(_firebaseUserProfile != null && _firebaseUserProfile!.deviceId.toString() == _deviceId){

          debugPrint("Same device===========");
          _hasChangedDevice = false;
          notifyListeners();
        }else{
          debugPrint("Has Changed device===========");
          _hasChangedDevice = true;
          notifyListeners();
        }
        //Check if it is admin
        if (email == iScanAdminEmail) {
          debugPrint("Now Showing Admin routes");
          //This would change the routing to that of Admin
          _isDoctor = false;
          debugPrint("Is admin=====================");
          if (context.mounted) {}
          notifyListeners();
        }
        isLoggedIn = true;
        notifyListeners();
      } else {
        if (context.mounted) {
          customSnackBar(context, "Profile not found");
        }
      }
    } on FirebaseAuthException catch (e) {
      if (context.mounted && e.code == 'user-not-found') {
        customSnackBar(context, "No user found with this email.");
      } else if (context.mounted && e.code == 'wrong-password') {
        customSnackBar(context, 'Wrong login credentials');
      } else if (context.mounted &&
          e.message!.contains("INVALID_LOGIN_CREDENTIALS")) {
        customSnackBar(context, 'Wrong login credentials');
      } else {
        if (context.mounted) {
          debugPrint("Login Exception: ${e.message}");
          customSnackBar(context, e.message ?? 'Login failed');
        }
      }
    } catch (e) {
      debugPrint("Login Exception: ${e.toString()}");
      if (context.mounted) {
        customSnackBar(context, 'Something went wrong');
      }
    }

    return isLoggedIn;
  }

  String _deviceId = "";
  String get deviceId => _deviceId;
  void getDeviceInfo() async {
    try {
      _deviceId = await FlutterUdid.udid;
      debugPrint("The device ID:::::::::::::::::::::::$_deviceId");
    } on PlatformException {
      _deviceId = 'FailedtogetUDID.';
    }
  }

  Future<bool> sendDeviceRequestUpdate({required BuildContext context}) async{
    bool requestSent = false;
    showIScanLoader(context, message: "Requesting device update...");
    requestSent = await DatabaseService(uId: _firebaseUserProfile?.userId ?? "").requestDeviceUpdate(user: _firebaseUserProfile!,
    deviceId: _deviceId);

    if(context.mounted){
      popLoader(context: context);
    }
    return requestSent;
  }

  RegistrationErrorModel? _registrationErrorModel;

  String _navScreenTitle = "Dashboard";
  String get navScreenTitle => _navScreenTitle;

  String _resMessage = "";
  String get resMessage => _resMessage;

  String _selectedOccupation = "";
  String get selectedOccupation => _selectedOccupation;
  void updateSelectedOccupation(String occupation) {
    _selectedOccupation = occupation;
    notifyListeners();
  }

  String _selectedDocumentForVerification = "";
  String get selectedDocumentForVerification =>
      _selectedDocumentForVerification;
  void updateSelectedDocumentForVerification(String document) {
    _selectedDocumentForVerification = document;
    notifyListeners();
  }

  String _stepCompletedTitle = "You’re done!";
  String get stepCompletedTitle => _stepCompletedTitle;
  String _stepCompletedSubTitle = "";
  String get stepCompletedSuTitle => _stepCompletedSubTitle;
  void updateStepCompletedTitleAndSubTitle(String title, String subTitle) {
    _stepCompletedTitle = title;
    _stepCompletedSubTitle = subTitle;
    notifyListeners();
  }

  String _selectedMonthlyIncome = "";
  String get selectedMonthlyIncome => _selectedMonthlyIncome;
  void updateSelectedMonthlyIncome(String monthlyIncome) {
    _selectedMonthlyIncome = monthlyIncome;
    notifyListeners();
  }

  bool _fromBiometricLogin = false;
  bool get fromBiometricLogin => _fromBiometricLogin;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _resendingOtp = false;
  bool get resendingOtp => _resendingOtp;

  bool _requestingOtp = false;
  bool get requestingOtp => _requestingOtp;

  bool _requestingOtpResend = false;
  bool get requestingOtpResend => _requestingOtpResend;

  bool _isUploadingDocument = false;
  bool get isUploadingDocument => _isUploadingDocument;

  String _email = "";
  String get email => _email;

  String _pin = "";
  String get pin => _pin;

  void updatePin(String pin) {
    _pin = pin;
  }

  UserHiveModel? _hiveUserData;
  UserHiveModel? get hiveUserData => _hiveUserData;

  String _passcode = "";
  String get passcode => _passcode;

  String _selectedGender = "Female";
  String get selectedGender => _selectedGender;

  void updatePasscode(String passcode) {
    _passcode = passcode;
    notifyListeners();
  }

  List<String> _selectedHashItUsageOptions = [];
  List<String> get selectedHashItUsageOptions => _selectedHashItUsageOptions;

  int _kycStep = 0;
  int get kycStep => _kycStep;

  void addOrRemoveSelectedHashItUsageOption(String option) {
    if (_selectedHashItUsageOptions.contains(option)) {
      _selectedHashItUsageOptions.remove(option);
      notifyListeners();
    } else {
      _selectedHashItUsageOptions.add(option);
      notifyListeners();
    }
  }

  List<String> _selectedPrimarySourceOfIncomeOptions = [];
  List<String> get selectedPrimarySourceOfIncomeOptions =>
      _selectedPrimarySourceOfIncomeOptions;

  void addOrRemoveSelectedPrimarySourceOfIncomeOption(String option) {
    if (_selectedPrimarySourceOfIncomeOptions.contains(option)) {
      _selectedPrimarySourceOfIncomeOptions.remove(option);
      notifyListeners();
    } else {
      _selectedPrimarySourceOfIncomeOptions.add(option);
      notifyListeners();
    }
  }

  void updateFromBiometricLogin(bool value) {
    _fromBiometricLogin = value;
    debugPrint("From Biometric login: $_fromBiometricLogin");
    notifyListeners();
  }

  FirstStepAccountCreation? _createAccountInfo;
  FirstStepAccountCreation? get createAccountInfo => _createAccountInfo;

  SecondStepAccountCreation? _createAccountInfoStep2;
  SecondStepAccountCreation? get createAccountInfoStep2 =>
      _createAccountInfoStep2;

  ThirdStepAccountCreation? _createAccountInfoStep3;
  ThirdStepAccountCreation? get createAccountInfoStep3 =>
      _createAccountInfoStep3;

  void updatedCreateAccountInfoStep3(ThirdStepAccountCreation newValue) {
    _createAccountInfoStep3 = newValue;
    notifyListeners();
  }

  void updatedCreateAccountInfo(FirstStepAccountCreation newValue) {
    _createAccountInfo = newValue;
    notifyListeners();
  }

  void updatedIsAccountCreated(bool newValue) {
    _isAccountCreated = newValue;
    notifyListeners();
  }

  void updatedCreateAccountInfoStep2(SecondStepAccountCreation newValue) {
    _createAccountInfoStep2 = newValue;
    notifyListeners();
  }

  void updateNavScreenTitle(String title) {
    _navScreenTitle = title;
    notifyListeners();
  }

  void updateEmail(String email) {
    _email = email;
    notifyListeners();
  }

  // User Model to use temporarily before
  UserModel? _userModel;
  UserModel? get userModel => _userModel;

  //CHECK IF USER DETAIL IS SAVED IN HIVE
  Future<bool> updateUserData(BuildContext context) async {
    debugPrint("Checking user data::::::::::::::::::");
    bool hasUserInfo = false;
    if (Hive.box<UserHiveModel>(userBox).isNotEmpty) {
      _hiveUserData = Hive.box<UserHiveModel>(userBox).getAt(0);

      if (_hiveUserData == null) {
        // Send user to login screen
        navToWithScreenName(context: context, screen: const LoginScreen());
        // navTo(context: context, path: Routes.loginScreen);
      } else {
        getProfile();
        hasUserInfo = true;
      }
    } else {
      debugPrint("Empty here========");
      navToWithScreenName(context: context, screen: const LoginScreen());
      // navTo(context: context, path: Routes.loginScreen);
    }
    return hasUserInfo;
  }


  String _profileEditedMessage = usernameUpdated;
  String get profileEditedMessage => _profileEditedMessage;
  void updateProfileEditedMessage(String newMessage) {
    _profileEditedMessage = newMessage;
    notifyListeners();
  }

  // profile/validate-username

  // Validate USERNAME
  Future<bool> validateUsername(
      {required String username, required BuildContext context}) async {
    _username = "";
    notifyListeners();
    bool userSearched = false;
    final connected = await connectionChecker();
    if (context.mounted && connected) {
      // showHashITLoader(context, message: "Searching...");
      _searchingForUsername = true;
      notifyListeners();
      final body = {"username": username};
      // debugPrint("Verify email payload: $body");
      // debugPrint("URL===${"$basedURL/$verifyEmail"}");
      try {
        final response =
            await http.post(Uri.parse("$basedURL/profile/validate-username"),
                headers: {
                  'Content-Type': 'application/json',
                  'Authorization': "Bearer ${_hiveUserData?.token ?? ""}",
                },
                body: json.encode(body));
        debugPrint("Validate username response: ${response.body}");
        debugPrint("validate username Status Code: ${response.statusCode}");
        final decodedResponse = json.decode(response.body);
        if (response.statusCode == 200 || response.statusCode == 201) {
          userSearched = true;
          _searchingForUsername = false;
          _username = username;
          notifyListeners();
        } else if (response.statusCode == 404) {
          _resMessage = _resMessage = decodedResponse['message'];
          _searchingForUsername = false;
          _username = "";
          notifyListeners();
        } else if (response.statusCode == 422) {
          _resMessage = _resMessage = decodedResponse['message'];
          _searchingForUsername = false;
          _username = "";
          notifyListeners();
        } else {
          _resMessage = _resMessage = decodedResponse['message'];
          _searchingForUsername = false;
          _username = "";
          notifyListeners();
        }
      } on SocketException catch (_) {
        _resMessage = "Internet connection is not available";
        _searchingForUsername = false;
        _username = "";
        notifyListeners();
      } catch (e) {
        _resMessage = "Please try again";
        _username = "";
        _searchingForUsername = false;
        notifyListeners();
      }
    } else {
      _resMessage = "Internet connection is not available";
      _searchingForUsername = false;
      _username = "";
      notifyListeners();
    }
    return userSearched;
  }

  Future<bool> setupUsername(
      {required String username, required BuildContext context}) async {
    _username = "";
    notifyListeners();
    bool userSearched = false;
    final connected = await connectionChecker();
    if (context.mounted && connected) {
      showIScanLoader(context, message: "Setting username...");
      _settingUsername = true;
      notifyListeners();
      final body = {
        "customer_id": _hiveUserData?.userId ?? "",
        "username": username
      };
      // debugPrint("Verify email payload: $body");
      // debugPrint("URL===${"$basedURL/$verifyEmail"}");
      try {
        final response =
            await http.post(Uri.parse("$basedURL/profile/create-username"),
                headers: {
                  'Content-Type': 'application/json',
                  'Authorization': "Bearer ${_hiveUserData?.token ?? ""}",
                },
                body: json.encode(body));
        debugPrint("Verify response: ${response.body}");
        debugPrint("Verify Status Code: ${response.statusCode}");
        final decodedResponse = json.decode(response.body);
        if (response.statusCode == 200 || response.statusCode == 201) {
          userSearched = true;
          _settingUsername = false;
          _username = username;
          getProfile();
          notifyListeners();
        } else if (response.statusCode == 404) {
          _resMessage = _resMessage = decodedResponse['message'];
          _settingUsername = false;
          _username = "";
          notifyListeners();
        } else if (response.statusCode == 422) {
          _resMessage = _resMessage = decodedResponse['message'];
          _settingUsername = false;
          _username = "";
          notifyListeners();
        } else {
          _resMessage = _resMessage = decodedResponse['message'];
          _settingUsername = false;
          _username = "";
          notifyListeners();
        }
      } on SocketException catch (_) {
        _resMessage = "Internet connection is not available";
        _settingUsername = false;
        _username = "";
        notifyListeners();
      } catch (e) {
        _resMessage = "Please try again";
        _username = "";
        _settingUsername = false;
        notifyListeners();
      }
    } else {
      _resMessage = "Internet connection is not available";
      _settingUsername = false;
      _username = "";
      notifyListeners();
    }
    return userSearched;
  }

  // GET PROFILE
  UserProfileModel? _userProfile;
  UserProfileModel? get userProfile => _userProfile;
  bool _fetchingProfile = false;
  bool get fetchingProfile => _fetchingProfile;

  //SET BOOLEAN VARIABLES FOR NIN, liveness,
  bool _hasDocument = false;
  bool get hasDocument => _hasDocument;
  bool _hasLiveVideo = false;
  bool get hasLiveVideo => _hasLiveVideo;
  Future<bool> getProfile() async {
    debugPrint("user profile: $_userProfile");

    notifyListeners();
    bool profileFetched = false;
    final connected = await connectionChecker();
    if (connected) {
      if (_userProfile == null) {
        _fetchingProfile = true;
        _hasDocument = false;
        _hasLiveVideo = false;
        _kycStep = 0;
        notifyListeners();
      }
      try {
        final response = await http.get(
          Uri.parse("$basedURL/profile/${_hiveUserData?.userId ?? ''}"),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': "Bearer ${_hiveUserData?.token ?? ""}",
          },
        );
        // debugPrint("Get User profile response : ${response.body}");
        // debugPrint("Get User profile Status Code: ${response.statusCode}");
        if (response.statusCode == 200 || response.statusCode == 201) {
          _userProfile = userProfileModelFromJson(response.body);
          debugPrint("In the 200 status code: ${response.statusCode}");
          notifyListeners();
          //Check for NIN and LIVE video
          if (_userProfile != null && _userProfile!.data.kyc.isNotEmpty) {
            for (int i = 0; i < _userProfile!.data.kyc.length; i++) {
              if (_userProfile!.data.kyc[i].documentType
                          .toString()
                          .toLowerCase() ==
                      ninSlipDocumentType.toLowerCase() ||
                  _userProfile!.data.kyc[i].documentType
                          .toString()
                          .toLowerCase() ==
                      votersCaredDocumentType.toLowerCase() ||
                  _userProfile!.data.kyc[i].documentType
                          .toString()
                          .toLowerCase() ==
                      internationalPassportDocumentType.toLowerCase()) {
                _hasDocument = true;
                debugPrint("Has NIN===========$_hasDocument");
                notifyListeners();
              } else if (_userProfile!.data.kyc[i].documentType
                      .toString()
                      .toLowerCase() ==
                  "video") {
                _hasLiveVideo = true;
                debugPrint("Has video=========$_hasLiveVideo");
                notifyListeners();
              }
            }
            //  update kyc step
            if (_hasLiveVideo &&
                _userProfile!.data.username.toString().isNotEmpty &&
                _userProfile?.data.preferences != null &&
                _userProfile!.data.hasPin) {
              _kycStep = 4;
              debugPrint("KYC Steps 4 : $_kycStep");
              notifyListeners();
            } else if (_hasLiveVideo &&
                _userProfile?.data.preferences != null &&
                _userProfile!.data.hasPin) {
              _kycStep = 3;
              debugPrint("KYC Steps 3: $_kycStep");
              notifyListeners();
            } else if (_hasLiveVideo && _userProfile!.data.hasPin) {
              _kycStep = 2;
              debugPrint("KYC Steps 2: $_kycStep");
              notifyListeners();
            } else if (_hasLiveVideo) {
              debugPrint("KYC Steps 1: $_kycStep");
              _kycStep = 1;
              notifyListeners();
            }
          } else {
            debugPrint("The KYC is not null");
          }
          profileFetched = true;
          _fetchingProfile = false;
          notifyListeners();
        } else if (response.statusCode == 404) {
          // _resMessage = _resMessage = decodedResponse['message'];
          _fetchingProfile = false;
          notifyListeners();
        } else if (response.statusCode == 422) {
          // _resMessage = _resMessage = decodedResponse['message'];
          _fetchingProfile = false;
          notifyListeners();
        } else {
          // _resMessage = _resMessage = decodedResponse['message'];
          _fetchingProfile = false;
          notifyListeners();
        }
      } on SocketException catch (_) {
        _resMessage = "Internet connection is not available";
        _fetchingProfile = false;
        notifyListeners();
      } catch (e) {
        _resMessage = "Please try again";
        _fetchingProfile = false;
        debugPrint("Get User Profile Exception::::::::${e.toString()}");
        notifyListeners();
      }
    } else {
      _resMessage = "Internet connection is not available";
      _fetchingProfile = false;
      notifyListeners();
    }
    return profileFetched;
  }





  // REQUEST OTP FOR UPDATE OR RESET
  String _phoneNumberOrEmailToEdit = "";
  String get phoneNumberOrEmailToEdit => _phoneNumberOrEmailToEdit;
  void updatePhoneNumberOrEmailToEdit(String newValue) {
    _phoneNumberOrEmailToEdit = newValue;
    notifyListeners();
  }

  //THIS IS A VARIABLE TO CHECK IF THE OTP REQUESTED IS TO CHANGE PHONE NUMBER OR PIN
  bool _isChangePIN = false;
  bool get isChangePIN => _isChangePIN;

  void updateIsChangePIN(bool value) {
    _isChangePIN = value;
    notifyListeners();
  }




  // LOG Out User
  Future<bool> logout({
    required BuildContext context,
  }) async {
    final sharedPref = await SharedPreferences.getInstance();
    sharedPref.setString(savedSharedPrefPassword, "");
    sharedPref.setString(savedSharedPrefEmail, "");
    sharedPref.setString(savedSharedPrefUserID, "");
    bool isLogout = false;
    await Hive.box<UserHiveModel>(userBox)
        .deleteAll(Hive.box<UserHiveModel>(userBox).keys);
    isLogout = true;
    return isLogout;
  }

  void clear() {
    _resMessage = "";
    notifyListeners();
  }


  bool _showBalance = true;
  bool get showBalance => _showBalance;

  void toggleShowBalance() async {
    _showBalance = !_showBalance;
    final sharedPref = await SharedPreferences.getInstance();
    sharedPref.setBool(showBalancePref, _showBalance);
    notifyListeners();
  }

  void getShowBalance() async {
    final sharedPref = await SharedPreferences.getInstance();
    _showBalance = sharedPref.getBool(showBalancePref) ?? false;
    notifyListeners();
  }
}

List<String> genderOptionList = [
  "Female",
  "Male",
];
