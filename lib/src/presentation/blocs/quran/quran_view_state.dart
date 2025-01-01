part of 'quran_view_bloc.dart';

class QuranViewState extends Equatable {
  final bool isLoading;
  final List<Surah> surahs;

  const QuranViewState({
    this.isLoading = false,
    this.surahs = const [],
  });

  QuranViewState copyWith({
    int? index,
    bool? isLoading,
    List<Surah>? surahs,
  }) {
    return QuranViewState(
      isLoading: isLoading ?? this.isLoading,
      surahs: surahs ?? this.surahs,
    );
  }

  @override
  List<Object?> get props => [isLoading, surahs];
}
