import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quran_ai/src/config/themes/app_colors.dart';
import 'package:quran_ai/src/config/themes/app_text_styles.dart';
import 'package:quran_ai/src/presentation/blocs/surah/surah_bloc.dart';
import 'package:quran_ai/src/utils/components/loading_builder.dart';
import 'package:quran_ai/src/utils/constants/app_constants.dart';
import 'package:quran_ai/src/utils/extensions/arabic_number.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_ai/src/utils/resources/icon/app_icons.dart';
import 'package:quran_ai/src/presentation/widgets/surah/surah_settings_bottom_sheet.dart';

class SurahScreen extends StatelessWidget {
  const SurahScreen({
    super.key,
    required this.surahIndex,
    required this.surahName,
  });

  final String surahIndex;
  final String surahName;
  static const String routeName = '/surahScreen';

  @override
  Widget build(BuildContext context) {
    final int surahIndexInteger = int.tryParse(surahIndex) ?? 1;
    final size = MediaQuery.of(context).size;
    final bloc = context.read<SurahBloc>();
    return BlocConsumer<SurahBloc, SurahState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarBrightness: Brightness.dark,
              systemNavigationBarIconBrightness: Brightness.dark,
            ),
            toolbarHeight: kToolbarHeight * 1.5,
            actions: [
              IconButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    backgroundColor: Colors.white,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16),
                      ),
                    ),
                    builder: (_) {
                      return SurahSettingsBottomSheet(
                        bloc: bloc,
                        onReadModeChanged: (index) {
                          bloc.add(ChangeReadMode(index));
                        },
                        onThemeChanged: (index) {
                          bloc.add(ChangeTheme(index));
                        },
                        onFontSizeChanged: (size) {
                          bloc.add(ChangeFontSize(size));
                        },
                      );
                    },
                  );
                },
                icon: const Icon(
                  App.setting,
                  color: AppColors.xFFFFFF,
                  size: 30,
                ),
              ),
            ],
            iconTheme: const IconThemeData(color: Colors.white),
            flexibleSpace: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/png/ic_quran_cut.png'),
                      opacity: 0.1,
                      alignment: Alignment.bottomRight,
                    ),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [AppColors.x004B40, AppColors.x87D1A4],
                    ),
                  ),
                ),
                SafeArea(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        surahName,
                        style: AppTextStyles.s20w700.copyWith(
                          fontFamily: 'Amiri',
                          color: AppColors.xFFFFFF,
                        ),
                      ),
                      Divider(
                        thickness: 0,
                        indent: size.width * 0.30,
                        endIndent: size.width * 0.30,
                        color: Colors.white.withOpacity(0.3),
                      ),
                      Text(
                        AppConstants.surahNamesUz[surahIndexInteger - 1],
                        style: AppTextStyles.s18w700.copyWith(
                          color: AppColors.xFFFFFF,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            centerTitle: true,
          ),
          body: LoadingBuilder(
            isLoading: state.isLoading,
            child: state.readMode == ReadMode.book
                ? Stack(
                    children: [
                      SafeArea(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 16, bottom: 40),
                          child: InkWell(
                            overlayColor: const WidgetStatePropertyAll(
                              Colors.transparent,
                            ),
                            onTap: () => bloc.add(ShowHidePageControls()),
                            child: Column(
                              children: [
                                Expanded(
                                  child: PageView(
                                    reverse: true,
                                    physics: const ClampingScrollPhysics(),
                                    onPageChanged: (p) {
                                      bloc.add(ChangePage(p + 1));
                                    },
                                    controller: state.pageController,
                                    children: List.generate(
                                      AppConstants.totalNumberOfPages,
                                      (index) {
                                        return Image.asset(
                                          'assets/quran_images/${index + 1}.png',
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: AnimatedOpacity(
                          opacity: state.showPageControls ? 1 : 0,
                          duration: const Duration(milliseconds: 500),
                          child: ColoredBox(
                            color: AppColors.x004B40,
                            child: SafeArea(
                              child: SizedBox(
                                height: 40,
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 16),
                                      child: SizedBox(
                                        width: 40,
                                        child: Text(
                                          "${state.currentPage}",
                                          textAlign: TextAlign.center,
                                          style: AppTextStyles.s16w500.copyWith(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Directionality(
                                        textDirection: TextDirection.rtl,
                                        child: Slider(
                                          value:
                                              (state.currentPage ?? 1).toDouble(),
                                          min: 1,
                                          max: AppConstants.totalNumberOfPages
                                              .toDouble(),
                                          activeColor: AppColors.xEDEEF1,
                                          thumbColor: AppColors.xFFD08A,
                                          inactiveColor: AppColors.xEDEEF1,
                                          divisions:
                                              AppConstants.totalNumberOfPages,
                                          allowedInteraction:
                                              SliderInteraction.tapAndSlide,
                                          onChanged: (i) => bloc.add(
                                            ChangePage(
                                              i.toInt(),
                                              isFromSlider: true,
                                            ),
                                          ),
                                        ),
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
                  )
                : CustomScrollView(
                    slivers: [
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                          childCount: state.ayahs.length,
                          (context, index) {
                            return Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                  ),
                                  child: SizedBox(
                                    width: size.width - 32,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: 45,
                                          height: 45,
                                          child: Stack(
                                            alignment: Alignment.center,
                                            children: [
                                              Image.asset(
                                                'assets/png/ic_ayah_index.png',
                                              ),
                                              Text(
                                                (index + 1)
                                                    .toString()
                                                    .toArabicNumbers(),
                                                style: AppTextStyles.s12w700
                                                    .copyWith(
                                                  height: 0,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                        Flexible(
                                          child: Text(
                                            '\n${state.ayahs[index].text}',
                                            style:
                                                AppTextStyles.s22w700.copyWith(
                                              fontFamily: 'Amiri Quran',
                                              height:
                                                  state.fontSize > 30 ? 3 : 2,
                                              fontSize:
                                                  state.fontSize.toDouble(),
                                            ),
                                            textAlign: TextAlign.end,
                                            textDirection: TextDirection.ltr,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const Divider(thickness: 0, height: 0),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
          ),
        );
      },
    );
  }
}
