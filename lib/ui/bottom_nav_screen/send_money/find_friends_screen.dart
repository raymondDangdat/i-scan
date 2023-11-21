import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../Widgets/components.dart';
import '../../../Widgets/custom_text.dart';
import '../../../Widgets/textfields.dart';
import '../../../Widgets/title_widget.dart';
import '../../../resources/constants/color_constants.dart';
import '../../../resources/constants/dimension_constants.dart';
import '../../../resources/constants/font_constants.dart';
import '../../../resources/constants/image_constant.dart';
import '../../../resources/constants/string_constants.dart';

class FindFriendOnHashITScreen extends StatefulWidget {
  const FindFriendOnHashITScreen({Key? key}) : super(key: key);

  @override
  State<FindFriendOnHashITScreen> createState() =>
      _FindFriendOnHashITScreenState();
}

class _FindFriendOnHashITScreenState extends State<FindFriendOnHashITScreen> {
  bool showBalance = true;
  final searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBgColor,
      body: SafeArea(
          // top: false,
          bottom: false,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const IScanAppBar(
                title: "",
              ),
              SizedBox(
                height: 26.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TitleWidget(
                      title: friendsOnHashIt,
                      fontSize: 18,
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    const BodyTextPrimaryWithLineHeight(
                      text: inviteAndAddFriendsFromYourContact,
                      fontSize: 12,
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: CustomField(
                            "Search",
                            searchController,
                            isCapitalizeSentence: false,
                            type: const TextInputType.numberWithOptions(
                                signed: true),
                            contentPadding: 5,
                            prefixIcon: Padding(
                              padding: EdgeInsets.only(left: 10.w),
                              child: SizedBox(
                                width: 20.w,
                                child: Row(
                                  children: [
                                    SizedBox(
                                      height: 20.h,
                                      width: 20.h,
                                      child: SvgPicture.asset(searchIconNormal),
                                    ),
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    Container(
                                      height: 20.h,
                                      width: 1,
                                      color: black,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 14.h,
              ),
              Expanded(
                  child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: horizontalPadding.w),
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 25.h),
                  decoration: BoxDecoration(
                      color: white, borderRadius: BorderRadius.circular(13.r)),
                  child: ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: contacts.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        final contact = contacts[index];
                        return Padding(
                          padding: EdgeInsets.only(bottom: 23.h),
                          child: Row(
                            children: [
                              Container(
                                height: 31.h,
                                width: 31.h,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100.r),
                                    color: cardColor,
                                    image: DecorationImage(
                                        image: AssetImage(contact.iconName),
                                        fit: BoxFit.cover)),
                              ),
                              SizedBox(
                                width: 7.w,
                              ),
                              Expanded(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  BodyTextPrimaryWithLineHeight(
                                    text: contact.accountName,
                                    fontSize: 12,
                                    textColor: black,
                                    fontWeight: mediumFont,
                                  ),
                                  BodyTextPrimaryWithLineHeight(
                                    text: contact.accountNumber,
                                    fontSize: 11,
                                    textColor: Colors.black
                                        .withOpacity(0.6899999976158142),
                                  ),
                                ],
                              )),
                              CustomContainerButton(
                                horizontalPadding: 10,
                                verticalPadding: 3,
                                borderRadius: 8,
                                onTap: () {},
                                title: contact.isOnHashIT ? "Add" : invite,
                                textColor: Colors.black
                                    .withOpacity(0.6899999976158142),
                                fontWeight: mediumFont,
                                fontSize: 10,
                                borderColor: black,
                              )
                            ],
                          ),
                        );
                      }),
                ),
              ))
            ],
          )),
    );
  }
}

class BeneficiaryModel {
  final String accountName;
  final String accountNumber;
  final String iconName;
  final bool isOnHashIT;

  BeneficiaryModel({
    required this.accountName,
    required this.iconName,
    required this.accountNumber,
    this.isOnHashIT = false,
  });
}

List<BeneficiaryModel> contacts = [
  BeneficiaryModel(
      accountName: "Andrian Seyi",
      iconName: beneficiary4Icon,
      accountNumber: "7073574863"),
  BeneficiaryModel(
      accountName: "Ayomikun",
      iconName: beneficiary4Icon,
      accountNumber: "#ayomikun212",
      isOnHashIT: true),
  BeneficiaryModel(
      accountName: "Irene Augustina",
      iconName: beneficiary1Icon,
      accountNumber: "07073574863"),
  BeneficiaryModel(
      accountName: "Gracie",
      iconName: beneficiary1Icon,
      accountNumber: "#ayomikun212",
      isOnHashIT: true),
  BeneficiaryModel(
      accountName: "Fredrick",
      iconName: beneficiary4Icon,
      accountNumber: "#ayomikun212"),
  BeneficiaryModel(
      accountName: "Anita",
      iconName: beneficiary1Icon,
      accountNumber: "#ayomikun212"),
  BeneficiaryModel(
      accountName: "Bolanle",
      iconName: beneficiary4Icon,
      accountNumber: "#ayomikun212",
      isOnHashIT: true),
  BeneficiaryModel(
      accountName: "Ronke",
      iconName: beneficiary1Icon,
      accountNumber: "#ayomikun212",
      isOnHashIT: true),
  BeneficiaryModel(
      accountName: "Kelechi",
      iconName: beneficiary4Icon,
      accountNumber: "#ayomikun212",
      isOnHashIT: true),
  BeneficiaryModel(
      accountName: "Ayomikun",
      iconName: beneficiary1Icon,
      accountNumber: "07073574863",
      isOnHashIT: true),
];
