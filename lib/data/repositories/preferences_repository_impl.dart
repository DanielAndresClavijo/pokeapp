import 'package:flutter/material.dart';
import 'package:pokeapp/data/datasources/local/preferences_local_datasource.dart';

/// Repository for user preferences
abstract class PreferencesRepository {
  Future<void> setThemeMode(ThemeMode themeMode);
  Future<ThemeMode> getThemeMode();
  Future<void> setOnboardingCompleted(bool completed);
  Future<bool> getOnboardingCompleted();
  Future<void> toggleFavorite(int pokemonId);
  Future<bool> isFavorite(int pokemonId);
  Future<List<int>> getFavorites();
  Future<void> clearFavorites();
  Future<void> clearAllData();
}

/// Implementation of preferences repository
class PreferencesRepositoryImpl implements PreferencesRepository {
  final PreferencesLocalDataSource _localDataSource;

  PreferencesRepositoryImpl(this._localDataSource);

  @override
  Future<void> setThemeMode(ThemeMode themeMode) async {
    await _localDataSource.setThemeMode(themeMode.name);
  }

  @override
  Future<ThemeMode> getThemeMode() async {
    final themeModeString = await _localDataSource.getThemeMode();
    if (themeModeString == null) return ThemeMode.system;

    return ThemeMode.values.firstWhere(
      (mode) => mode.name == themeModeString,
      orElse: () => ThemeMode.system,
    );
  }

  @override
  Future<void> setOnboardingCompleted(bool completed) async {
    await _localDataSource.setOnboardingCompleted(completed);
  }

  @override
  Future<bool> getOnboardingCompleted() async {
    return await _localDataSource.getOnboardingCompleted();
  }

  @override
  Future<void> toggleFavorite(int pokemonId) async {
    final favorites = await _localDataSource.getFavorites();
    if (favorites.contains(pokemonId)) {
      await _localDataSource.removeFavorite(pokemonId);
    } else {
      await _localDataSource.addFavorite(pokemonId);
    }
  }

  @override
  Future<bool> isFavorite(int pokemonId) async {
    final favorites = await _localDataSource.getFavorites();
    return favorites.contains(pokemonId);
  }

  @override
  Future<List<int>> getFavorites() async {
    return await _localDataSource.getFavorites();
  }

  @override
  Future<void> clearFavorites() async {
    await _localDataSource.clearFavorites();
  }

  @override
  Future<void> clearAllData() async {
    await _localDataSource.clearAllData();
  }
}
