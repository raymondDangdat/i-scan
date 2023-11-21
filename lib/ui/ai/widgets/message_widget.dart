import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:share_plus/share_plus.dart';

import '../../../Utils/functions.dart';
import 'icon_btn_widget.dart';

class MessageWidget extends StatelessWidget {
  final String message;
  final bool isUser;
  final VoidCallback? redo;

  const MessageWidget({
    required this.message,
    super.key,
    this.isUser = false,
    this.redo,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.7,
        ),
        padding: const EdgeInsets.all(16),
        decoration: ShapeDecoration(
          color: isUser ? const Color(0xFF01A374) : const Color(0x19EEF5FF),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
              bottomRight: Radius.circular(16),
            ),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              message,
              style: TextStyle(
                color: isUser ? Colors.white : Colors.white.withOpacity(0.6),
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 8),
            // if (isUser )
            Row(
              children: [
                IconBtnWidget(
                  text: 'Copy',
                  icon: Iconsax.copy,
                  onTap: () => copyToClipboard(message),
                ),
                const SizedBox(width: 8),
                IconBtnWidget(
                  text: 'Share',
                  icon: Iconsax.share,
                  onTap: () => Share.share(message),
                ),
                const SizedBox(width: 8),
                if (isUser && redo != null)
                  IconBtnWidget(
                    text: 'Re-ask',
                    icon: Iconsax.redo,
                    onTap: redo,
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
