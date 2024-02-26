import 'package:app_plantas/theme/theme_default.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'bloc_theme_event.dart';
part 'bloc_theme_state.dart';

class BlocTheme extends Bloc<BlocThemeEvent, BlocThemeState> {
  BlocTheme() : super(BlocThemeStateInitial(themeDefault)) {
    on<BlocThemeEventToggleTheme>(_chageTheme);
    on<BlocThemeEventInitial>(_initTheme);

    add(const BlocThemeEventInitial());
  }

  Future<void> _initTheme(
    BlocThemeEventInitial event,
    Emitter<BlocThemeState> emit,
  ) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final themeDark = sharedPreferences.getBool('isDarkTheme') ?? false;
    if (themeDark) {
      emit(
        ThemeUpdatedState.desde(
          state,
          theme: themeDefaultDark,
          themeDark: themeDark,
        ),
      );
    } else {
      emit(
        ThemeUpdatedState.desde(
          state,
          theme: themeDefault,
          themeDark: themeDark,
        ),
      );
    }
  }

  Future<void> _chageTheme(
    BlocThemeEventToggleTheme event,
    Emitter<BlocThemeState> emit,
  ) async {
    final sharedPreferences = await SharedPreferences.getInstance();

    await sharedPreferences.setBool('isDarkTheme', event.themeDark);
    if (event.themeDark) {
      emit(
        ThemeUpdatedState.desde(
          state,
          theme: themeDefaultDark,
          themeDark: event.themeDark,
        ),
      );
    } else {
      emit(
        ThemeUpdatedState.desde(
          state,
          theme: themeDefault,
          themeDark: event.themeDark,
        ),
      );
    }
  }
}
