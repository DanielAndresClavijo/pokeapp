import 'package:pokeapp/data/repositories/preferences_repository_impl.dart';

/// Use case to get all favorite Pokemon IDs
class GetFavoritesUseCase {
  final PreferencesRepository _repository;

  GetFavoritesUseCase(this._repository);

  Future<List<int>> call() async {
    return await _repository.getFavorites();
  }
}
