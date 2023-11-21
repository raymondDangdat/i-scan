import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:i_scan/Widgets/components.dart';
import 'package:i_scan/Widgets/constant_widgets.dart';
import 'package:i_scan/resources/constants/dimension_constants.dart';
import 'package:jiffy/jiffy.dart';
import 'package:provider/provider.dart';
import '../../../Widgets/custom_text.dart';
import '../../../Widgets/title_widget.dart';
import '../../../providers/attendance_provider.dart';
import '../../../providers/auth_provider.dart';
import '../../../providers/card_provider.dart';
import '../../../resources/constants/color_constants.dart';
import '../../../resources/constants/string_constants.dart';

class DrAttendanceScreen extends StatefulWidget {
  const DrAttendanceScreen({Key? key}) : super(key: key);

  @override
  State<DrAttendanceScreen> createState() => _DrAttendanceScreenState();
}

class _DrAttendanceScreenState extends State<DrAttendanceScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final authProvider = Provider.of<AuthProvider>(context, listen: false);
      final attendanceProvider =
      Provider.of<AttendanceProvider>(context, listen: false);
      attendanceProvider.getDocAttendances(authProvider.firebaseUserProfile?.userId ?? "");
      setState(() {});
    });
    setState(() {

    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBgColor2,
      body: Consumer2<CardProvider, AuthProvider>(
          builder: (ctx, cardProvider, authProvider, child) {
        return SafeArea(
            bottom: false,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TopPadding(),
                const IScanAppBar(title: "Attendance History"),
                SizedBox(height: 20.h,),
                Expanded(
                  child: Center(
                      child: StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance.collection(generalAttendanceCollection).where('userId', isEqualTo: FirebaseAuth.instance.currentUser?.uid?? "").snapshots(),
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
                                        widget: Row(
                                          children: [
                                            Expanded(
                                                child: Column(
                                                  children: [
                                                    const TitleWidget(title: "Check In"),
                                                    SizedBox(
                                                      height: 10.h,
                                                    ),
                                                    BodyTextPrimaryWithLineHeight(
                                                      text: Jiffy.parse(doc['CheckInDate']).format(pattern: 'h:mm:ss a'),
                                                    ),
                                                  ],
                                                )),
                                            Expanded(
                                                child: Column(
                                                  children: [
                                                    const TitleWidget(title: "Check Out"),
                                                    SizedBox(
                                                      height: 10.h,
                                                    ),
                                                    BodyTextPrimaryWithLineHeight(
                                                      text: doc['checkOutDate'].toString().isEmpty ? "......" : Jiffy.parse(doc['checkOutDate']).format(pattern: 'h:mm:ss a'),
                                                    ),
                                                  ],
                                                )),
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
                ))
              ],
            ));
      }),
    );
  }
}
