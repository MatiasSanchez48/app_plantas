import 'package:app_plantas/theme/theme_default.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'bloc_app_event.dart';
part 'bloc_app_state.dart';

class BlocApp extends Bloc<BlocAppEvent, BlocAppState> {
  BlocApp() : super(BlocAppStateInitial(themeDefault)) {
    on<BlocAppEventToggleTheme>(_chageTheme);
    on<BlocAppEventInitial>(_initTheme);

    add(const BlocAppEventInitial());
  }

  Future<void> _initTheme(
    BlocAppEventInitial event,
    Emitter<BlocAppState> emit,
  ) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final themeDark = sharedPreferences.getBool('isDarkTheme') ?? false;
    if (themeDark) {
      emit(
        BlocAppUpdatedState.desde(
          state,
          theme: themeDefaultDark,
          themeDark: themeDark,
        ),
      );
    } else {
      emit(
        BlocAppUpdatedState.desde(
          state,
          theme: themeDefault,
          themeDark: themeDark,
        ),
      );
    }
  }

  Future<void> _chageTheme(
    BlocAppEventToggleTheme event,
    Emitter<BlocAppState> emit,
  ) async {
    final sharedPreferences = await SharedPreferences.getInstance();

    await sharedPreferences.setBool('isDarkTheme', event.themeDark);
    if (event.themeDark) {
      emit(
        BlocAppUpdatedState.desde(
          state,
          theme: themeDefaultDark,
          themeDark: event.themeDark,
        ),
      );
    } else {
      emit(
        BlocAppUpdatedState.desde(
          state,
          theme: themeDefault,
          themeDark: event.themeDark,
        ),
      );
    }
  }

}
