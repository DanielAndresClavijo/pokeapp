import 'package:flutter/material.dart';
import 'package:pokeapp/data/repositories/preferences_repository_impl.dart';

/// Use case to set app theme mode
class SetThemeModeUseCase {
  final PreferencesRepository _repository;

  SetThemeModeUseCase(this._repository);

  Future<void> call(ThemeMode themeMode) async {
    await _repository.setThemeMode(themeMode);
  }
}
