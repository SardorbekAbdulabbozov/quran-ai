import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:quran_ai/src/domain/models/responses/all_surahs_response.dart';
import 'package:quran_ai/src/domain/repositories/remote_repository.dart';

part 'quran_view_event.dart';

part 'quran_view_state.dart';

class QuranViewBloc extends Bloc<QuranViewEvent, QuranViewState> {
  final RemoteRepository repository;
  List<Surah> surahs = [];

  QuranViewBloc(this.repository) : super(const QuranViewState()) {
    on<GetAllSurahs>(_getAllSurahs);
  }

  Future<void> _getAllSurahs(
    GetAllSurahs event,
    Emitter<QuranViewState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    var result = await repository.getAllSurahs();
    if (result.data is AllSurahsResponse) {
      surahs = result.data?.surahs ?? [];
      emit(state.copyWith(surahs: surahs, isLoading: false));
    } else if (result.error != null) {
      emit(state.copyWith(isLoading: false));
    }
  }
}
