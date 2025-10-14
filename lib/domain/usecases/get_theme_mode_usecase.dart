import 'package:flutter/material.dart';
import 'package:pokeapp/data/repositories/preferences_repository_impl.dart';

/// Use case to get current app theme mode
class GetThemeModeUseCase {
  final PreferencesRepository _repository;

  GetThemeModeUseCase(this._repository);

  Future<ThemeMode> call() async {
    return await _repository.getThemeMode();
  }
}
