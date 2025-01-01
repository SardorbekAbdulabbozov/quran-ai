import 'package:quran_ai/src/config/themes/app_colors.dart';
import 'package:quran_ai/src/config/themes/app_text_styles.dart';
import 'package:quran_ai/src/domain/models/juz.dart';
import 'package:flutter/material.dart';

class JuzView extends StatelessWidget {
  const JuzView({super.key, required this.juzs});

  final List<Juz> juzs;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemBuilder: (_, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16)
              .copyWith(bottom: index + 1 == juzs.length ? 16 : 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 36,
                height: 36,
                margin: const EdgeInsets.only(right: 16),
                decoration: BoxDecoration(
                  color: AppColors.x87D1A4,
                  borderRadius: BorderRadius.circular(9),
                ),
                child: Center(
                  child: Text(
                    '${index + 1}',
                    style: AppTextStyles.s16w400.copyWith(
                      color: AppColors.xFFFFFF,
                    ),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    juzs[index].startingSurahName,
                    style: AppTextStyles.s14w400.copyWith(
                      color: AppColors.x000000,
                    ),
                  ),
                  Text(
                    '${juzs[index].startingAyahNumber}-oyatdan boshlanadi',
                    style: AppTextStyles.s12w400.copyWith(
                      color: AppColors.x858585,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
      itemCount: juzs.length,
      separatorBuilder: (_, i) {
        return const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Divider(
            height: 32,
            thickness: 0,
          ),
        );
      },
    );
  }
}
