import 'package:pokeapp/data/repositories/preferences_repository_impl.dart';

/// Use case to toggle a Pokemon as favorite
class ToggleFavoriteUseCase {
  final PreferencesRepository _repository;

  ToggleFavoriteUseCase(this._repository);

  Future<void> call(int pokemonId) async {
    await _repository.toggleFavorite(pokemonId);
  }
}
