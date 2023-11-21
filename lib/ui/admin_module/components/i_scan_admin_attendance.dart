import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:i_scan/providers/auth_provider.dart';
import 'package:jiffy/jiffy.dart';
import 'package:provider/provider.dart';

import '../../../Widgets/components.dart';
import '../../../Widgets/constant_widgets.dart';
import '../../../Widgets/custom_text.dart';
import '../../../Widgets/title_widget.dart';
import '../../../resources/constants/color_constants.dart';
import '../../../resources/constants/dimension_constants.dart';
import '../../../resources/constants/string_constants.dart';

class IScanAdminAttendance extends StatefulWidget {
  const IScanAdminAttendance({super.key});

  @override
  State<IScanAdminAttendance> createState() => _IScanAdminAttendanceState();
}

class _IScanAdminAttendanceState extends State<IScanAdminAttendance> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Consumer<AuthProvider>(builder: (ctx, auth, child) {
        return Column(
          children: [
            const TopPadding(),
            const IScanAppBar(title: "Attendance"),
            SizedBox(height: 20.h,),
            Expanded(
                child: Center(
                  child: StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance.collection(generalAttendanceCollection).snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
                        return Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: horizontalPadding.w
                          ),
                          child: ListView.builder(
                              itemCount: snapshot.data!.docs.length,
                              itemBuilder: (context, index) {
                                DocumentSnapshot doc = snapshot.data!.docs[index];
                                return Padding(
                                  padding: EdgeInsets.only(
                                      bottom: 10.h
                                  ),
                                  child: CustomContainerButton(
                                    onTap: () {},
                                    title: "",
                                    verticalPadding: 20,
                                    horizontalPadding: 20,
                                    borderRadius: 10,
                                    widget: Column(
                                      children: [
                                        TitleWidget(
                                          title: Jiffy.parse(doc['CheckInDate'])
                                              .format(pattern: 'MMMM do yyyy'),
                                          textColor: mainColor,
                                          fontSize: 20,
                                        ),
                                        SizedBox(
                                          height: 10.h,
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    const BodyTextPrimaryWithLineHeight(text: "Full Name"),
                                                    SizedBox(
                                                      height: 5.h,
                                                    ),
                                                    TitleWidget(
                                                        title: doc['fullName']),

                                                  ],
                                                )),
                                          ],
                                        ),
                                        SizedBox(height: 10.h,),
                                        Row(
                                          children: [
                                            Expanded(
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    const BodyTextPrimaryWithLineHeight(text: "Check In"),
                                                    SizedBox(
                                                      height: 10.h,
                                                    ),
                                                    TitleWidget(
                                                        title: Jiffy.parse(doc["CheckInDate"])
                                                            .format(pattern: 'h:mm:ss a')),

                                                  ],
                                                )),
                                            Expanded(
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    const BodyTextPrimaryWithLineHeight(text: "Check Out"),
                                                    SizedBox(
                                                      height: 10.h,
                                                    ),
                                                    TitleWidget(
                                                        title: doc["checkOutDate"].toString().isEmpty ? "......" : Jiffy.parse(doc["checkOutDate"])
                                                            .format(pattern: 'h:mm:ss a')),

                                                  ],
                                                )),
                                          ],
                                        ),

                                      ],
                                    ),
                                  ),
                                );
                              }),
                        );
                      } else {
                        return const TitleWidget(title: "No Attendance History!");
                      }
                    },
                  ),
                )),
          ],
        );
      }),
    );
  }
}




