import 'package:quran_ai/src/config/themes/app_colors.dart';
import 'package:flutter/cupertino.dart';

class AppTextStyles {
  static const appBarTitle = TextStyle(
    fontFamily: 'Inter',
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: AppColors.assets,
  );

  static const lastReadText = TextStyle(
    fontFamily: 'Inter',
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.faf6eb,
  );

  static const lastReadSurahNumberText = TextStyle(
    fontFamily: 'Inter',
    fontSize: 12,
    fontWeight: FontWeight.w300,
    color: AppColors.faf6eb,
  );

  static const lastReadSurahNameText = TextStyle(
    fontFamily: 'Inter',
    fontSize: 24,
    fontWeight: FontWeight.w700,
    color: AppColors.ffffff,
  );

  static const continueButtonText = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.c000000,
  );

  static const tabBarLabelText = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: AppColors.c066C58,
  );

  static TextStyle unselectedTabBarLabelText = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.c004B40.withOpacity(0.7),
  );

  static const surahIndexText = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.ffffff,
  );

  static const surahNameUzText = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.c000000,
  );

  static const surahInfoText = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.c858585,
  );

  static const surahNameArText = TextStyle(
    fontFamily: 'Noto Naskh Arabic',
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: AppColors.c076C58,
  );

  static const surahNameAppBarText = TextStyle(
    fontFamily: 'Noto Naskh Arabic',
    fontSize: 24,
    fontWeight: FontWeight.w700,
    color: AppColors.ffffff,
  );

  static const ayahText = TextStyle(
    fontFamily: 'Noto Naskh Arabic',
    fontSize: 22,
    fontWeight: FontWeight.w700,
    color: AppColors.assets,
    height: 1.5,
  );

  static const ayahIndex = TextStyle(
    fontFamily: 'Noto Naskh Arabic',
    fontSize: 12,
    fontWeight: FontWeight.w700,
    color: AppColors.assets,
    height: 0,
  );
}
