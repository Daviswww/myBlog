import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:myblog/infrastructure/apod/apod_model.dart';
import 'package:myblog/infrastructure/apod/apod_repository_impl.dart';

part 'apod_event.dart';
part 'apod_state.dart';

class ApodBloc extends Bloc<ApodEvent, ApodState> {
  final ApodRepositoryImpl _apodRepositoryImpl;
  ApodBloc({required ApodRepositoryImpl apodRepositoryImpl})
      : _apodRepositoryImpl = apodRepositoryImpl,
        super(ApodInitial()) {
    on<ChangeApodEvent>((event, emit) async {
      await _mapStartedToState(emit);
    });
  }

  Future<void> _mapStartedToState(
    Emitter<ApodState> emit,
  ) async {
    final getApodImage = await _apodRepositoryImpl.getApodImage();
    await getApodImage.fold((err) async {
      log("$err");
      emit(ApodStateFailure(err.toString()));
    }, (data) async {
      emit(ApodStateSuccess(data));
    });
  }
}
