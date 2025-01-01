part of 'quran_view_bloc.dart';

sealed class QuranViewEvent extends Equatable {
  const QuranViewEvent();
}

class GetAllSurahs extends QuranViewEvent {
  @override
  List<Object?> get props => [];
}
