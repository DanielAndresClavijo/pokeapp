import 'package:pokeapp/core/error/failures.dart';
import 'package:pokeapp/domain/entities/pokemon_list_item.dart';
import 'package:pokeapp/domain/repositories/pokemon_repository.dart';

/// Use case for getting a paginated list of Pokemon
class GetPokemonListUseCase {
  final PokemonRepository repository;

  GetPokemonListUseCase(this.repository);

  /// Execute the use case
  /// [limit] - Number of Pokemon to fetch (default: 20)
  /// [offset] - Offset for pagination (default: 0)
  Future<Either<Failure, List<PokemonListItem>>> call({
    int limit = 20,
    int offset = 0,
  }) async {
    // Validate parameters
    if (limit <= 0 || limit > 100) {
      return Either.left(
        const ValidationFailure('El límite debe estar entre 1 y 100'),
      );
    }

    if (offset < 0) {
      return Either.left(
        const ValidationFailure('El offset no puede ser negativo'),
      );
    }

    // Execute repository method
    return await repository.getPokemonList(limit: limit, offset: offset);
  }

  /// Get the next page
  Future<Either<Failure, List<PokemonListItem>>> getNextPage(int currentPage) {
    return call(
      limit: 20,
      offset: currentPage * 20,
    );
  }
}
