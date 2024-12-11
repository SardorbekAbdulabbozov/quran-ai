import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_ai/src/domain/models/responses/all_surahs_response.dart';
import 'package:quran_ai/src/domain/repositories/remote_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final RemoteRepository repository;
  List<Surah> surahs = [];

  HomeBloc(this.repository) : super(const HomeState()) {
    on<GetAllSurahs>(_getAllSurahs);
  }

  Future<void> _getAllSurahs(
    GetAllSurahs event,
    Emitter<HomeState> emit,
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
