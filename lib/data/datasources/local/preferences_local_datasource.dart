import 'package:shared_preferences/shared_preferences.dart';

/// Local preferences data source
abstract class PreferencesLocalDataSource {
  Future<void> setThemeMode(String themeMode);
  Future<String?> getThemeMode();
  Future<void> setOnboardingCompleted(bool completed);
  Future<bool> getOnboardingCompleted();
  Future<void> addFavorite(int pokemonId);
  Future<void> removeFavorite(int pokemonId);
  Future<List<int>> getFavorites();
  Future<void> clearFavorites();
  Future<void> clearAllData();
}

/// Implementation of preferences local data source
class PreferencesLocalDataSourceImpl implements PreferencesLocalDataSource {
  static const String _keyThemeMode = 'theme_mode';
  static const String _keyOnboarding = 'onboarding_completed';
  static const String _keyFavorites = 'favorite_pokemons';

  final SharedPreferences _prefs;

  PreferencesLocalDataSourceImpl(this._prefs);

  @override
  Future<void> setThemeMode(String themeMode) async {
    await _prefs.setString(_keyThemeMode, themeMode);
  }

  @override
  Future<String?> getThemeMode() async {
    return _prefs.getString(_keyThemeMode);
  }

  @override
  Future<void> setOnboardingCompleted(bool completed) async {
    await _prefs.setBool(_keyOnboarding, completed);
  }

  @override
  Future<bool> getOnboardingCompleted() async {
    return _prefs.getBool(_keyOnboarding) ?? false;
  }

  @override
  Future<void> addFavorite(int pokemonId) async {
    final favorites = await getFavorites();
    if (!favorites.contains(pokemonId)) {
      favorites.add(pokemonId);
      await _prefs.setStringList(
        _keyFavorites,
        favorites.map((id) => id.toString()).toList(),
      );
    }
  }

  @override
  Future<void> removeFavorite(int pokemonId) async {
    final favorites = await getFavorites();
    favorites.remove(pokemonId);
    await _prefs.setStringList(
      _keyFavorites,
      favorites.map((id) => id.toString()).toList(),
    );
  }

  @override
  Future<List<int>> getFavorites() async {
    final favoriteStrings = _prefs.getStringList(_keyFavorites) ?? [];
    return favoriteStrings.map((s) => int.parse(s)).toList();
  }

  @override
  Future<void> clearFavorites() async {
    await _prefs.remove(_keyFavorites);
  }

  @override
  Future<void> clearAllData() async {
    await _prefs.clear();
  }
}
