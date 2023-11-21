// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:provider/provider.dart';
// import '../../../Widgets/components.dart';
// import '../../../Widgets/constant_widgets.dart';
// import '../../../Widgets/network_selection_modal.dart';
// import '../../../Widgets/textfields.dart';
// import '../../../providers/success_provider.dart';
// import '../../../providers/wallet_provider.dart';
// import '../../../resources/constants/color_constants.dart';
// import '../../../resources/constants/image_constant.dart';
// import '../../../resources/constants/string_constants.dart';
// import '../../../resources/navigation_utils.dart';
//
// class StatementOfAccountScreen extends StatefulWidget {
//   const StatementOfAccountScreen({Key? key}) : super(key: key);
//
//   @override
//   State<StatementOfAccountScreen> createState() =>
//       _StatementOfAccountScreenState();
// }
//
// class _StatementOfAccountScreenState extends State<StatementOfAccountScreen> {
//   final fromController = TextEditingController();
//   final toController = TextEditingController();
//
//   DateTime selectedFromDate = DateTime.now();
//   DateTime selectedToDate = DateTime.now();
//
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   Future<void> _selectFromDate(BuildContext context) async {
//     final DateTime? picked = await showDatePicker(
//         context: context,
//         initialDate: selectedFromDate,
//         firstDate: DateTime(1930, 8),
//         lastDate: DateTime(2101));
//     if (picked != null && picked != selectedFromDate) {
//       setState(() {
//         selectedFromDate = picked;
//         final _from =
//             "${selectedFromDate.year}-${selectedFromDate.month < 10 ? '0${selectedFromDate.month}' : selectedFromDate.month}-${selectedFromDate.day < 10 ? '0${selectedFromDate.day}' : selectedFromDate.day}";
//         fromController.text = _from;
//
//         DateTime dob2 = DateTime.parse(_from);
//       });
//     }
//   }
//
//   Future<void> _selectToDate(BuildContext context) async {
//     final DateTime? picked = await showDatePicker(
//         context: context,
//         initialDate: selectedToDate,
//         firstDate: DateTime(1930, 8),
//         lastDate: DateTime(2101));
//     if (picked != null && picked != selectedToDate) {
//       setState(() {
//         selectedToDate = picked;
//         final _from =
//             "${selectedToDate.year}-${selectedToDate.month < 10 ? '0${selectedToDate.month}' : selectedToDate.month}-${selectedToDate.day < 10 ? '0${selectedToDate.day}' : selectedToDate.day}";
//         toController.text = _from;
//
//         DateTime dob2 = DateTime.parse(_from);
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: appBgColor,
//       body: SafeArea(
//           child: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const TopPadding(),
//           const HashITAppBar(
//             title: statementOfAccount,
//             showWidget: true,
//           ),
//           Expanded(
//               child: SingleChildScrollView(
//             child: Padding(
//               padding: EdgeInsets.symmetric(horizontal: 16.w),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Consumer<WalletProvider>(
//                       builder: (ctx, walletProvider, child) {
//                     return Column(
//                       children: [
//                         SizedBox(
//                           height: 28.h,
//                         ),
//                         CustomDropdownButtonWithTitleAndSubTitle(
//                           title: selectPreferredNetwork,
//                           subTitle: walletProvider.selectedNetworkType == null
//                               ? select
//                               : walletProvider.selectedNetworkType!,
//                           onTap: () {
//                             showNetworkSelectionModal(context);
//                           },
//                           subTitleColor:
//                               walletProvider.selectedNetworkType == null
//                                   ? const Color.fromRGBO(113, 113, 113, 1)
//                                   : black,
//                         ),
//                         SizedBox(
//                           height: 23.h,
//                         ),
//                         CustomField(
//                           "YYYY/MM/DD",
//                           fromController,
//                           labelText: "From *",
//                           suffix: InkWell(
//                             onTap: () {
//                               _selectFromDate(context);
//                             },
//                             child: SizedBox(
//                               height: 20.h,
//                               width: 20.h,
//                               child: Padding(
//                                 padding: EdgeInsets.all(10.r),
//                                 child: SvgPicture.asset(calender),
//                               ),
//                             ),
//                           ),
//                         ),
//                         SizedBox(
//                           height: 23.h,
//                         ),
//                         CustomField(
//                           "YYYY/MM/DD",
//                           toController,
//                           labelText: "To *",
//                           suffix: InkWell(
//                             onTap: () {
//                               _selectToDate(context);
//                             },
//                             child: SizedBox(
//                               height: 20.h,
//                               width: 20.h,
//                               child: Padding(
//                                 padding: EdgeInsets.all(10.r),
//                                 child: SvgPicture.asset(calender),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     );
//                   }),
//                 ],
//               ),
//             ),
//           )),
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: 16.w),
//             child: Consumer<SuccessProvider>(
//                 builder: (ctx, successProvider, child) {
//               return MainButton(
//                 continueTo,
//                 () {
//                   successProvider.updateTitle("Success");
//                   successProvider.updateSubTitle("Request in progress");
//                   openSuccessScreen(context);
//                 },
//                 color: black,
//               );
//             }),
//           )
//         ],
//       )),
//     );
//   }
// }
