part of 'surah_bloc.dart';

abstract class SurahEvent extends Equatable {}

class GetSingleSurah extends SurahEvent {
  final int surahIndex;

  GetSingleSurah({required this.surahIndex});

  @override
  List<Object?> get props => [];
}

class ShowHidePageControls extends SurahEvent {
  @override
  List<Object?> get props => [];
}

class ChangePage extends SurahEvent {
  final int pageNumber;
  final bool isFromSlider;

  ChangePage(this.pageNumber, {this.isFromSlider = false});

  @override
  List<Object?> get props => [];
}

class ChangeFontSize extends SurahEvent {
  final int size;

  ChangeFontSize(this.size);

  @override
  List<Object?> get props => [];
}

class ChangeTheme extends SurahEvent {
  final int index;

  ChangeTheme(this.index);

  @override
  List<Object?> get props => [];
}

class ChangeReadMode extends SurahEvent {
  final int index;

  ChangeReadMode(this.index);

  @override
  List<Object?> get props => [];
}
