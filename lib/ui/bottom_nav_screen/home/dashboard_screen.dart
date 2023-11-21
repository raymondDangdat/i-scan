import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:i_scan/Widgets/components.dart';
import 'package:i_scan/Widgets/modals/show_device_changed_modal.dart';
import 'package:i_scan/Widgets/title_widget.dart';
import 'package:i_scan/providers/attendance_provider.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jiffy/jiffy.dart';
import 'package:provider/provider.dart';
import '../../../Utils/go_router_route_names.dart';
import '../../../Widgets/constant_widgets.dart';
import '../../../Widgets/custom_text.dart';
import '../../../Widgets/user_tag_widget.dart';
import '../../../providers/auth_provider.dart';
import '../../../resources/constants/color_constants.dart';
import '../../../resources/constants/dimension_constants.dart';
import '../../../resources/constants/font_constants.dart';
import '../../../resources/constants/image_constant.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {


  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async{
      final authProvider = Provider.of<AuthProvider>(context, listen: false);
      final attendanceProvider = Provider.of<AttendanceProvider>(context, listen: false);
      attendanceProvider.getTodayAttendanceStatus(authProvider.firebaseUserProfile?.userId ?? "");

      setState(() {

      });

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBgColor2,
      body: SafeArea(
          top: true,
          bottom: false,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TopPadding(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: horizontalPadding.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const UserTagWidget(),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {},
                          child: SvgPicture.asset(notificationIconSvg),
                        ),
                        SizedBox(
                          width: 16.w,
                        ),
                        InkWell(
                            onTap: () {
                              // context.goNamed(scanQRCodeScannerRouteName);
                            },
                            child: SvgPicture.asset(scanIconSvg)),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              Expanded(child: Consumer2<AuthProvider, AttendanceProvider>(
                  builder: (ctx, authProvider, attendanceProvider, child) {
                return SingleChildScrollView(
                  padding:
                      EdgeInsets.symmetric(horizontal: horizontalPadding.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TitleWidget(
                                title: "Today's status",
                                fontSize: 20,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          BodyTextPrimaryWithLineHeight(
                            text: Jiffy.parse(DateTime.now().toString())
                                .format(pattern: 'MMMM do yyyy, h:mm:ss a'),
                            textColor: mainColor,
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          CustomContainerButton(
                            onTap: () {},
                            title: "",
                            verticalPadding: 20,
                            horizontalPadding: 20,
                            widget: Row(
                              children: [
                                Expanded(
                                    child: Column(
                                  children: [
                                    const TitleWidget(title: "Check in"),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                     BodyTextPrimaryWithLineHeight(
                                        text: attendanceProvider.gettingTodayAttendanceStatus || attendanceProvider.todayAttendanceSnapshot != null && attendanceProvider.todayAttendanceSnapshot!.docs.isEmpty ? "......." : Jiffy.parse(attendanceProvider.todayAttendanceSnapshot!.docs.firstWhere((attendance) => attendance['isCheckIn'] == true)['date'])
                                            .format(pattern: 'h:mm:ss a')),
                                  ],
                                )),
                                Expanded(
                                    child: Column(
                                  children: [
                                    const TitleWidget(title: "Check out"),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    BodyTextPrimaryWithLineHeight(
                                        text: attendanceProvider.gettingTodayAttendanceStatus || attendanceProvider.todayAttendanceSnapshot != null && attendanceProvider.todayAttendanceSnapshot!.docs.length < 2 ? "......." :
                                        attendanceProvider.gettingTodayAttendanceStatus || attendanceProvider.todayAttendanceSnapshot != null && attendanceProvider.todayAttendanceSnapshot!.docs.isEmpty ? "......." : Jiffy.parse(attendanceProvider.todayAttendanceSnapshot!.docs.firstWhere((attendance) => attendance['isCheckIn'] == false)['date'])
                                            .format(pattern: 'h:mm:ss a')),
                                  ],
                                )),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),

                          if(attendanceProvider.todayAttendanceSnapshot == null || attendanceProvider.todayAttendanceSnapshot != null && attendanceProvider.todayAttendanceSnapshot!.docs.length < 2)
                          Center(
                            child: SizedBox(
                              width: 200.w,
                              child: CustomContainerButton(
                                onTap: () {
                                  //Check if user has changed device
                                  if(authProvider.hasChangedDevice){
                                    showDeviceChangedModal(context);
                                  }else{
                                  //  Is same device, proceed to check in or check out
                                    context.goNamed(scanQRCodeScannerRouteName);
                                  }

                                },
                                title: "",
                                widget: Column(
                                  children: [
                                    Icon(
                                      Iconsax.scan,
                                      size: 50.h,
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                     TitleWidget(
                                      title: attendanceProvider.todayAttendanceSnapshot == null || attendanceProvider.todayAttendanceSnapshot != null && attendanceProvider.todayAttendanceSnapshot!.docs.isEmpty ? "Tap to Check In" : "Tap to Check Out",
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }))
            ],
          )),
    );
  }
}

class QuickActionItem extends StatelessWidget {
  final VoidCallback onTap;
  final String iconName;
  final String title;
  const QuickActionItem(
      {Key? key,
      required this.onTap,
      required this.title,
      required this.iconName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          SvgPicture.asset(iconName),
          SizedBox(
            width: 8.w,
          ),
          BodyTextLightWithLineHeight(
            text: title,
            fontSize: 12,
            fontWeight: mediumFont,
            textColor: const Color.fromRGBO(182, 187, 201, 1),
          ),
        ],
      ),
    );
  }
}
