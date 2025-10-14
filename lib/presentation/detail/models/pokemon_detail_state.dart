import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokeapp/domain/entities/pokemon.dart';

part 'pokemon_detail_state.freezed.dart';

/// Estado para la pantalla de detalles del Pokémon
@freezed
class PokemonDetailState with _$PokemonDetailState {
  const factory PokemonDetailState({
    required Pokemon? pokemon,
    required bool isFavorite,
    required String? errorMessage,
  }) = _PokemonDetailState;

  /// Estado inicial vacío
  factory PokemonDetailState.initial() => const PokemonDetailState(
        pokemon: null,
        isFavorite: false,
        errorMessage: null,
      );
}
