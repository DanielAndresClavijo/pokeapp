import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:pokeapp/core/di/injection.dart';
import 'package:pokeapp/domain/usecases/get_favorites_usecase.dart';
import 'package:pokeapp/domain/usecases/get_pokemon_detail_usecase.dart';
import 'package:pokeapp/domain/usecases/toggle_favorite_usecase.dart';
import 'package:pokeapp/presentation/detail/models/pokemon_detail_state.dart';

part 'pokemon_detail_viewmodel.g.dart';

/// ViewModel para la pantalla de detalles del Pokémon
/// 
/// Maneja:
/// - Carga de datos del Pokémon
/// - Estado de favorito
/// - Toggle de favorito
@riverpod
class PokemonDetailViewModel extends _$PokemonDetailViewModel {
  late final GetPokemonDetailUseCase _getPokemonDetailUseCase;
  late final GetFavoritesUseCase _getFavoritesUseCase;
  late final ToggleFavoriteUseCase _toggleFavoriteUseCase;

  @override
  Future<PokemonDetailState> build(int pokemonId) async {
    _getPokemonDetailUseCase = getIt<GetPokemonDetailUseCase>();
    _getFavoritesUseCase = getIt<GetFavoritesUseCase>();
    _toggleFavoriteUseCase = getIt<ToggleFavoriteUseCase>();

    return await _loadPokemonDetail(pokemonId);
  }

  /// Carga los detalles del Pokémon y verifica si está en favoritos
  Future<PokemonDetailState> _loadPokemonDetail(int pokemonId) async {
    final result = await _getPokemonDetailUseCase(pokemonId);

    return await result.fold(
      (failure) async => PokemonDetailState(
        pokemon: null,
        isFavorite: false,
        errorMessage: failure.message,
      ),
      (pokemon) async {
        // Verificar si está en favoritos
        final isFavorite = await _checkIfFavorite(pokemon.id);

        return PokemonDetailState(
          pokemon: pokemon,
          isFavorite: isFavorite,
          errorMessage: null,
        );
      },
    );
  }

  /// Verifica si el Pokémon está en la lista de favoritos
  Future<bool> _checkIfFavorite(int pokemonId) async {
    final favorites = await _getFavoritesUseCase();
    return favorites.contains(pokemonId);
  }

  /// Toggle del estado de favorito
  Future<void> toggleFavorite() async {
    final currentState = state.value;
    if (currentState?.pokemon == null) return;

    final pokemon = currentState!.pokemon!;

    // Actualizar estado optimísticamente (UI instantánea)
    state = AsyncValue.data(
      currentState.copyWith(isFavorite: !currentState.isFavorite),
    );

    // Ejecutar el toggle en segundo plano
    await _toggleFavoriteUseCase(pokemon.id);
  }

  /// Recargar los datos del Pokémon
  Future<void> refresh() async {
    final currentState = state.value;
    if (currentState?.pokemon == null) return;

    state = const AsyncValue.loading();
    state = AsyncValue.data(
      await _loadPokemonDetail(currentState!.pokemon!.id),
    );
  }
}
