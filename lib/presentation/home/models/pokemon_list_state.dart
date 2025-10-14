import 'package:equatable/equatable.dart';
import 'package:pokeapp/domain/entities/pokemon_list_item.dart';

/// State for Pokemon list
class PokemonListState extends Equatable {
  final List<PokemonListItem> pokemons;
  final bool isLoading;
  final bool hasMore;
  final String? errorMessage;
  final int currentPage;
  final String searchQuery;

  const PokemonListState({
    this.pokemons = const [],
    this.isLoading = false,
    this.hasMore = true,
    this.errorMessage,
    this.currentPage = 0,
    this.searchQuery = '',
  });

  PokemonListState copyWith({
    List<PokemonListItem>? pokemons,
    bool? isLoading,
    bool? hasMore,
    String? errorMessage,
    int? currentPage,
    String? searchQuery,
  }) {
    return PokemonListState(
      pokemons: pokemons ?? this.pokemons,
      isLoading: isLoading ?? this.isLoading,
      hasMore: hasMore ?? this.hasMore,
      errorMessage: errorMessage,
      currentPage: currentPage ?? this.currentPage,
      searchQuery: searchQuery ?? this.searchQuery,
    );
  }

  @override
  List<Object?> get props => [
        pokemons,
        isLoading,
        hasMore,
        errorMessage,
        currentPage,
        searchQuery,
      ];
}
