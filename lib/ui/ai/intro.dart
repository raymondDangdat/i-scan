import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../Widgets/custom_snack_back.dart';
import '../../providers/ai_provider.dart';
import '../../providers/auth_provider.dart';
import '../../resources/constants/color_constants.dart';
import 'overview.dart';

class AiIntroScreen extends StatelessWidget {
  const AiIntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer2<AiProvider, AuthProvider>(
        builder: (context, watch, auth, child) {
      bool hasClaimedFreeCredits = auth.userProfile?.data.claimedAiUnit == "1";
      if (hasClaimedFreeCredits) {
        return const AiOverviewScreen();
      }
      return Scaffold(
        backgroundColor: grey100,
        body: SafeArea(
          top: false,
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Column(
              children: [
                Image.asset(
                  "assets/images/ai_bg.png",
                  width: double.infinity,
                  height: 320,
                  fit: BoxFit.fill,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(33),
                            side: const BorderSide(color: Colors.white),
                          ),
                        ),
                        child: const Text(
                          'A.I powered',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Explore the Power of \n',
                              style: TextStyle(
                                color: Color(0xFFEAEEFF),
                                fontSize: 28,
                                fontWeight: FontWeight.w700,
                                letterSpacing: -0.56,
                              ),
                            ),
                            TextSpan(
                              text: 'HASH A.I',
                              style: TextStyle(
                                color: Color(0xFFFC2D5E),
                                fontSize: 28,
                                fontWeight: FontWeight.w700,
                                letterSpacing: -0.56,
                              ),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 30),
                      const PointWidget(
                        title: 'Unlimited A.I interaction',
                        icon: 'assets/icon/solar_icon.svg',
                      ),
                      const SizedBox(height: 8),
                      const PointWidget(
                        title: 'More detailed responses',
                        icon: 'assets/icon/pen_icon.svg',
                      ),
                      const SizedBox(height: 8),
                      const PointWidget(
                        title: 'Faster Hash 4.0 A.I turbo model',
                        icon: 'assets/icon/flash_icon.svg',
                      ),
                      const SizedBox(height: 8),
                      const PointWidget(
                        title: 'A.I Powered automation',
                        icon: 'assets/icon/automate_icon.svg',
                      ),
                      const SizedBox(height: 30),
                      Container(
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/ai_card_bg.png'),
                            fit: BoxFit.fill,
                          ),
                        ),
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                          vertical: 16,
                        ),
                        child: Column(
                          children: [
                            const Text(
                              'Claim Free Hash Credits',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              '#500',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 32,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(height: 17),
                            GestureDetector(
                              onTap: () async {
                                if (!watch.hasClaimedFreeCredits) {
                                  bool result = await watch.claimFreeCredits();
                                  if (result) {
                                    auth.getProfile();
                                  } else {
                                    customSnackBar(
                                        context, 'Failed to claim credits');
                                  }
                                }
                              },
                              child: Container(
                                width: double.infinity,
                                height: 46,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 13,
                                ),
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 27,
                                ),
                                decoration: ShapeDecoration(
                                  color: watch.hasClaimedFreeCredits
                                      ? Colors.red
                                      : const Color(0xFF2D5AFC),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                ),
                                alignment: Alignment.center,
                                child: watch.isClaimingFreeCredits
                                    ? const CircularProgressIndicator.adaptive(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                                Colors.white),
                                      )
                                    : Text(
                                        watch.hasClaimedFreeCredits
                                            ? 'Claimed 500 Hash Credits'
                                            : 'Claim Now!',
                                        style: const TextStyle(
                                          color: Color(0xFFEAEEFF),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 35),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const AiOverviewScreen()),
                          );
                        },
                        child: Container(
                          width: double.infinity,
                          height: 75,
                          padding: const EdgeInsets.all(16),
                          decoration: ShapeDecoration(
                            color: Colors.white.withOpacity(0.8999999761581421),
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(width: 1),
                              borderRadius: BorderRadius.circular(18),
                            ),
                          ),
                          alignment: Alignment.center,
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Start using Hash A.I  ',
                                style: TextStyle(
                                  color: Color(0xFF181C26),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward_sharp,
                                color: Color(0xFF181C26),
                                size: 16,
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 35),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}

class PointWidget extends StatelessWidget {
  final String title;
  final String icon;
  const PointWidget({
    super.key,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(width: MediaQuery.of(context).size.width * 0.18),
        Container(
          width: 32,
          height: 32,
          decoration: ShapeDecoration(
            color: const Color(0x19EEF5FF),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          padding: const EdgeInsets.all(5),
          child: SvgPicture.asset(icon),
        ),
        const SizedBox(width: 8),
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        )
      ],
    );
  }
}
