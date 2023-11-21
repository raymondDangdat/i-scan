import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../resources/data.dart';
import '../../bottom_nav_screen/home/widgets/slide_animation.dart';
import '../chat_screen.dart';
import '../widgets/quick_reply_widget.dart';
import '../widgets/social_media_widget.dart';

class ChatTab extends StatelessWidget {
  const ChatTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SocialMediaWidget(),
        SizedBox(height: 32.h),
        const Text(
          'Get help with any task',
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: 8.h),
        Row(
          children: [
            Text(
              'Shortcuts',
              style: TextStyle(
                color: Colors.white.withOpacity(0.3),
                fontSize: 12,
              ),
            ),
            SizedBox(
              width: 8.w,
            ),
            SizedBox(
              width: 4.w,
            ),
            const SlideAnimationWidget(),
          ],
        ),
        SizedBox(height: 16.h),
        SizedBox(
          height: 234,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              AiShortcutWidget(
                shortcut: shortcuts[0],
              ),
              AiShortcutWidget(
                shortcut: shortcuts[1],
                shortcut2: shortcuts[2],
              ),
              AiShortcutWidget(
                shortcut: shortcuts[3],
              ),
              AiShortcutWidget(
                shortcut: shortcuts[4],
                shortcut2: shortcuts[5],
              ),
              AiShortcutWidget(
                shortcut: shortcuts[6],
              ),
              AiShortcutWidget(
                shortcut: shortcuts[7],
                shortcut2: shortcuts[8],
              ),
              AiShortcutWidget(
                shortcut: shortcuts[9],
                shortcut2: shortcuts[10],
              ),
              AiShortcutWidget(
                shortcut: shortcuts[11],
                shortcut2: shortcuts[12],
              ),
            ],
          ),
        ),
        SizedBox(height: 32.h),
        Text(
          'Receive Quick Replies',
          style: TextStyle(
            color: Colors.white.withOpacity(0.8),
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 16),
        ListView.separated(
          itemCount: quickReplies.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          separatorBuilder: (_, i) {
            return const SizedBox(height: 16);
          },
          itemBuilder: (_, i) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  quickReplies[i]["title"],
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.5),
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 8),
                ListView.separated(
                  itemCount: quickReplies[i]["replies"].length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  separatorBuilder: (_, int index) {
                    return const SizedBox(height: 10);
                  },
                  itemBuilder: (_, int index) {
                    return QuickReplyWidget(
                      reply: quickReplies[i]["replies"][index],
                    );
                  },
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}

class AiShortcutWidget extends StatelessWidget {
  final Map shortcut;
  final Map? shortcut2;
  const AiShortcutWidget({
    super.key,
    required this.shortcut,
    this.shortcut2,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: (shortcut2 != null)
          ? Column(children: [
              Expanded(
                child: Image.asset(
                  shortcut["image"],
                  width: 144,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(height: 16.h),
              Expanded(
                child: Image.asset(
                  shortcut2!["image"],
                  width: 144,
                  fit: BoxFit.fill,
                ),
              ),
            ])
          : GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChatAiScreen(
                      message: shortcut["title"],
                    ),
                  ),
                );
              },
              child: Image.asset(
                shortcut["image"],
                width: 144,
                height: 234,
                fit: BoxFit.fill,
              ),
            ),
    );
  }
}
