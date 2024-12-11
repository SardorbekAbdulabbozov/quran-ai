part of 'surah_bloc.dart';

class SurahState extends Equatable {
  final bool isLoading;
  final List<Ayah> ayahs;
  final Surah? surah;

  const SurahState({
    this.isLoading = false,
    this.ayahs = const [],
    this.surah,
  });

  SurahState copyWith({
    bool? isLoading,
    List<Ayah>? ayahs,
    Surah? surah,
  }) {
    return SurahState(
      ayahs: ayahs ?? this.ayahs,
      isLoading: isLoading ?? this.isLoading,
      surah: surah ?? this.surah,
    );
  }

  @override
  List<Object?> get props => [isLoading, ayahs, surah];
}
