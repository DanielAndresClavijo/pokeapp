import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pokeapp/core/di/injection.dart';
import 'package:pokeapp/core/error/failures.dart';
import 'package:pokeapp/domain/entities/pokemon.dart';
import 'package:pokeapp/domain/repositories/pokemon_repository.dart';
import 'package:pokeapp/domain/usecases/get_pokemon_detail_usecase.dart';
import 'package:pokeapp/presentation/home/providers/pokemon_detail_provider.dart';

import 'pokemon_detail_provider_test.mocks.dart';

@GenerateMocks([GetPokemonDetailUseCase])
void main() {
  late MockGetPokemonDetailUseCase mockGetPokemonDetailUseCase;
  late ProviderContainer container;

  setUp(() {
    mockGetPokemonDetailUseCase = MockGetPokemonDetailUseCase();
    
    // Configurar GetIt para testing
    if (getIt.isRegistered<GetPokemonDetailUseCase>()) {
      getIt.unregister<GetPokemonDetailUseCase>();
    }
    getIt.registerLazySingleton<GetPokemonDetailUseCase>(
      () => mockGetPokemonDetailUseCase,
    );

    container = ProviderContainer();
  });

  tearDown(() {
    container.dispose();
    if (getIt.isRegistered<GetPokemonDetailUseCase>()) {
      getIt.unregister<GetPokemonDetailUseCase>();
    }
  });

  group('pokemonDetailProvider', () {
    test('debe retornar Pokemon cuando el use case es exitoso', () async {
      // Arrange
      const pokemonId = 1;
      final pokemon = Pokemon(
        id: pokemonId,
        name: 'bulbasaur',
        height: 7,
        weight: 69,
        baseExperience: 64,
        abilities: const ['overgrow', 'chlorophyll'],
        sprites: const PokemonSprites(
          frontDefault: 'https://example.com/bulbasaur.png',
        ),
        types: const ['grass', 'poison'],
        stats: const PokemonStats(
          hp: 45,
          attack: 49,
          defense: 49,
          specialAttack: 65,
          specialDefense: 65,
          speed: 45,
        ),
      );

      when(mockGetPokemonDetailUseCase.call(pokemonId))
          .thenAnswer((_) async => Either.right(pokemon));

      // Act
      final result = await container.read(pokemonDetailProvider(pokemonId).future);

      // Assert
      expect(result, pokemon);
      expect(result.id, pokemonId);
      expect(result.name, 'bulbasaur');
      verify(mockGetPokemonDetailUseCase.call(pokemonId)).called(1);
    });

    test('debe lanzar Exception cuando el use case falla', () async {
      // Arrange
      const pokemonId = 999;
      const failure = ServerFailure('Pokemon not found');

      when(mockGetPokemonDetailUseCase.call(pokemonId))
          .thenAnswer((_) async => Either.left(failure));

      // Act & Assert
      expect(
        () => container.read(pokemonDetailProvider(pokemonId).future),
        throwsA(isA<Exception>()),
      );
      verify(mockGetPokemonDetailUseCase.call(pokemonId)).called(1);
    });

    test('debe crear diferentes providers para diferentes IDs', () async {
      // Arrange
      const pokemonId1 = 1;
      const pokemonId2 = 25;
      
      final pokemon1 = Pokemon(
        id: pokemonId1,
        name: 'bulbasaur',
        height: 7,
        weight: 69,
        baseExperience: 64,
        abilities: const ['overgrow', 'chlorophyll'],
        sprites: const PokemonSprites(
          frontDefault: 'https://example.com/bulbasaur.png',
        ),
        types: const ['grass', 'poison'],
        stats: const PokemonStats(
          hp: 45,
          attack: 49,
          defense: 49,
          specialAttack: 65,
          specialDefense: 65,
          speed: 45,
        ),
      );

      final pokemon2 = Pokemon(
        id: pokemonId2,
        name: 'pikachu',
        height: 4,
        weight: 60,
        baseExperience: 112,
        abilities: const ['static', 'lightning-rod'],
        sprites: const PokemonSprites(
          frontDefault: 'https://example.com/pikachu.png',
        ),
        types: const ['electric'],
        stats: const PokemonStats(
          hp: 35,
          attack: 55,
          defense: 40,
          specialAttack: 50,
          specialDefense: 50,
          speed: 90,
        ),
      );

      when(mockGetPokemonDetailUseCase.call(pokemonId1))
          .thenAnswer((_) async => Either.right(pokemon1));
      when(mockGetPokemonDetailUseCase.call(pokemonId2))
          .thenAnswer((_) async => Either.right(pokemon2));

      // Act
      final result1 = await container.read(pokemonDetailProvider(pokemonId1).future);
      final result2 = await container.read(pokemonDetailProvider(pokemonId2).future);

      // Assert
      expect(result1.id, pokemonId1);
      expect(result1.name, 'bulbasaur');
      expect(result2.id, pokemonId2);
      expect(result2.name, 'pikachu');
      verify(mockGetPokemonDetailUseCase.call(pokemonId1)).called(1);
      verify(mockGetPokemonDetailUseCase.call(pokemonId2)).called(1);
    });
  });
}
