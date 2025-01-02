import 'package:quran_ai/src/config/themes/app_colors.dart';
import 'package:quran_ai/src/config/themes/app_text_styles.dart';
import 'package:quran_ai/src/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';

class SurahScreenPersistentHeader extends SliverPersistentHeaderDelegate {
  final String surahName;
  final int surahNumber;

  SurahScreenPersistentHeader({
    required this.surahName,
    required this.surahNumber,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final size = MediaQuery.of(context).size;
    return Align(
      child: AppBar(
        toolbarHeight: kToolbarHeight,
        iconTheme: const IconThemeData(color: Colors.white),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/png/ic_quran_cut.png'),
              opacity: 0.2,
              alignment: Alignment.bottomRight,
            ),
            gradient: LinearGradient(
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
                  Divider(
                    thickness: 0,
                    indent: (size.width - 144) * 0.15,
                    endIndent: (size.width - 144) * 0.15,
                    color: Colors.white.withOpacity(0.3),
                  ),
                  Text(
                    AppConstants.surahNamesUz[surahNumber - 1],
                    style: AppTextStyles.s24w700.copyWith(
                      color: AppColors.xFFFFFF,
                    ),
                  ),
                ],
              ),
            ),
            // const SizedBox(width: 56),
          ],
        ),
      ),
    );
  }

  @override
  double get maxExtent => 2.5 * kToolbarHeight;

  @override
  double get minExtent => 2.5 * kToolbarHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}
