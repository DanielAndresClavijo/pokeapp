import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pokeapp/core/di/injection.dart';
import 'package:pokeapp/core/error/failures.dart';
import 'package:pokeapp/domain/entities/pokemon_species.dart';
import 'package:pokeapp/domain/repositories/pokemon_repository.dart';
import 'package:pokeapp/domain/usecases/get_pokemon_species_usecase.dart';
import 'package:pokeapp/presentation/detail/providers/pokemon_species_provider.dart';

import 'pokemon_species_provider_test.mocks.dart';

@GenerateMocks([GetPokemonSpeciesUseCase])
void main() {
  late MockGetPokemonSpeciesUseCase mockGetPokemonSpeciesUseCase;
  late ProviderContainer container;

  setUp(() {
    mockGetPokemonSpeciesUseCase = MockGetPokemonSpeciesUseCase();
    
    // Configurar GetIt para testing
    if (getIt.isRegistered<GetPokemonSpeciesUseCase>()) {
      getIt.unregister<GetPokemonSpeciesUseCase>();
    }
    getIt.registerLazySingleton<GetPokemonSpeciesUseCase>(
      () => mockGetPokemonSpeciesUseCase,
    );

    container = ProviderContainer();
  });

  tearDown(() {
    container.dispose();
    if (getIt.isRegistered<GetPokemonSpeciesUseCase>()) {
      getIt.unregister<GetPokemonSpeciesUseCase>();
    }
  });

  group('pokemonSpeciesProvider', () {
    test('debe retornar PokemonSpecies cuando el use case es exitoso', () async {
      // Arrange
      const pokemonId = 1;
      const species = PokemonSpecies(
        id: pokemonId,
        name: 'bulbasaur',
        description: 'A strange seed was planted on its back at birth.',
        habitat: 'grassland',
        genderRate: 1, // 87.5% male, 12.5% female
        captureRate: 45,
        isLegendary: false,
        isMythical: false,
      );

      when(mockGetPokemonSpeciesUseCase.call(pokemonId))
          .thenAnswer((_) async => Either.right(species));

      // Act
      final result = await container.read(pokemonSpeciesProvider(pokemonId).future);

      // Assert
      expect(result, species);
      expect(result.id, pokemonId);
      expect(result.name, 'bulbasaur');
      expect(result.genderRate, 1);
      expect(result.isLegendary, false);
      verify(mockGetPokemonSpeciesUseCase.call(pokemonId)).called(1);
    });

    test('debe lanzar Exception cuando el use case falla', () async {
      // Arrange
      const pokemonId = 999;
      const failure = ServerFailure('Species not found');

      when(mockGetPokemonSpeciesUseCase.call(pokemonId))
          .thenAnswer((_) async => Either.left(failure));

      // Act & Assert
      expect(
        () => container.read(pokemonSpeciesProvider(pokemonId).future),
        throwsA(isA<Exception>()),
      );
      verify(mockGetPokemonSpeciesUseCase.call(pokemonId)).called(1);
    });

    test('debe calcular correctamente los porcentajes de género', () async {
      // Arrange
      const pokemonId = 25; // Pikachu
      const species = PokemonSpecies(
        id: pokemonId,
        name: 'pikachu',
        description: 'When several of these Pokémon gather.',
        habitat: 'forest',
        genderRate: 4, // 50% male, 50% female (sistema de 8 partes)
        captureRate: 190,
        isLegendary: false,
        isMythical: false,
      );

      when(mockGetPokemonSpeciesUseCase.call(pokemonId))
          .thenAnswer((_) async => Either.right(species));

      // Act
      final result = await container.read(pokemonSpeciesProvider(pokemonId).future);

      // Assert
      expect(result.malePercentage, 50.0); // 50%
      expect(result.femalePercentage, 50.0); // 50%
      expect(result.isGenderless, false);
    });

    test('debe manejar Pokémon sin género correctamente', () async {
      // Arrange
      const pokemonId = 81; // Magnemite
      const species = PokemonSpecies(
        id: pokemonId,
        name: 'magnemite',
        description: 'It is attracted by electromagnetic waves.',
        habitat: 'urban',
        genderRate: -1, // Sin género
        captureRate: 190,
        isLegendary: false,
        isMythical: false,
      );

      when(mockGetPokemonSpeciesUseCase.call(pokemonId))
          .thenAnswer((_) async => Either.right(species));

      // Act
      final result = await container.read(pokemonSpeciesProvider(pokemonId).future);

      // Assert
      expect(result.isGenderless, true);
      expect(result.malePercentage, 0.0);
      expect(result.femalePercentage, 0.0);
    });

    test('debe ser autoDispose y limpiar el estado cuando no hay listeners', () async {
      // Arrange
      const pokemonId = 1;
      const species = PokemonSpecies(
        id: pokemonId,
        name: 'bulbasaur',
        description: 'A strange seed was planted on its back at birth.',
        habitat: 'grassland',
        genderRate: 1,
        captureRate: 45,
        isLegendary: false,
        isMythical: false,
      );

      when(mockGetPokemonSpeciesUseCase.call(pokemonId))
          .thenAnswer((_) async => Either.right(species));

      // Act - Crear y destruir container
      final tempContainer = ProviderContainer();
      await tempContainer.read(pokemonSpeciesProvider(pokemonId).future);
      tempContainer.dispose();

      // Assert - Verificar que se puede llamar de nuevo después de dispose
      final result = await container.read(pokemonSpeciesProvider(pokemonId).future);
      expect(result, species);
      
      // El use case debería haber sido llamado 2 veces (una por cada container)
      verify(mockGetPokemonSpeciesUseCase.call(pokemonId)).called(2);
    });

    test('debe crear diferentes providers para diferentes IDs (family behavior)', () async {
      // Arrange
      const pokemonId1 = 1;
      const pokemonId2 = 25;
      
      const species1 = PokemonSpecies(
        id: pokemonId1,
        name: 'bulbasaur',
        description: 'A strange seed was planted on its back at birth.',
        habitat: 'grassland',
        genderRate: 1,
        captureRate: 45,
        isLegendary: false,
        isMythical: false,
      );

      const species2 = PokemonSpecies(
        id: pokemonId2,
        name: 'pikachu',
        description: 'When several of these Pokémon gather.',
        habitat: 'forest',
        genderRate: 4,
        captureRate: 190,
        isLegendary: false,
        isMythical: false,
      );

      when(mockGetPokemonSpeciesUseCase.call(pokemonId1))
          .thenAnswer((_) async => Either.right(species1));
      when(mockGetPokemonSpeciesUseCase.call(pokemonId2))
          .thenAnswer((_) async => Either.right(species2));

      // Act
      final result1 = await container.read(pokemonSpeciesProvider(pokemonId1).future);
      final result2 = await container.read(pokemonSpeciesProvider(pokemonId2).future);

      // Assert
      expect(result1.id, pokemonId1);
      expect(result1.name, 'bulbasaur');
      expect(result2.id, pokemonId2);
      expect(result2.name, 'pikachu');
      verify(mockGetPokemonSpeciesUseCase.call(pokemonId1)).called(1);
      verify(mockGetPokemonSpeciesUseCase.call(pokemonId2)).called(1);
    });
  });
}
