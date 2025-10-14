import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:pokeapp/core/di/injection.dart';
import 'package:pokeapp/domain/usecases/get_pokemon_list_usecase.dart';
import 'package:pokeapp/domain/usecases/search_pokemon_usecase.dart';
import 'package:pokeapp/presentation/home/models/pokemon_list_state.dart';

part 'pokemon_list_viewmodel.g.dart';

@riverpod
class PokemonListViewModel extends _$PokemonListViewModel {
  late final GetPokemonListUseCase _getPokemonListUseCase;
  late final SearchPokemonUseCase _searchPokemonUseCase;

  static const int _pageSize = 20;

  @override
  PokemonListState build() {
    _getPokemonListUseCase = getIt<GetPokemonListUseCase>();
    _searchPokemonUseCase = getIt<SearchPokemonUseCase>();

    // Load initial data after build completes
    Future.microtask(() => loadPokemons());

    return const PokemonListState();
  }

  Future<void> loadPokemons() async {
    final currentState = state;
    if (currentState.isLoading || !currentState.hasMore) return;

    state = currentState.copyWith(isLoading: true, errorMessage: null);

    final result = await _getPokemonListUseCase(
      offset: currentState.currentPage * _pageSize,
      limit: _pageSize,
    );

    result.fold(
      (failure) {
        state = state.copyWith(
          isLoading: false,
          errorMessage: failure.message,
        );
      },
      (pokemons) {
        final currentPokemons = state.pokemons;
        final updatedList = [...currentPokemons, ...pokemons];
        state = state.copyWith(
          pokemons: updatedList,
          isLoading: false,
          hasMore: pokemons.length == _pageSize,
          currentPage: state.currentPage + 1,
        );
      },
    );
  }

  Future<void> searchPokemons(String query) async {
    if (query.isEmpty) {
      // Reset to normal list
      state = const PokemonListState();
      await loadPokemons();
      return;
    }

    state = state.copyWith(
      isLoading: true,
      errorMessage: null,
      searchQuery: query,
    );

    final result = await _searchPokemonUseCase(query);

    result.fold(
      (failure) {
        state = state.copyWith(
          isLoading: false,
          errorMessage: failure.message,
        );
      },
      (pokemons) {
        state = state.copyWith(
          pokemons: pokemons,
          isLoading: false,
          hasMore: false,
        );
      },
    );
  }

  void refresh() {
    state = const PokemonListState();
    loadPokemons();
  }
}
