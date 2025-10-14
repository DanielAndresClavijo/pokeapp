import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokeapp/core/di/injection.dart';
import 'package:pokeapp/domain/entities/pokemon.dart';
import 'package:pokeapp/domain/usecases/get_pokemon_detail_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pokemon_detail_provider.g.dart';

@riverpod
Future<Pokemon> pokemonDetail(Ref ref, int pokemonId) async {
  final useCase = getIt<GetPokemonDetailUseCase>();
  final result = await useCase(pokemonId);
  
  return result.fold(
    (failure) => throw Exception(failure.message),
    (pokemon) => pokemon,
  );
}
