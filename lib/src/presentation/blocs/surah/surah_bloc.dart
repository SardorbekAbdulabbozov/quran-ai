import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_ai/src/domain/models/responses/single_surah_response.dart';
import 'package:quran_ai/src/domain/repositories/remote_repository.dart';
import 'package:equatable/equatable.dart';

part 'surah_event.dart';

part 'surah_state.dart';

class SurahBloc extends Bloc<SurahEvent, SurahState> {
  final RemoteRepository repositoryImpl;

  SurahBloc(this.repositoryImpl) : super(const SurahState()) {
    on<GetSingleSurah>(_getSingleSurah);
  }

  Future<void> _getSingleSurah(
    GetSingleSurah event,
    Emitter<SurahState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    var result = await repositoryImpl.getSingleSurah(event.surahIndex);
    if (result.data is SingleSurahResponse) {
      emit(
        state.copyWith(
          isLoading: false,
          ayahs: result.data?.surah?.ayahs ?? [],
          surah: result.data?.surah,
        ),
      );
    } else if (result.error != null) {
      emit(state.copyWith(isLoading: false));
    }
  }
}
