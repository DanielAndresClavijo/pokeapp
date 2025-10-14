import 'package:pokeapp/core/error/failures.dart';
import 'package:pokeapp/domain/entities/pokemon.dart';
import 'package:pokeapp/domain/entities/pokemon_list_item.dart';
import 'package:pokeapp/domain/entities/pokemon_species.dart';

/// Pokemon repository interface
/// This defines the contract that data layer must implement
abstract class PokemonRepository {
  /// Get a paginated list of Pokemon
  /// Returns [Right<List<PokemonListItem>>] on success
  /// Returns [Left<Failure>] on error
  Future<Either<Failure, List<PokemonListItem>>> getPokemonList({
    int limit = 20,
    int offset = 0,
  });

  /// Get detailed information about a specific Pokemon by ID
  /// Returns [Right<Pokemon>] on success
  /// Returns [Left<Failure>] on error
  Future<Either<Failure, Pokemon>> getPokemonDetail(int id);

  /// Get detailed information about a specific Pokemon by name
  /// Returns [Right<Pokemon>] on success
  /// Returns [Left<Failure>] on error
  Future<Either<Failure, Pokemon>> getPokemonByName(String name);

  /// Search Pokemon by name (partial match)
  /// Returns [Right<List<PokemonListItem>>] on success
  /// Returns [Left<Failure>] on error
  Future<Either<Failure, List<PokemonListItem>>> searchPokemon(String query);

  /// Get species information for a specific Pokemon by ID
  /// Returns [Right<PokemonSpecies>] on success
  /// Returns [Left<Failure>] on error
  Future<Either<Failure, PokemonSpecies>> getPokemonSpecies(int id);
}

/// Either type for functional error handling
/// This is a simple implementation, consider using dartz package for production
class Either<L, R> {
  final L? _left;
  final R? _right;

  Either.left(L value)
      : _left = value,
        _right = null;

  Either.right(R value)
      : _left = null,
        _right = value;

  bool get isLeft => _left != null;
  bool get isRight => _right != null;

  L get left => _left!;
  R get right => _right!;

  T fold<T>(T Function(L) leftFn, T Function(R) rightFn) {
    if (isLeft) {
      return leftFn(_left!);
    } else {
      return rightFn(_right!);
    }
  }
}
