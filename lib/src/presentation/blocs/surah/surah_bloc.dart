import 'dart:async';
import 'package:flutter/material.dart';
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
    on<ShowHidePageControls>(_showHidePageControls);
    on<ChangePage>(_changePage);
    on<ChangeReadMode>(_changeReadMode);
    on<ChangeTheme>(_changeTheme);
    on<ChangeFontSize>(
      (event, emit) => emit(state.copyWith(fontSize: event.size)),
    );
  }

  void _showHidePageControls(
    ShowHidePageControls event,
    Emitter<SurahState> emit,
  ) async {
    emit(state.copyWith(showPageControls: !state.showPageControls));
  }

  void _changeReadMode(
    ChangeReadMode event,
    Emitter<SurahState> emit,
  ) async {
    if (event.index == 0) {
      emit(state.copyWith(readMode: ReadMode.book, showPageControls: true));
      bool reEmit = false;
      await Future.delayed(const Duration(seconds: 3), () => reEmit = true);
      if (reEmit) {
        emit(state.copyWith(showPageControls: false));
      }
    } else {
      emit(state.copyWith(readMode: ReadMode.ayahByAyah));
    }
  }

  void _changePage(
    ChangePage event,
    Emitter<SurahState> emit,
  ) {
    if (event.isFromSlider) {
      state.pageController?.jumpToPage(event.pageNumber);
    }
    emit(state.copyWith(currentPage: event.pageNumber));
  }

  void _changeTheme(
    ChangeTheme event,
    Emitter<SurahState> emit,
  ) {
    if (event.index == 0) {
      emit(state.copyWith(theme: PageTheme.light));
    } else {
      emit(state.copyWith(theme: PageTheme.dark));
    }
  }

  Future<void> _getSingleSurah(
    GetSingleSurah event,
    Emitter<SurahState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    var result = await repositoryImpl.getSingleSurah(event.surahIndex);
    if (result.data is SingleSurahResponse) {
      final surahStartingPage =
          result.data?.surah?.ayahs?.firstOrNull?.page ?? 1;
      emit(
        state.copyWith(
          isLoading: false,
          ayahs: result.data?.surah?.ayahs ?? [],
          surah: result.data?.surah,
          surahStartingPage: surahStartingPage,
          currentPage: surahStartingPage.toInt(),
          pageController: PageController(
            initialPage: surahStartingPage.toInt() - 1,
          ),
        ),
      );
    } else if (result.error != null) {
      emit(state.copyWith(isLoading: false));
    }
  }
}
