import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:quran_ai/src/config/themes/app_colors.dart';
import 'package:quran_ai/src/config/themes/app_text_styles.dart';
import 'package:quran_ai/src/presentation/blocs/surah/surah_bloc.dart';
import 'package:quran_ai/src/utils/resources/icon/app_icons.dart';

class SurahSettingsBottomSheet extends StatefulWidget {
  const SurahSettingsBottomSheet({
    super.key,
    this.onThemeChanged,
    this.onReadModeChanged,
    this.onFontSizeChanged,
    required this.bloc,
  });

  final SurahBloc bloc;
  final void Function(int)? onThemeChanged;
  final void Function(int)? onReadModeChanged;
  final void Function(int)? onFontSizeChanged;

  @override
  State<SurahSettingsBottomSheet> createState() =>
      _SurahSettingsBottomSheetState();
}

class _SurahSettingsBottomSheetState extends State<SurahSettingsBottomSheet>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocBuilder<SurahBloc, SurahState>(
      bloc: widget.bloc,
      builder: (context, state) {
        return SizedBox(
          width: size.width,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: AppColors.x000000.withOpacity(0.05),
                    ),
                  ),
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Text(
                      'Settings',
                      style: AppTextStyles.s18w600.copyWith(
                        color: AppColors.x000000,
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: context.pop,
                        child: Container(
                          height: 24,
                          width: 24,
                          margin: const EdgeInsets.all(16),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.xEDEEF1,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                spreadRadius: 0,
                                blurRadius: 10,
                              ),
                            ],
                          ),
                          child: const Icon(
                            Icons.close_rounded,
                            size: 14,
                            color: AppColors.x5F5F5F,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: AppColors.x000000.withOpacity(0.05),
                    ),
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 12),
                        child: Text(
                          'Read mode',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyles.s16w600.copyWith(
                            color: AppColors.x000000,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: ColoredBox(
                          color: AppColors.x87D1A4.withOpacity(0.15),
                          child: Padding(
                            padding: const EdgeInsets.all(4),
                            child: TabBar(
                              onTap: widget.onReadModeChanged,
                              controller: TabController(
                                length: 2,
                                vsync: this,
                                initialIndex: state.readMode.index,
                              ),
                              indicatorSize: TabBarIndicatorSize.tab,
                              physics: const NeverScrollableScrollPhysics(),
                              labelPadding: const EdgeInsets.only(top: 4),
                              labelStyle: AppTextStyles.s14w600.copyWith(
                                color: AppColors.xFFFFFF,
                              ),
                              unselectedLabelStyle:
                                  AppTextStyles.s14w600.copyWith(
                                color: AppColors.x004B40,
                              ),
                              indicator: ShapeDecoration(
                                color: AppColors.x004B40.withOpacity(0.9),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100),
                                ),
                              ),
                              dividerColor: AppColors.transparent,
                              overlayColor: WidgetStatePropertyAll(
                                AppColors.transparent,
                              ),
                              tabs: const [
                                Tab(
                                  height: 32,
                                  iconMargin: EdgeInsets.zero,
                                  icon: Icon(App.quran),
                                ),
                                Tab(
                                  height: 32,
                                  iconMargin: EdgeInsets.zero,
                                  icon: Icon(App.alignJustify),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: AppColors.x000000.withOpacity(0.05),
                    ),
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 12),
                        child: Text(
                          'Theme',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyles.s16w600.copyWith(
                            color: AppColors.x000000,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: ColoredBox(
                          color: AppColors.x87D1A4.withOpacity(0.15),
                          child: Padding(
                            padding: const EdgeInsets.all(4),
                            child: TabBar(
                              onTap: widget.onThemeChanged,
                              controller: TabController(
                                length: 2,
                                vsync: this,
                                initialIndex: state.theme.index,
                              ),
                              indicatorSize: TabBarIndicatorSize.tab,
                              physics: const NeverScrollableScrollPhysics(),
                              labelPadding: const EdgeInsets.only(top: 4),
                              labelStyle: AppTextStyles.s14w600.copyWith(
                                color: AppColors.xFFFFFF,
                              ),
                              unselectedLabelStyle:
                                  AppTextStyles.s14w600.copyWith(
                                color: AppColors.x004B40,
                              ),
                              indicator: ShapeDecoration(
                                color: AppColors.x004B40.withOpacity(0.9),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100),
                                ),
                              ),
                              dividerColor: AppColors.transparent,
                              overlayColor: WidgetStatePropertyAll(
                                AppColors.transparent,
                              ),
                              tabs: const [
                                Tab(
                                  height: 32,
                                  iconMargin: EdgeInsets.zero,
                                  icon: Icon(App.lightMode),
                                ),
                                Tab(
                                  height: 32,
                                  iconMargin: EdgeInsets.zero,
                                  icon: Icon(App.nightMode),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  bottom: Platform.isAndroid ? 16 : 0,
                ),
                child: SafeArea(
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 500),
                    opacity: state.readMode == ReadMode.ayahByAyah ? 1 : 0,
                    child: Visibility(
                      visible: state.readMode == ReadMode.ayahByAyah,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Padding(
                                padding: const EdgeInsets.only(right: 12),
                                child: Text(
                                  'Font size (${state.fontSize})',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: AppTextStyles.s16w600.copyWith(
                                    color: AppColors.x000000,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Slider(
                                value: state.fontSize.toDouble(),
                                min: 14,
                                max: 40,
                                onChanged: (value) {
                                  widget.onFontSizeChanged?.call(value.toInt());
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
