import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quran_ai/src/config/themes/app_colors.dart';
import 'package:quran_ai/src/config/themes/app_text_styles.dart';
import 'package:quran_ai/src/presentation/widgets/home/progress_item.dart';
import 'package:quran_ai/src/utils/resources/icon/app_icons.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Stack(
              children: [
                Material(
                  elevation: 0,
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(23),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(23),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: SvgPicture.asset(
                      'assets/svg/ic_home_card.svg',
                      fit: BoxFit.cover,
                      width: size.width,
                      height: 170 * size.width / 345,
                    ),
                  ),
                ),
                Positioned(
                  height: size.width / 2.03 - 54,
                  left: 27,
                  top: 27,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Oxirgi o`qilgan',
                        style: AppTextStyles.s12w400.copyWith(
                          color: AppColors.xFAF6EB,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 16,
                          bottom: 0,
                        ),
                        child: Text(
                          'ةحتافلا',
                          style: AppTextStyles.s24w700.copyWith(
                            fontFamily: 'Amiri',
                            color: AppColors.xFFFFFF,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.5 - 27,
                        child: Text(
                          'Sura tartib raqami: 1',
                          style: AppTextStyles.s12w300.copyWith(
                            color: AppColors.xFFFFFF,
                          ),
                          softWrap: true,
                          maxLines: 2,
                        ),
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 6),
                        child: SizedBox(
                          height: 30,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: const ButtonStyle(
                              backgroundColor: WidgetStatePropertyAll(
                                AppColors.xFAF6EB,
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Davom etish',
                                  style: AppTextStyles.s12w400.copyWith(
                                    color: AppColors.x000000,
                                  ),
                                ),
                                SvgPicture.asset(
                                  'assets/svg/ic_arrow_right.svg',
                                  colorFilter: const ColorFilter.mode(
                                    AppColors.x004B40,
                                    BlendMode.srcIn,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: Text(
                  'Your progress',
                  style:
                      AppTextStyles.s16w500.copyWith(color: AppColors.x000000),
                ),
              ),
              ProgressItem(
                title: "Listening",
                subtitle: "Yasin: Surah 23",
                color: AppColors.xFB6617.withOpacity(0.75),
                iconPng: 'assets/png/ic_quran_writing.png',
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: ProgressItem(
                  title: "Reciting",
                  subtitle: "75% yakunlandi",
                  color: AppColors.x7676D1.withOpacity(0.75),
                  icon: const Icon(
                    App.salah,
                    size: 32,
                    color: AppColors.xFFFFFF,
                  ),
                ),
              ),
              ProgressItem(
                title: "Memorization",
                subtitle: "12% yakunlandi",
                color: AppColors.x2BD2AB.withOpacity(0.75),
                icon: const Icon(App.idea, size: 32),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hadith of the day',
                  style:
                      AppTextStyles.s16w500.copyWith(color: AppColors.x000000),
                ),
                Container(
                  padding: const EdgeInsets.all(16),
                  margin: const EdgeInsets.only(top: 6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: AppColors.x004B40.withOpacity(0.05),
                    border: Border.all(color: AppColors.x004B40),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: Text(
                          'The Prophet (ﷺ) said: "The reward of deeds depends upon the intentions, and every person will get the reward according to what he has intended. So whoever emigrated for worldly benefits or for a woman to marry, his emigration was for what he emigrated for."',
                          style: AppTextStyles.s14w500.copyWith(
                            color: AppColors.x000000,
                          ),
                        ),
                      ),
                      Text(
                        '(Sahih al-Bukhari, Book 1, Hadith 1)',
                        style: AppTextStyles.s14w500.copyWith(
                          color: AppColors.x000000,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
