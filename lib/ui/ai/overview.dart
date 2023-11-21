import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:i_scan/ui/ai/widgets/offer_widget.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

import '../../Widgets/modal_header_with_close_icon_widget.dart';
import '../../providers/ai_provider.dart';
import '../../providers/auth_provider.dart';
import '../../resources/color_manager.dart';
import '../../resources/constants/color_constants.dart';
import '../../resources/constants/dimension_constants.dart';
import 'tabs/chat_tab.dart';
import 'tabs/history_tab.dart';
import 'tabs/tasks_tab.dart';

class AiOverviewScreen extends StatefulWidget {
  const AiOverviewScreen({super.key});

  @override
  State<AiOverviewScreen> createState() => _AiOverviewScreenState();
}

class _AiOverviewScreenState extends State<AiOverviewScreen>
    with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    controller = TabController(length: 3, vsync: this)
      ..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Hash A.I",
          style: TextStyle(
            color: Colors.white.withOpacity(0.4),
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: ColorManager.grey90,
      ),
      backgroundColor: grey100,
      body: Consumer2<AiProvider, AuthProvider>(
          builder: (context, ref, auth, child) {
        auth.userProfile;
        return SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 28,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                decoration: ShapeDecoration(
                  color: ColorManager.grey90,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(
                          'assets/icon/wallet_icon.svg',
                          width: 15,
                          height: 15,
                          fit: BoxFit.contain,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Hash Credits',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.6),
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const Spacer(),
                        Icon(
                          Icons.info_outline,
                          size: 20,
                          color: Colors.white.withOpacity(0.5),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            '#${double.parse(auth.userProfile!.data.aiCredit!).toInt()}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 32,
                              fontWeight: FontWeight.w700,
                              letterSpacing: -0.64,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            showModalBottomSheet<void>(
                              isScrollControlled: true,
                              context: context,
                              backgroundColor: const Color(0xFF181C26),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(modalRadius.r),
                                  topRight: Radius.circular(modalRadius.r),
                                ),
                              ),
                              builder: (BuildContext context) {
                                return Container(
                                  margin: EdgeInsets.only(
                                    bottom: bottomPadding.h,
                                    top: 14.h,
                                    left: horizontalPadding.w,
                                    right: horizontalPadding.w,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(modalRadius.r),
                                      topRight: Radius.circular(modalRadius.r),
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const ModalHeaderWithCloseIconWidget(),
                                      SizedBox(height: 24.h),
                                      const Text(
                                        'Purchase hash credits',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      SizedBox(height: 24.h),
                                      const OfferWidget(
                                        amount: '2000',
                                        credits: '500',
                                        extra: '15',
                                      ),
                                      SizedBox(height: 12.h),
                                      const OfferWidget(
                                        offer: "Best Offer",
                                        amount: '4000',
                                        credits: '1500',
                                        extra: '50',
                                      ),
                                      SizedBox(height: 12.h),
                                      const OfferWidget(
                                        offer: "Premium Offer",
                                        amount: '6000',
                                        credits: '3000',
                                        extra: '60',
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  width: 1,
                                  color: Colors.white.withOpacity(0.5),
                                ),
                                borderRadius: BorderRadius.circular(41),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  'assets/icon/stars_icon.svg',
                                  width: 20,
                                  height: 20,
                                  fit: BoxFit.contain,
                                ),
                                const SizedBox(width: 8),
                                const Text(
                                  'Purchase hash credits',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 32.h),
              Center(
                child: FittedBox(
                  child: Container(
                    height: 53,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Colors.white.withOpacity(0.1),
                    ),
                    alignment: Alignment.center,
                    child: TabBar(
                      tabAlignment: TabAlignment.center,
                      controller: controller,
                      indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: Colors.black,
                      ),
                      isScrollable: true,
                      labelColor: Colors.white,
                      unselectedLabelColor: Colors.white.withOpacity(0.6),
                      tabs: const [
                        Tab(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Iconsax.message,
                                size: 16,
                              ),
                              SizedBox(width: 8),
                              Text('Chat'),
                            ],
                          ),
                        ),
                        Tab(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Iconsax.task_square,
                                size: 16,
                              ),
                              SizedBox(width: 8),
                              Text('Task for AI'),
                            ],
                          ),
                        ),
                        Tab(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Iconsax.clock,
                                size: 16,
                              ),
                              SizedBox(width: 8),
                              Text('History'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 32.h),
              switch (controller.index) {
                0 => const ChatTab(),
                1 => const AiTasksTab(),
                2 => const AiHistoryTab(),
                _ => Container(),
              },
            ],
          ),
        );
      }),
    );
  }
}
