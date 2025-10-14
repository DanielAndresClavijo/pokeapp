import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:pokeapp/core/di/injection.dart';
import 'package:pokeapp/domain/usecases/get_theme_mode_usecase.dart';
import 'package:pokeapp/domain/usecases/set_theme_mode_usecase.dart';

part 'theme_viewmodel.g.dart';

@riverpod
class ThemeViewModel extends _$ThemeViewModel {
  late final GetThemeModeUseCase _getThemeModeUseCase;
  late final SetThemeModeUseCase _setThemeModeUseCase;

  @override
  Future<ThemeMode> build() async {
    _getThemeModeUseCase = getIt<GetThemeModeUseCase>();
    _setThemeModeUseCase = getIt<SetThemeModeUseCase>();
    
    return await _getThemeModeUseCase();
  }

  Future<void> setThemeMode(ThemeMode themeMode) async {
    await _setThemeModeUseCase(themeMode);
    state = AsyncValue.data(themeMode);
  }

  Future<void> toggleTheme() async {
    final currentMode = state.value ?? ThemeMode.system;
    ThemeMode newMode;

    switch (currentMode) {
      case ThemeMode.light:
        newMode = ThemeMode.dark;
        break;
      case ThemeMode.dark:
        newMode = ThemeMode.system;
        break;
      case ThemeMode.system:
        newMode = ThemeMode.light;
        break;
    }

    await setThemeMode(newMode);
  }
}
