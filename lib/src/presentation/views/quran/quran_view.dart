import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_ai/src/config/themes/app_colors.dart';
import 'package:quran_ai/src/config/themes/app_text_styles.dart';
import 'package:quran_ai/src/presentation/blocs/quran/quran_view_bloc.dart';
import 'package:quran_ai/src/presentation/widgets/main/surah_and_tafseer_view.dart';
import 'package:quran_ai/src/utils/components/loading_builder.dart';

class QuranView extends StatelessWidget {
  const QuranView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuranViewBloc, QuranViewState>(
      builder: (context, state) {
        return LoadingBuilder(
          isLoading: state.isLoading,
          child: DefaultTabController(
            length: 2,
            child: NestedScrollView(
              headerSliverBuilder: (_, bool innerBoxIsScrolled) {
                return [
                  SliverAppBar(
                    surfaceTintColor: Colors.transparent,
                    backgroundColor: AppColors.xFFFFFF.withOpacity(0.9),
                    collapsedHeight: kToolbarHeight,
                    toolbarHeight: 50,
                    pinned: true,
                    title: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: ColoredBox(
                        color: AppColors.x87D1A4.withOpacity(0.15),
                        child: Padding(
                          padding: const EdgeInsets.all(4),
                          child: TabBar(
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
                                text: 'Recitation',
                              ),
                              Tab(
                                height: 32,
                                iconMargin: EdgeInsets.zero,
                                text: 'Tajweed',
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    bottom: PreferredSize(
                      preferredSize: const Size.fromHeight(1),
                      child: Divider(
                        height: 0,
                        color: AppColors.x000000.withOpacity(0.1),
                      ),
                    ),
                  )
                ];
              },
              body: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  SurahsAndTafseerView(surahs: state.surahs),
                  // JuzView(juzs: AppConstants.juzs),
                  SurahsAndTafseerView(surahs: state.surahs),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
