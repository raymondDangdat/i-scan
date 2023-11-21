import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../../../Utils/functions.dart';
import '../../../../Utils/go_router_route_names.dart';
import '../../../../Widgets/constant_widgets.dart';
import '../../../../Widgets/custom_snack_back.dart';
import '../../../../Widgets/custom_text.dart';
import '../../../../providers/auth_provider.dart';
import '../../../../resources/constants/color_constants.dart';
import '../../../../resources/constants/font_constants.dart';
import '../../../../resources/constants/image_constant.dart';
import '../../../../resources/constants/string_constants.dart';

class EditProfileMainScreen extends StatefulWidget {
  const EditProfileMainScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileMainScreen> createState() => _EditProfileMainScreenState();
}

class _EditProfileMainScreenState extends State<EditProfileMainScreen> {
  final ImagePicker _picker = ImagePicker();
  late AuthProvider lateAuthProvider;
  handleChooseFromGallery(BuildContext context) async {
    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
    );
    setState(() {
      xFile = pickedFile;
      profileImg = File(pickedFile!.path);
      if (profileImg != null) {
        lateAuthProvider.updateDocumentFile(profileImg);
        lateAuthProvider.uploadProfilePhoto(
            context: context, isProfileUpdate: true);
      }
    });
  }

  File? profileImg;
  XFile? xFile;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final auth = context.watch<AuthProvider>();
    lateAuthProvider = auth;
    return Scaffold(
      backgroundColor: appBgColor,
      body: SafeArea(
          child: Column(
        children: [
          const TopPadding(),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 16.w),
                child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(Icons.arrow_back_ios)),
              ),
            ],
          ),
          SizedBox(
            height: 19.h,
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child:
                  Consumer<AuthProvider>(builder: (ctx, authProvider, child) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  if (authProvider.resMessage != '') {
                    customSnackBar(context, authProvider.resMessage);

                    ///Clear the response message to avoid duplicate
                    authProvider.clear();
                  }
                });
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const BodyTextPrimaryWithLineHeight(
                      text: editProfile,
                      textColor: black,
                      fontSize: 16,
                      lineHeight: 1.2,
                      fontWeight: boldFont,
                    ),
                    SizedBox(
                      height: 39.h,
                    ),
                    Center(
                      child: Column(
                        children: [
                          Container(
                            height: 89.h,
                            width: 89.h,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: cardColor,
                                image: DecorationImage(
                                    image: NetworkImage(
                                        auth.userProfile == null ||
                                                authProvider.userProfile!.data
                                                        .avatar ==
                                                    null ||
                                                authProvider
                                                    .userProfile!.data.avatar
                                                    .toString()
                                                    .isEmpty
                                            ? ""
                                            : authProvider
                                                .userProfile!.data.avatar),
                                    fit: BoxFit.cover)),
                            child: Stack(
                              children: [
                                Positioned(
                                    left: 0,
                                    right: 0,
                                    top: 0,
                                    bottom: 0,
                                    child: InkWell(
                                        onTap: () {
                                          handleChooseFromGallery(context);
                                        },
                                        child: authProvider.isUploadingDocument
                                            ? const CupertinoActivityIndicator(
                                                color: white,
                                              )
                                            : Icon(
                                                Iconsax.gallery_edit,
                                                color: white,
                                                size: 24.h,
                                              )))
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          BodyTextPrimaryWithLineHeight(
                            text:
                                "${authProvider.userProfile?.data.firstName} ${authProvider.userProfile?.data.lastName}",
                            textColor: black,
                            fontSize: 16,
                            fontWeight: boldFont,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 18.h,
                    ),
                    EditProfileItem(
                      label: yourUsername,
                      onTap: () {
                        if (authProvider.userProfile?.data.username == null ||
                            authProvider.userProfile!.data.username
                                .toString()
                                .isEmpty) {
                          customSnackBar(
                              context, "You haven't set up username yet");
                        } else {
                          context.goNamed(editUsernameRouteName);
                        }
                      },
                      title: authProvider.userProfile != null &&
                              authProvider.userProfile!.data.username
                                  .toString()
                                  .isNotEmpty
                          ? '#${authProvider.userProfile?.data.username}'
                          : '#NewUser',
                      hasCopyButton: true,
                    ),
                    SizedBox(
                      height: 11.h,
                    ),
                    EditProfileItem(
                      label: yourAccountNumber,
                      onTap: () {},
                      title: authProvider.userProfile != null &&
                              authProvider.userProfile!.data.accounts.isNotEmpty
                          ? '${authProvider.userProfile?.data.accounts[0].accountNumber}'
                          : 'No Account',
                      notEditable: true,
                    ),
                    SizedBox(
                      height: 11.h,
                    ),
                    EditProfileItem(
                      label: phoneNumber,
                      onTap: () {
                        debugPrint("ON Tapped");
                        context.goNamed(editPhoneNumberRouteName);
                      },
                      title: authProvider.userProfile != null
                          ? authProvider.userProfile!.data.phoneNumber
                          : 'No Account',
                      notEditable: true,
                      hasCopyButton: true,
                    ),
                    SizedBox(
                      height: 11.h,
                    ),
                    EditProfileItem(
                      label: emailAddress,
                      onTap: () {
                        // openEditEmailScreen(context);
                      },
                      title: authProvider.userProfile != null
                          ? authProvider.userProfile!.data.email
                          : 'No Email',
                      notEditable: true,
                      hasCopyButton: true,
                    ),
                    SizedBox(
                      height: 11.h,
                    ),
                    EditProfileItem(
                      label: "Address",
                      onTap: () {},
                      title: authProvider.userProfile != null
                          ? authProvider.userProfile!.data.address
                          : 'No Address',
                    ),
                  ],
                );
              }),
            ),
          ),
        ],
      )),
    );
  }
}

