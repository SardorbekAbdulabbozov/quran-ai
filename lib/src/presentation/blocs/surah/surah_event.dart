part of 'surah_bloc.dart';

abstract class SurahEvent extends Equatable{}

class GetSingleSurah extends SurahEvent {
  final int surahIndex;

  GetSingleSurah({required this.surahIndex});

  @override
  List<Object?> get props => [];
}
