import 'package:pokeapp/core/error/failures.dart';
import 'package:pokeapp/domain/entities/pokemon_species.dart';
import 'package:pokeapp/domain/repositories/pokemon_repository.dart';

/// Use case para obtener información de especies del Pokémon
/// Devuelve descripción, ratio de género, hábitat, etc.
class GetPokemonSpeciesUseCase {
  final PokemonRepository repository;

  GetPokemonSpeciesUseCase(this.repository);

  Future<Either<Failure, PokemonSpecies>> call(int id) async {
    return await repository.getPokemonSpecies(id);
  }
}
