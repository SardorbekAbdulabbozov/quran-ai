part of 'main_bloc.dart';

class MainState extends Equatable {
  final int index;
  final bool isLoading;

  const MainState({
    this.index = 0,
    this.isLoading = false,
  });

  MainState copyWith({
    int? index,
    bool? isLoading,
  }) {
    return MainState(
      index: index ?? this.index,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [index, isLoading];
}
