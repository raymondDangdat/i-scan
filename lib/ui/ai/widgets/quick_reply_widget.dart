import 'package:flutter/material.dart';

import '../chat_screen.dart';

class QuickReplyWidget extends StatelessWidget {
  final Map reply;
  const QuickReplyWidget({
    super.key,
    required this.reply,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ChatAiScreen(
                    message: reply["title"],
                  )),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 10,
        ),
        decoration: ShapeDecoration(
          color: const Color(0x19EEF5FF),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                reply["title"],
                style: TextStyle(
                  color: Colors.white.withOpacity(0.8),
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Image.asset(
              reply["image"],
              width: 24,
              height: 24,
            ),
          ],
        ),
      ),
    );
  }
}
