import 'package:pokeapp/core/network/dio_client.dart';
import 'package:pokeapp/data/models/pokemon_list_response_model.dart';
import 'package:pokeapp/data/models/pokemon_model.dart';
import 'package:pokeapp/data/models/pokemon_species_model.dart';

/// Pokemon remote data source interface
abstract class PokemonRemoteDataSource {
  Future<PokemonListResponseModel> getPokemonList(
      {int limit = 20, int offset = 0});
  Future<PokemonModel> getPokemonDetail(int id);
  Future<PokemonModel> getPokemonByName(String name);
  Future<PokemonSpeciesModel> getPokemonSpecies(int id);
}

/// Implementation of Pokemon remote data source
class PokemonRemoteDataSourceImpl implements PokemonRemoteDataSource {
  final DioClient client;

  PokemonRemoteDataSourceImpl(this.client);

  @override
  Future<PokemonListResponseModel> getPokemonList({
    int limit = 20,
    int offset = 0,
  }) async {
    final response = await client.get(
      '/pokemon',
      queryParameters: {
        'limit': limit,
        'offset': offset,
      },
    );

    return PokemonListResponseModel.fromJson(response.data);
  }

  @override
  Future<PokemonModel> getPokemonDetail(int id) async {
    final response = await client.get('/pokemon/$id');
    return PokemonModel.fromJson(response.data);
  }

  @override
  Future<PokemonModel> getPokemonByName(String name) async {
    final response = await client.get('/pokemon/$name');
    return PokemonModel.fromJson(response.data);
  }

  @override
  Future<PokemonSpeciesModel> getPokemonSpecies(int id) async {
    final response = await client.get('/pokemon-species/$id');
    return PokemonSpeciesModel.fromJson(response.data);
  }
}
