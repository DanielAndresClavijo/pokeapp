import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:pokeapp/core/di/injection.dart';
import 'package:pokeapp/domain/entities/pokemon_list_item.dart';
import 'package:pokeapp/domain/usecases/get_favorites_usecase.dart';
import 'package:pokeapp/domain/usecases/get_pokemon_detail_usecase.dart';
import 'package:pokeapp/domain/usecases/toggle_favorite_usecase.dart';

part 'favorites_viewmodel.g.dart';

@riverpod
class FavoritesViewModel extends _$FavoritesViewModel {
  late final GetFavoritesUseCase _getFavoritesUseCase;
  late final GetPokemonDetailUseCase _getPokemonDetailUseCase;
  late final ToggleFavoriteUseCase _toggleFavoriteUseCase;

  @override
  Future<List<PokemonListItem>> build() async {
    _getFavoritesUseCase = getIt<GetFavoritesUseCase>();
    _getPokemonDetailUseCase = getIt<GetPokemonDetailUseCase>();
    _toggleFavoriteUseCase = getIt<ToggleFavoriteUseCase>();

    return await _loadFavorites();
  }

  Future<List<PokemonListItem>> _loadFavorites() async {
    final favoriteIds = await _getFavoritesUseCase();
    final List<PokemonListItem> favorites = [];

    for (final id in favoriteIds) {
      final result = await _getPokemonDetailUseCase(id);
      result.fold(
        (failure) {
          // Skip if failed to load
        },
        (pokemon) {
          favorites.add(pokemon.toListItem());
        },
      );
    }

    return favorites;
  }

  Future<void> toggleFavorite(int pokemonId) async {
    await _toggleFavoriteUseCase(pokemonId);
    state = AsyncValue.data(await _loadFavorites());
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = AsyncValue.data(await _loadFavorites());
  }
}
