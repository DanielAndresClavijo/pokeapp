import 'package:pokeapp/core/error/failures.dart';
import 'package:pokeapp/domain/entities/pokemon_list_item.dart';
import 'package:pokeapp/domain/repositories/pokemon_repository.dart';

/// Use case for searching Pokemon by name
class SearchPokemonUseCase {
  final PokemonRepository repository;

  SearchPokemonUseCase(this.repository);

  /// Execute the use case
  /// [query] - Search query (must be at least 2 characters)
  Future<Either<Failure, List<PokemonListItem>>> call(String query) async {
    // Validate query
    if (query.trim().isEmpty) {
      return Either.left(
        const ValidationFailure('La búsqueda no puede estar vacía'),
      );
    }

    if (query.trim().length < 2) {
      return Either.left(
        const ValidationFailure('La búsqueda debe tener al menos 2 caracteres'),
      );
    }

    // Normalize query (lowercase, trim)
    final normalizedQuery = query.trim().toLowerCase();

    // Execute repository method
    return await repository.searchPokemon(normalizedQuery);
  }
}
