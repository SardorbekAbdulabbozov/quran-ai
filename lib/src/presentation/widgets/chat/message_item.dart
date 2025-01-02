import 'package:flutter/material.dart';
import 'package:quran_ai/src/config/themes/app_colors.dart';
import 'package:quran_ai/src/config/themes/app_text_styles.dart';

class MessageItem extends StatelessWidget {
  const MessageItem({
    super.key,
    required this.action,
    required this.content,
    required this.isMe,
    required this.isFailure,
    this.isLastInMessageQueue = true,
    required this.messageKey,
  });

  final void Function() action;
  final String content;
  final bool isMe;
  final bool isFailure;
  final bool isLastInMessageQueue;
  final Key messageKey;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Row(
      children: [
        if (isMe) const Spacer(),
        Stack(
          alignment: Alignment.bottomRight,
          children: [
            Padding(
              padding: EdgeInsets.only(
                right: 12,
                left: 12,
                top: isMe ? 12 : 0,
                bottom: isMe ? 12 : 6,
              ),
              child: Stack(
                alignment: isMe ? Alignment.bottomRight : Alignment.bottomLeft,
                children: [
                  if (isLastInMessageQueue)
                    RotatedBox(
                      quarterTurns: isMe ? 1 : 0,
                      child: CustomPaint(
                        size: const Size(10, 10),
                        painter: RightTrianglePainter(
                          color: isMe ? AppColors.xFFD08A : AppColors.xF0F0F0,
                        ),
                      ),
                    ),
                  GestureDetector(
                    onTap: action,
                    child: Container(
                      key: messageKey,
                      decoration: BoxDecoration(
                        color: isMe ? AppColors.xFFD08A : AppColors.xF0F0F0,
                        borderRadius: BorderRadius.only(
                          topLeft: const Radius.circular(8),
                          topRight: const Radius.circular(8),
                          bottomLeft: (!isMe && isLastInMessageQueue)
                              ? Radius.zero
                              : const Radius.circular(8),
                          bottomRight: (isMe && isLastInMessageQueue)
                              ? Radius.zero
                              : const Radius.circular(8),
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                      margin: const EdgeInsets.symmetric(horizontal: 6),
                      child: Container(
                        constraints:
                            BoxConstraints(maxWidth: size.width * 2 / 3),
                        child: Text(
                          content,
                          style: AppTextStyles.s14w400.copyWith(
                            color: AppColors.x000000,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class RightTrianglePainter extends CustomPainter {
  final Color color;

  RightTrianglePainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;

    final path = Path();
    path.moveTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
