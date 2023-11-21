import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:i_scan/Widgets/constant_widgets.dart';

import '../../../Widgets/components.dart';
import '../../../Widgets/custom_text.dart';
import '../../../Widgets/title_widget.dart';
import '../../../resources/constants/dimension_constants.dart';
import '../../../resources/constants/string_constants.dart';

class IScanAdminDoctors extends StatefulWidget {
  const IScanAdminDoctors({Key? key}) : super(key: key);

  @override
  State<IScanAdminDoctors> createState() => _IScanAdminDoctorsState();
}

class _IScanAdminDoctorsState extends State<IScanAdminDoctors> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TopPadding(),
        const IScanAppBar(title: "Doctors"),
        SizedBox(height: 20.h,),
        Expanded(
            child: Center(
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance.collection(doctorsCollection).where('userType', isNotEqualTo: "admin").snapshots(),
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
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            const BodyTextPrimaryWithLineHeight(text: "First Name"),
                                            SizedBox(
                                              height: 10.h,
                                            ),
                                            TitleWidget(
                                              title: doc['firstName']),

                                          ],
                                        )),
                                    Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            const BodyTextPrimaryWithLineHeight(text: "Last Name"),
                                            SizedBox(
                                              height: 10.h,
                                            ),
                                            TitleWidget(
                                                title: doc['lastName']),

                                          ],
                                        )),
                                  ],
                                ),
                              ),
                            );
                          }),
                    );
                  } else {
                    return const TitleWidget(title: "No Doctors Yet!");
                  }
                },
              ),
            ))
      ],
    );
  }
}
