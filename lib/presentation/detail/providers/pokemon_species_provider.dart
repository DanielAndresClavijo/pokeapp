import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokeapp/core/di/injection.dart';
import 'package:pokeapp/domain/entities/pokemon_species.dart';
import 'package:pokeapp/domain/usecases/get_pokemon_species_usecase.dart';

/// Provider para obtener información de especies de un Pokémon
/// 
/// - autoDispose: Se limpia automáticamente cuando no hay listeners
/// - family: Permite crear un provider por cada ID de Pokémon
///   Ejemplo: pokemonSpeciesProvider(1) es diferente de pokemonSpeciesProvider(2)
final pokemonSpeciesProvider =
    FutureProvider.autoDispose.family<PokemonSpecies, int>((ref, id) async {
  final useCase = getIt<GetPokemonSpeciesUseCase>();
  final result = await useCase(id);

  return result.fold(
    (failure) => throw Exception(failure.message),
    (species) => species,
  );
});
