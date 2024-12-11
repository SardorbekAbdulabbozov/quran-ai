part of 'home_bloc.dart';

class HomeState extends Equatable {
  final bool isLoading;
  final List<Surah> surahs;

  const HomeState({
    this.isLoading = false,
    this.surahs = const [],
  });

  HomeState copyWith({
    List<Surah>? surahs,
    bool? isLoading,
  }) {
    return HomeState(
      isLoading: isLoading ?? this.isLoading,
      surahs: surahs ?? this.surahs,
    );
  }

  @override
  List<Object?> get props => [isLoading, surahs];
}
