import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pokeapp/core/di/injection.dart';
import 'package:pokeapp/core/error/failures.dart';
import 'package:pokeapp/domain/entities/pokemon.dart';
import 'package:pokeapp/domain/repositories/pokemon_repository.dart';
import 'package:pokeapp/domain/usecases/get_favorites_usecase.dart';
import 'package:pokeapp/domain/usecases/get_pokemon_detail_usecase.dart';
import 'package:pokeapp/domain/usecases/toggle_favorite_usecase.dart';
import 'package:pokeapp/presentation/detail/viewmodels/pokemon_detail_viewmodel.dart';

import 'pokemon_detail_viewmodel_test.mocks.dart';

@GenerateMocks([
  GetPokemonDetailUseCase,
  GetFavoritesUseCase,
  ToggleFavoriteUseCase,
])
void main() {
  late MockGetPokemonDetailUseCase mockGetPokemonDetailUseCase;
  late MockGetFavoritesUseCase mockGetFavoritesUseCase;
  late MockToggleFavoriteUseCase mockToggleFavoriteUseCase;
  late ProviderContainer container;

  // Helper para crear un Pokemon de prueba
  Pokemon createTestPokemon(int id, String name) {
    return Pokemon(
      id: id,
      name: name,
      height: 7,
      weight: 69,
      baseExperience: 64,
      abilities: const ['overgrow'],
      types: const ['grass', 'poison'],
      sprites: PokemonSprites(
        frontDefault: 'https://example.com/$name.png',
      ),
      stats: const PokemonStats(
        hp: 45,
        attack: 49,
        defense: 49,
        specialAttack: 65,
        specialDefense: 65,
        speed: 45,
      ),
    );
  }

  setUp(() {
    mockGetPokemonDetailUseCase = MockGetPokemonDetailUseCase();
    mockGetFavoritesUseCase = MockGetFavoritesUseCase();
    mockToggleFavoriteUseCase = MockToggleFavoriteUseCase();

    // Configurar GetIt para testing
    if (getIt.isRegistered<GetPokemonDetailUseCase>()) {
      getIt.unregister<GetPokemonDetailUseCase>();
    }
    if (getIt.isRegistered<GetFavoritesUseCase>()) {
      getIt.unregister<GetFavoritesUseCase>();
    }
    if (getIt.isRegistered<ToggleFavoriteUseCase>()) {
      getIt.unregister<ToggleFavoriteUseCase>();
    }

    getIt.registerLazySingleton<GetPokemonDetailUseCase>(
      () => mockGetPokemonDetailUseCase,
    );
    getIt.registerLazySingleton<GetFavoritesUseCase>(
      () => mockGetFavoritesUseCase,
    );
    getIt.registerLazySingleton<ToggleFavoriteUseCase>(
      () => mockToggleFavoriteUseCase,
    );

    container = ProviderContainer();
  });

  tearDown(() {
    container.dispose();
    
    if (getIt.isRegistered<GetPokemonDetailUseCase>()) {
      getIt.unregister<GetPokemonDetailUseCase>();
    }
    if (getIt.isRegistered<GetFavoritesUseCase>()) {
      getIt.unregister<GetFavoritesUseCase>();
    }
    if (getIt.isRegistered<ToggleFavoriteUseCase>()) {
      getIt.unregister<ToggleFavoriteUseCase>();
    }
  });

  group('PokemonDetailViewModel', () {
    test('debe cargar Pokemon correctamente cuando no está en favoritos', () async {
      // Arrange
      const pokemonId = 1;
      final pokemon = createTestPokemon(pokemonId, 'bulbasaur');

      when(mockGetPokemonDetailUseCase.call(pokemonId))
          .thenAnswer((_) async => Either.right(pokemon));
      when(mockGetFavoritesUseCase.call())
          .thenAnswer((_) async => <int>[]); // Sin favoritos

      // Act
      final result = await container.read(
        pokemonDetailViewModelProvider(pokemonId).future,
      );

      // Assert
      expect(result.pokemon, pokemon);
      expect(result.isFavorite, false);
      expect(result.errorMessage, null);
      verify(mockGetPokemonDetailUseCase.call(pokemonId)).called(1);
      verify(mockGetFavoritesUseCase.call()).called(1);
    });

    test('debe cargar Pokemon correctamente cuando está en favoritos', () async {
      // Arrange
      const pokemonId = 1;
      final pokemon = createTestPokemon(pokemonId, 'bulbasaur');

      when(mockGetPokemonDetailUseCase.call(pokemonId))
          .thenAnswer((_) async => Either.right(pokemon));
      when(mockGetFavoritesUseCase.call())
          .thenAnswer((_) async => [1, 4, 7]); // Incluye el Pokemon

      // Act
      final result = await container.read(
        pokemonDetailViewModelProvider(pokemonId).future,
      );

      // Assert
      expect(result.pokemon, pokemon);
      expect(result.isFavorite, true);
      expect(result.errorMessage, null);
      verify(mockGetPokemonDetailUseCase.call(pokemonId)).called(1);
      verify(mockGetFavoritesUseCase.call()).called(1);
    });

    test('debe retornar estado de error cuando falla la carga', () async {
      // Arrange
      const pokemonId = 999;
      const failure = ServerFailure('Pokemon not found');

      when(mockGetPokemonDetailUseCase.call(pokemonId))
          .thenAnswer((_) async => Either.left(failure));

      // Act
      final result = await container.read(
        pokemonDetailViewModelProvider(pokemonId).future,
      );

      // Assert
      expect(result.pokemon, null);
      expect(result.isFavorite, false);
      expect(result.errorMessage, 'Pokemon not found');
      verify(mockGetPokemonDetailUseCase.call(pokemonId)).called(1);
      verifyNever(mockGetFavoritesUseCase.call());
    });

    test('debe hacer toggle de favorito correctamente', () async {
      // Arrange
      const pokemonId = 1;
      final pokemon = createTestPokemon(pokemonId, 'bulbasaur');

      when(mockGetPokemonDetailUseCase.call(pokemonId))
          .thenAnswer((_) async => Either.right(pokemon));
      when(mockGetFavoritesUseCase.call())
          .thenAnswer((_) async => <int>[]); // No favorito inicialmente
      when(mockToggleFavoriteUseCase.call(pokemonId))
          .thenAnswer((_) async {});

      // Act - Esperar a que el estado inicial se cargue
      await container.read(pokemonDetailViewModelProvider(pokemonId).future);
      
      // Hacer toggle
      await container
          .read(pokemonDetailViewModelProvider(pokemonId).notifier)
          .toggleFavorite();

      // Assert
      final state = container.read(pokemonDetailViewModelProvider(pokemonId));
      expect(state.hasValue, true);
      expect(state.value!.isFavorite, true); // Cambió de false a true
      verify(mockToggleFavoriteUseCase.call(pokemonId)).called(1);
    });

    test('debe manejar toggle de favorito desde favorito a no-favorito', () async {
      // Arrange
      const pokemonId = 1;
      final pokemon = createTestPokemon(pokemonId, 'bulbasaur');

      when(mockGetPokemonDetailUseCase.call(pokemonId))
          .thenAnswer((_) async => Either.right(pokemon));
      when(mockGetFavoritesUseCase.call())
          .thenAnswer((_) async => [1]); // Ya está en favoritos
      when(mockToggleFavoriteUseCase.call(pokemonId))
          .thenAnswer((_) async {});

      // Act - Esperar a que el estado inicial se cargue
      await container.read(pokemonDetailViewModelProvider(pokemonId).future);
      
      // Hacer toggle
      await container
          .read(pokemonDetailViewModelProvider(pokemonId).notifier)
          .toggleFavorite();

      // Assert
      final state = container.read(pokemonDetailViewModelProvider(pokemonId));
      expect(state.hasValue, true);
      expect(state.value!.isFavorite, false); // Cambió de true a false
      verify(mockToggleFavoriteUseCase.call(pokemonId)).called(1);
    });

    test('toggle no debe hacer nada si el Pokemon no está cargado', () async {
      // Arrange
      const pokemonId = 1;
      const failure = ServerFailure('Pokemon not found');

      when(mockGetPokemonDetailUseCase.call(pokemonId))
          .thenAnswer((_) async => Either.left(failure));

      // Act
      await container.read(pokemonDetailViewModelProvider(pokemonId).future);
      
      // Intentar toggle cuando hay error
      await container
          .read(pokemonDetailViewModelProvider(pokemonId).notifier)
          .toggleFavorite();

      // Assert
      verifyNever(mockToggleFavoriteUseCase.call(any));
    });

    test('debe refrescar los datos correctamente', () async {
      // Arrange
      const pokemonId = 1;
      final pokemon = createTestPokemon(pokemonId, 'bulbasaur');

      when(mockGetPokemonDetailUseCase.call(pokemonId))
          .thenAnswer((_) async => Either.right(pokemon));
      when(mockGetFavoritesUseCase.call())
          .thenAnswer((_) async => <int>[]);

      // Act - Cargar inicial
      await container.read(pokemonDetailViewModelProvider(pokemonId).future);
      
      // Refrescar
      await container
          .read(pokemonDetailViewModelProvider(pokemonId).notifier)
          .refresh();

      // Assert
      final state = container.read(pokemonDetailViewModelProvider(pokemonId));
      expect(state.hasValue, true);
      expect(state.value!.pokemon, pokemon);
      
      // Se debe haber llamado 2 veces: carga inicial + refresh
      verify(mockGetPokemonDetailUseCase.call(pokemonId)).called(2);
      verify(mockGetFavoritesUseCase.call()).called(2);
    });

    test('refresh no debe hacer nada si el Pokemon no está cargado', () async {
      // Arrange
      const pokemonId = 1;
      const failure = ServerFailure('Pokemon not found');

      when(mockGetPokemonDetailUseCase.call(pokemonId))
          .thenAnswer((_) async => Either.left(failure));

      // Act
      await container.read(pokemonDetailViewModelProvider(pokemonId).future);
      
      // Intentar refresh cuando hay error
      await container
          .read(pokemonDetailViewModelProvider(pokemonId).notifier)
          .refresh();

      // Assert - Solo se llamó en la carga inicial, no en refresh
      verify(mockGetPokemonDetailUseCase.call(pokemonId)).called(1);
    });

    test('debe crear diferentes ViewModels para diferentes Pokemon IDs', () async {
      // Arrange
      const pokemonId1 = 1;
      const pokemonId2 = 25;
      final pokemon1 = createTestPokemon(pokemonId1, 'bulbasaur');
      final pokemon2 = createTestPokemon(pokemonId2, 'pikachu');

      when(mockGetPokemonDetailUseCase.call(pokemonId1))
          .thenAnswer((_) async => Either.right(pokemon1));
      when(mockGetPokemonDetailUseCase.call(pokemonId2))
          .thenAnswer((_) async => Either.right(pokemon2));
      when(mockGetFavoritesUseCase.call())
          .thenAnswer((_) async => <int>[]);

      // Act
      final result1 = await container.read(
        pokemonDetailViewModelProvider(pokemonId1).future,
      );
      final result2 = await container.read(
        pokemonDetailViewModelProvider(pokemonId2).future,
      );

      // Assert
      expect(result1.pokemon!.id, pokemonId1);
      expect(result1.pokemon!.name, 'bulbasaur');
      expect(result2.pokemon!.id, pokemonId2);
      expect(result2.pokemon!.name, 'pikachu');
      verify(mockGetPokemonDetailUseCase.call(pokemonId1)).called(1);
      verify(mockGetPokemonDetailUseCase.call(pokemonId2)).called(1);
    });
  });
}
