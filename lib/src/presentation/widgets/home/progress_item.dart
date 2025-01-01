import 'package:flutter/material.dart';
import 'package:quran_ai/src/config/themes/app_colors.dart';
import 'package:quran_ai/src/config/themes/app_text_styles.dart';

class ProgressItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final Color color;
  final Widget? icon;
  final String? iconPng;

  const ProgressItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.color,
    this.icon,
    this.iconPng,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 50,
          width: 50,
          padding: iconPng != null ? const EdgeInsets.all(10) : null,
          margin: const EdgeInsets.only(right: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: color,
          ),
          child: icon ?? Image.asset(iconPng ?? ''),
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 2),
              child: Text(
                title,
                style: AppTextStyles.s18w500.copyWith(
                  color: AppColors.x343434,
                ),
              ),
            ),
            Text(
              subtitle,
              style: AppTextStyles.s12w400.copyWith(
                color: AppColors.xAAAAAA,
              ),
            ),
          ],
        )
      ],
    );
  }
}
