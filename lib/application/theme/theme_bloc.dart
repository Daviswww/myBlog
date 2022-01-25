import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:myblog/infrastructure/theme/theme.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc()
      : super(ThemeState(themeData: AppThemeData.lightMode, isDark: false)) {
    on<ThemeChange>((event, emit) async {
      await _mapThemeChangeToState(emit, event.isDark);
    });
  }

  Future<void> _mapThemeChangeToState(
      Emitter<ThemeState> emit, bool _isDark) async {
    if (_isDark) {
      emit(ThemeState(themeData: AppThemeData.darkMode, isDark: true));
    } else {
      emit(ThemeState(themeData: AppThemeData.lightMode, isDark: false));
    }
  }
}
