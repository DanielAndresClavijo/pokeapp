import 'package:pokeapp/core/error/failures.dart';
import 'package:pokeapp/domain/entities/pokemon.dart';
import 'package:pokeapp/domain/repositories/pokemon_repository.dart';

/// Use case for getting detailed information about a Pokemon
class GetPokemonDetailUseCase {
  final PokemonRepository repository;

  GetPokemonDetailUseCase(this.repository);

  /// Execute the use case by ID
  /// [id] - Pokemon ID (must be positive)
  Future<Either<Failure, Pokemon>> call(int id) async {
    // Validate ID
    if (id <= 0) {
      return Either.left(
        const ValidationFailure('El ID debe ser un número positivo'),
      );
    }

    // Execute repository method
    return await repository.getPokemonDetail(id);
  }

  /// Execute the use case by name
  /// [name] - Pokemon name (must not be empty)
  Future<Either<Failure, Pokemon>> byName(String name) async {
    // Validate name
    if (name.trim().isEmpty) {
      return Either.left(
        const ValidationFailure('El nombre no puede estar vacío'),
      );
    }

    // Normalize name (lowercase)
    final normalizedName = name.trim().toLowerCase();

    // Execute repository method
    return await repository.getPokemonByName(normalizedName);
  }
}