class EditProfileItem extends StatelessWidget {
  final String label;
  final String title;
  final bool hasCopyButton;
  final VoidCallback onTap;
  final bool notEditable;
  const EditProfileItem(
      {Key? key,
      required this.label,
      this.hasCopyButton = false,
      this.notEditable = false,
      this.title = forwardIcon,
      required this.onTap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          padding:
              EdgeInsets.only(top: 11.h, left: 11.w, bottom: 11.h, right: 19.w),
          decoration: BoxDecoration(
              color: white, borderRadius: BorderRadius.circular(9.r)),
          child: hasCopyButton
              ? Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BodyTextPrimaryWithLineHeight(
                          text: label,
                          textColor:
                              Colors.black.withOpacity(0.46000000834465027),
                          fontSize: 10,
                          fontWeight: boldFont,
                        ),
                        InkWell(
                          onTap: onTap,
                          child: BodyTextPrimaryWithLineHeight(
                            text: label == "Email address" ? "" : "Edit",
                            textColor: Color(0xFF2056BE),
                            fontSize: 10,
                            fontWeight: boldFont,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 13.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BodyTextPrimaryWithLineHeight(
                          text: title,
                          textColor: black,
                          fontSize: 10,
                          fontWeight: boldFont,
                        ),
                        InkWell(
                          onTap: () {
                            copyToClipboard(title);
                          },
                          child: Row(
                            children: [
                              Icon(
                                Iconsax.document_copy,
                                size: 20.h,
                                color: const Color(0xFF2056BE),
                              ),
                              SizedBox(
                                width: 4.w,
                              ),
                              const BodyTextPrimaryWithLineHeight(
                                text: "Copy",
                                textColor: Color(0xFF2056BE),
                                fontSize: 12,
                                lineHeight: 1.2,
                                fontWeight: boldFont,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              : Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BodyTextPrimaryWithLineHeight(
                          text: label,
                          textColor:
                              Colors.black.withOpacity(0.46000000834465027),
                          fontSize: 10,
                          fontWeight: boldFont,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 13.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BodyTextPrimaryWithLineHeight(
                          text: title,
                          textColor: black,
                          fontSize: 10,
                          fontWeight: boldFont,
                        ),
                        notEditable
                            ? InkWell(
                                onTap: () {
                                  copyToClipboard(title);
                                },
                                child: Row(
                                  children: [
                                    Icon(
                                      Iconsax.document_copy,
                                      size: 20.h,
                                      color: const Color(0xFF2056BE),
                                    ),
                                    SizedBox(
                                      width: 4.w,
                                    ),
                                    const BodyTextPrimaryWithLineHeight(
                                      text: "Copy",
                                      textColor: Color(0xFF2056BE),
                                      fontSize: 12,
                                      lineHeight: 1.2,
                                      fontWeight: boldFont,
                                    ),
                                  ],
                                ),
                              )
                            : InkWell(
                                onTap: onTap,
                                child: BodyTextPrimaryWithLineHeight(
                                  text: label == "Address"
                                      ? ""
                                      : label == "Email address "
                                          ? ""
                                          : "Edit",
                                  textColor: Color(0xFF2056BE),
                                  fontSize: 10,
                                  fontWeight: boldFont,
                                ),
                              ),
                      ],
                    ),
                  ],
                )),
    );
  }
}
