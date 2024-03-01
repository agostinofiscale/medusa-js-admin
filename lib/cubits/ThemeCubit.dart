import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'ThemeModeState.dart';

class ThemeCubit extends Cubit<ThemeModeState> {
  ThemeCubit() : super(const ThemeModeState());

  void getTheme() {
    emit(state);
  }

  void toggleTheme() {
    emit(ThemeModeState(
      themeMode:
          state.themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light,
    ));
  }
}
