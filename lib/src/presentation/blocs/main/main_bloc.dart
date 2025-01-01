import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_ai/src/domain/repositories/remote_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'main_event.dart';

part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  final RemoteRepository repository;

  MainBloc(this.repository) : super(const MainState()) {
    on<ChangeIndex>(_changeIndex);
  }

  Future<void> _changeIndex(
    ChangeIndex event,
    Emitter<MainState> emit,
  ) async {
    emit(state.copyWith(index: event.index));
  }
}
