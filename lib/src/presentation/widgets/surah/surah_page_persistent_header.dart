import 'dart:math';
import 'package:quran_ai/src/config/themes/app_colors.dart';
import 'package:quran_ai/src/config/themes/app_text_styles.dart';
import 'package:quran_ai/src/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';

class SurahPagePersistentHeader extends SliverPersistentHeaderDelegate {
  final String surahName;
  final int surahNumber;

  SurahPagePersistentHeader({
    required this.surahName,
    required this.surahNumber,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final size = MediaQuery.of(context).size;
    double shrinkPercentage = min(1, shrinkOffset / (maxExtent - minExtent));
    return Align(
      child: AppBar(
        toolbarHeight: shrinkPercentage == 0 ? 128 : kToolbarHeight,
        iconTheme: const IconThemeData(color: Colors.white),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            image: shrinkPercentage != 0
                ? null
                : const DecorationImage(
                    image: AssetImage('assets/png/ic_quran_cut.png'),
                    opacity: 0.2,
                    alignment: Alignment.bottomRight,
                  ),
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [AppColors.x004B40, AppColors.x87D1A4],
            ),
          ),
        ),
        centerTitle: true,
        title: Row(
          children: [
            SizedBox(
              width: size.width - 144,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    surahName,
                    style: AppTextStyles.s24w700.copyWith(
                      fontFamily: 'Amiri',
                      color: AppColors.xFFFFFF,
                    ),
                  ),
                  if (shrinkPercentage == 0)
                    Divider(
                      thickness: 0,
                      indent: (size.width - 144) * 0.15,
                      endIndent: (size.width - 144) * 0.15,
                      color: Colors.white.withOpacity(0.3),
                    ),
                  if (shrinkPercentage == 0)
                    Text(
                      AppConstants.surahNamesUz[surahNumber - 1],
                      style: AppTextStyles.s24w700.copyWith(
                        color: AppColors.xFFFFFF,
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(width: 56),
          ],
        ),
      ),
    );
  }

  @override
  double get maxExtent => 2.5 * kToolbarHeight;

  @override
  double get minExtent => kToolbarHeight + 32;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}
