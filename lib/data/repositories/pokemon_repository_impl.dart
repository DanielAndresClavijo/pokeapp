import 'package:pokeapp/core/error/exceptions.dart';
import 'package:pokeapp/core/error/failures.dart';
import 'package:pokeapp/data/datasources/remote/pokemon_remote_datasource.dart';
import 'package:pokeapp/domain/entities/pokemon.dart';
import 'package:pokeapp/domain/entities/pokemon_list_item.dart';
import 'package:pokeapp/domain/entities/pokemon_species.dart';
import 'package:pokeapp/domain/repositories/pokemon_repository.dart';

/// Implementation of Pokemon repository
class PokemonRepositoryImpl implements PokemonRepository {
  final PokemonRemoteDataSource remoteDataSource;

  PokemonRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, List<PokemonListItem>>> getPokemonList({
    int limit = 20,
    int offset = 0,
  }) async {
    try {
      final response = await remoteDataSource.getPokemonList(
        limit: limit,
        offset: offset,
      );

      final entities =
          response.results.map((model) => model.toEntity()).toList();

      return Either.right(entities);
    } on NetworkException catch (e) {
      return Either.left(NetworkFailure(e.message));
    } on ServerException catch (e) {
      return Either.left(ServerFailure(e.message));
    } on NotFoundException catch (e) {
      return Either.left(NotFoundFailure(e.message));
    } on TimeoutException catch (e) {
      return Either.left(TimeoutFailure(e.message));
    } on AppException catch (e) {
      return Either.left(UnknownFailure(e.message));
    } catch (e) {
      return Either.left(UnknownFailure('Error inesperado: $e'));
    }
  }

  @override
  Future<Either<Failure, Pokemon>> getPokemonDetail(int id) async {
    try {
      final model = await remoteDataSource.getPokemonDetail(id);
      return Either.right(model.toEntity());
    } on NetworkException catch (e) {
      return Either.left(NetworkFailure(e.message));
    } on ServerException catch (e) {
      return Either.left(ServerFailure(e.message));
    } on NotFoundException catch (e) {
      return Either.left(NotFoundFailure(e.message));
    } on TimeoutException catch (e) {
      return Either.left(TimeoutFailure(e.message));
    } on AppException catch (e) {
      return Either.left(UnknownFailure(e.message));
    } catch (e) {
      return Either.left(UnknownFailure('Error inesperado: $e'));
    }
  }

  @override
  Future<Either<Failure, Pokemon>> getPokemonByName(String name) async {
    try {
      final model = await remoteDataSource.getPokemonByName(name);
      return Either.right(model.toEntity());
    } on NetworkException catch (e) {
      return Either.left(NetworkFailure(e.message));
    } on ServerException catch (e) {
      return Either.left(ServerFailure(e.message));
    } on NotFoundException catch (e) {
      return Either.left(NotFoundFailure(e.message));
    } on TimeoutException catch (e) {
      return Either.left(TimeoutFailure(e.message));
    } on AppException catch (e) {
      return Either.left(UnknownFailure(e.message));
    } catch (e) {
      return Either.left(UnknownFailure('Error inesperado: $e'));
    }
  }

  @override
  Future<Either<Failure, List<PokemonListItem>>> searchPokemon(
      String query) async {
    try {
      // Get all Pokemon (first 1000)
      final response =
          await remoteDataSource.getPokemonList(limit: 1000, offset: 0);

      // Filter by query
      final filtered = response.results
          .where((pokemon) => pokemon.name.contains(query.toLowerCase()))
          .map((model) => model.toEntity())
          .toList();

      return Either.right(filtered);
    } on NetworkException catch (e) {
      return Either.left(NetworkFailure(e.message));
    } on ServerException catch (e) {
      return Either.left(ServerFailure(e.message));
    } on NotFoundException catch (e) {
      return Either.left(NotFoundFailure(e.message));
    } on TimeoutException catch (e) {
      return Either.left(TimeoutFailure(e.message));
    } on AppException catch (e) {
      return Either.left(UnknownFailure(e.message));
    } catch (e) {
      return Either.left(UnknownFailure('Error inesperado: $e'));
    }
  }

  @override
  Future<Either<Failure, PokemonSpecies>> getPokemonSpecies(int id) async {
    try {
      final model = await remoteDataSource.getPokemonSpecies(id);
      return Either.right(model.toEntity());
    } on NetworkException catch (e) {
      return Either.left(NetworkFailure(e.message));
    } on ServerException catch (e) {
      return Either.left(ServerFailure(e.message));
    } on NotFoundException catch (e) {
      return Either.left(NotFoundFailure(e.message));
    } on TimeoutException catch (e) {
      return Either.left(TimeoutFailure(e.message));
    } on AppException catch (e) {
      return Either.left(UnknownFailure(e.message));
    } catch (e) {
      return Either.left(UnknownFailure('Error inesperado: $e'));
    }
  }
}
