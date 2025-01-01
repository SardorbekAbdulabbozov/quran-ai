part of 'main_bloc.dart';

@immutable
abstract class MainEvent extends Equatable {}

class ChangeIndex extends MainEvent {
  final int index;

  ChangeIndex(this.index);

  @override
  List<Object?> get props => [index];
}
