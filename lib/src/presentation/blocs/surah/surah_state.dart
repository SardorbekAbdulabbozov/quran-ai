part of 'surah_bloc.dart';

class SurahState extends Equatable {
  final int fontSize;
  final bool isLoading;
  final List<Ayah> ayahs;
  final Surah? surah;
  final ReadMode readMode;
  final PageTheme theme;
  final num surahStartingPage;
  final int? currentPage;
  final PageController? pageController;
  final bool showPageControls;

  const SurahState({
    this.fontSize = 22,
    this.isLoading = false,
    this.ayahs = const [],
    this.surah,
    this.readMode = ReadMode.ayahByAyah,
    this.theme = PageTheme.light,
    this.surahStartingPage = 1,
    this.currentPage,
    this.pageController,
    this.showPageControls = false,
  });

  SurahState copyWith({
    int? fontSize,
    bool? isLoading,
    List<Ayah>? ayahs,
    Surah? surah,
    ReadMode? readMode,
    PageTheme? theme,
    num? surahStartingPage,
    int? currentPage,
    PageController? pageController,
    bool? showPageControls,
  }) {
    return SurahState(
      fontSize: fontSize ?? this.fontSize,
      isLoading: isLoading ?? this.isLoading,
      ayahs: ayahs ?? this.ayahs,
      surah: surah ?? this.surah,
      readMode: readMode ?? this.readMode,
      theme: theme ?? this.theme,
      surahStartingPage: surahStartingPage ?? this.surahStartingPage,
      currentPage: currentPage ?? this.currentPage,
      pageController: pageController ?? this.pageController,
      showPageControls: showPageControls ?? this.showPageControls,
    );
  }

  @override
  List<Object?> get props => [
        fontSize,
        isLoading,
        ayahs,
        surah,
        readMode,
        theme,
        surahStartingPage,
        currentPage,
        pageController,
        showPageControls,
      ];
}

enum ReadMode { book, ayahByAyah }

enum PageTheme { light, dark }
