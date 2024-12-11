// ignore_for_file: deprecated_member_use

import 'package:quran_ai/src/config/themes/app_colors.dart';
import 'package:quran_ai/src/config/themes/app_text_styles.dart';
import 'package:quran_ai/src/presentation/blocs/home/home_bloc.dart';
import 'package:quran_ai/src/presentation/widgets/home/juz_view.dart';
import 'package:quran_ai/src/presentation/widgets/home/surah_and_tafseer_view.dart';
import 'package:quran_ai/src/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const String routeName = '/homeScreen';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: state.isLoading
              ? const Center(child: CircularProgressIndicator())
              : DefaultTabController(
                  length: 3,
                  child: NestedScrollView(
                    headerSliverBuilder: (_, bool innerBoxIsScrolled) {
                      return [
                        SliverAppBar(
                          toolbarHeight: size.height * 0.1,
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Visibility(
                                visible: false,
                                child: IconButton(
                                  onPressed: () {},
                                  icon: SvgPicture.asset(
                                    'assets/svg/ic_settings.svg',
                                    color: AppColors.c888888,
                                  ),
                                ),
                              ),
                              const Text(
                                'Qur`oni Karim',
                                style: AppTextStyles.appBarTitle,
                              ),
                              Visibility(
                                visible: false,
                                child: IconButton(
                                  onPressed: () {},
                                  icon: SvgPicture.asset(
                                    'assets/svg/ic_search.svg',
                                    color: AppColors.c888888,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          centerTitle: true,
                        ),
                        SliverToBoxAdapter(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Stack(
                              children: [
                                Material(
                                  elevation: 10,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Oxirgi o`qilgan',
                                        style: AppTextStyles.lastReadText,
                                      ),
                                      const Padding(
                                        padding:
                                            EdgeInsets.only(top: 16, bottom: 0),
                                        child: Text(
                                          'ةحتافلا',
                                          style: AppTextStyles
                                              .lastReadSurahNameText,
                                        ),
                                      ),
                                      SizedBox(
                                        width: size.width * 0.5 - 27,
                                        child: const Text(
                                          'Sura tartib raqami: 1',
                                          style: AppTextStyles
                                              .lastReadSurahNumberText,
                                          softWrap: true,
                                          maxLines: 2,
                                        ),
                                      ),
                                      const Spacer(),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 6),
                                        child: SizedBox(
                                          height: 30,
                                          child: ElevatedButton(
                                            onPressed: () {},
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                const Text(
                                                  'Davom etish',
                                                  style: AppTextStyles
                                                      .continueButtonText,
                                                ),
                                                SvgPicture.asset(
                                                  'assets/svg/ic_arrow_right.svg',
                                                  color: AppColors.c004B40,
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
                        ),
                        SliverAppBar(
                          surfaceTintColor: Colors.transparent,
                          backgroundColor: AppColors.ffffff.withOpacity(0.9),
                          collapsedHeight: kToolbarHeight,
                          toolbarHeight: 50,
                          pinned: true,
                          title: TabBar(
                            physics: const NeverScrollableScrollPhysics(),
                            indicatorSize: TabBarIndicatorSize.tab,
                            indicatorColor: AppColors.c076d59,
                            indicatorWeight: 1,
                            padding: EdgeInsets.zero,
                            labelPadding: EdgeInsets.zero,
                            labelStyle: AppTextStyles.tabBarLabelText,
                            unselectedLabelStyle:
                                AppTextStyles.unselectedTabBarLabelText,
                            unselectedLabelColor:
                                AppColors.c004B40.withOpacity(0.7),
                            indicator: UnderlineTabIndicator(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(
                                color: AppColors.c076d59,
                                width: 2,
                              ),
                            ),
                            dividerColor: AppColors.d9d9d9,
                            tabs: const [
                              Tab(
                                height: 32,
                                iconMargin: EdgeInsets.zero,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Suralar',
                                      textAlign: TextAlign.start,
                                    ),
                                  ],
                                ),
                              ),
                              Tab(
                                text: 'Juzlar',
                                height: 32,
                                iconMargin: EdgeInsets.zero,
                              ),
                              Tab(
                                height: 32,
                                iconMargin: EdgeInsets.zero,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      'Tafsir',
                                      textAlign: TextAlign.start,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ];
                    },
                    body: TabBarView(
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        SurahsAndTafseerView(surahs: state.surahs),
                        JuzView(juzs: AppConstants.juzs),
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
