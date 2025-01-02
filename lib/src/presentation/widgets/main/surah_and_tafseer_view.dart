import 'package:go_router/go_router.dart';
import 'package:quran_ai/src/config/themes/app_colors.dart';
import 'package:quran_ai/src/config/themes/app_text_styles.dart';
import 'package:quran_ai/src/domain/models/responses/all_surahs_response.dart';
import 'package:flutter/material.dart';
import 'package:quran_ai/src/presentation/views/surah/surah_screen.dart';
import 'package:quran_ai/src/utils/constants/app_constants.dart';

class SurahsAndTafseerView extends StatelessWidget {
  const SurahsAndTafseerView({super.key, required this.surahs});

  final List<Surah> surahs;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(16),
      itemBuilder: (_, index) {
        return InkWell(
          onTap: () {
            context.pushNamed(
              SurahScreen.routeName,
              extra: {
                "surahIndex": "${index + 1}",
                "surahName": surahs[index].name ?? '',
                // "pageNumber": surahs[index]. ?? '',
              },
            );
          },
          overlayColor: const WidgetStatePropertyAll(Colors.transparent),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 36,
                height: 36,
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
              SizedBox(
                width: MediaQuery.of(context).size.width - 32 - 36 - 16,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            AppConstants.surahNamesUz[index],
                            style: AppTextStyles.s14w400.copyWith(
                              color: AppColors.x000000,
                            ),
                          ),
                          Text(
                            '${AppConstants.revelation[surahs[index].revelationType]}, ${surahs[index].numberOfAyahs} oyat',
                            style: AppTextStyles.s12w400.copyWith(
                              color: AppColors.x858585,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      surahs[index].name ?? '',
                      style: AppTextStyles.s20w700.copyWith(
                        fontFamily: 'Amiri',
                        color: AppColors.x076C58,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
      itemCount: surahs.length,
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
