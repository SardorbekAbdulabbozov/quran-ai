import 'package:flutter/material.dart';
import 'package:quran_ai/src/config/themes/app_colors.dart';
import 'package:quran_ai/src/presentation/widgets/chat/message_item.dart';

class TypingAnimation extends StatelessWidget {
  const TypingAnimation({
    super.key,
    required Animation<int> typingAnimation,
  }) : _typingAnimation = typingAnimation;

  final Animation<int> _typingAnimation;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 3),
          child: Stack(
            alignment: Alignment.bottomLeft,
            children: [
              CustomPaint(
                size: const Size(10, 10),
                painter: RightTrianglePainter(
                  color: AppColors.xF0F0F0,
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  color: AppColors.xF0F0F0,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                    bottomLeft: Radius.zero,
                    bottomRight: Radius.circular(8),
                  ),
                ),
                padding: const EdgeInsets.all(12),
                margin: const EdgeInsets.symmetric(horizontal: 6),
                child: SizedBox(
                  height: 8,
                  child: AnimatedBuilder(
                    animation: _typingAnimation,
                    builder: (context, _) {
                      return ListView.separated(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (_, i) {
                          return CircleAvatar(
                            radius: 4,
                            backgroundColor: i == _typingAnimation.value
                                ? AppColors.x9B9B9B
                                : AppColors.xCDCDCD,
                          );
                        },
                        separatorBuilder: (_, i) => const SizedBox(width: 4),
                        itemCount: 3,
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
