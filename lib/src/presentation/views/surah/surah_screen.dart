import 'package:flutter/material.dart';
import 'package:quran_ai/src/config/themes/app_colors.dart';
import 'package:quran_ai/src/config/themes/app_text_styles.dart';
import 'package:quran_ai/src/presentation/blocs/surah/surah_bloc.dart';
import 'package:quran_ai/src/presentation/widgets/surah/surah_page_persistent_header.dart';
import 'package:quran_ai/src/utils/extensions/arabic_number.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    final size = MediaQuery.of(context).size;
    return BlocConsumer<SurahBloc, SurahState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: state.isLoading
              ? const Center(child: CircularProgressIndicator())
              : CustomScrollView(
                  slivers: [
                    SliverPersistentHeader(
                      pinned: true,
                      delegate: SurahPagePersistentHeader(
                        surahName: surahName,
                        surahNumber: (int.tryParse(surahIndex) ?? 1),
                      ),
                    ),
                    if ((int.tryParse(surahIndex) ?? 1) != 1)
                      SliverToBoxAdapter(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 16),
                              child: Image.asset(
                                'assets/png/ic_basmala.png',
                                color: AppColors.assets,
                                scale: 15,
                              ),
                            ),
                            const Divider(thickness: 0, height: 0),
                          ],
                        ),
                      ),
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        childCount: state.ayahs.length,
                        (context, index) {
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
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
                                              style: AppTextStyles.ayahIndex,
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Flexible(
                                        child: Text(
                                          '\n${state.ayahs[index].text}',
                                          style: AppTextStyles.ayahText,
                                          textAlign: TextAlign.end,
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
        );
      },
    );
  }
}
