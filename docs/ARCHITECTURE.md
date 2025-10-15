# 🏗️ Arquitectura del Proyecto - PokeApp

## 📋 Tabla de Contenidos

1. [Visión General](#-visión-general)
2. [Principios Arquitecturales](#-principios-arquitecturales)
3. [Estructura de Capas](#-estructura-de-capas)
4. [Flujo de Datos](#-flujo-de-datos)
5. [Componentes Principales](#-componentes-principales)
6. [Patrones de Diseño](#-patrones-de-diseño)
7. [Gestión de Estado](#-gestión-de-estado)
8. [Casos de Uso Implementados](#-casos-de-uso-implementados)

---

## 🎯 Visión General

PokeApp está construida siguiendo los principios de **Clean Architecture** propuestos por Robert C. Martin (Uncle Bob), adaptados para Flutter y Dart. Esta arquitectura garantiza:

- ✅ **Separación de responsabilidades**
- ✅ **Independencia de frameworks**
- ✅ **Testabilidad completa**
- ✅ **Mantenibilidad a largo plazo**
- ✅ **Escalabilidad sin refactorings masivos**

---

## 📐 Principios Arquitecturales

### **1. Dependency Rule**

```
Presentation → Domain ← Data
     ↓           ↑         ↓
   UI Only    Entities   External
```

**Las dependencias solo apuntan hacia adentro:**

- Presentation depende de Domain
- Data depende de Domain
- Domain NO depende de nadie

### **2. Separation of Concerns**

Cada capa tiene una responsabilidad única y bien definida.

### **3. SOLID Principles**

- **S**ingle Responsibility
- **O**pen/Closed
- **L**iskov Substitution
- **I**nterface Segregation
- **D**ependency Inversion

### **4. DRY (Don't Repeat Yourself)**

Reutilización máxima de código mediante widgets, utils y extensiones.

---

## 🏛️ Estructura de Capas

### **Diagrama Completo**

```
┌─────────────────────────────────────────────────────────┐
│                   PRESENTATION LAYER                    │
│  ┌─────────────┐  ┌──────────────┐  ┌──────────────┐  │
│  │   Screens   │→ │  ViewModels  │→ │   Providers  │  │
│  │   (Pages)   │  │  (Business)  │  │   (State)    │  │
│  └─────────────┘  └──────────────┘  └──────────────┘  │
│         ↓                ↓                  ↓          │
└─────────────────────────────────────────────────────────┘
                          ↓
┌─────────────────────────────────────────────────────────┐
│                     DOMAIN LAYER                        │
│  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐ │
│  │   Entities   │  │  Use Cases   │  │ Repositories │ │
│  │   (Models)   │  │  (Business)  │  │ (Interfaces) │ │
│  └──────────────┘  └──────────────┘  └──────────────┘ │
│         ↑                ↑                  ↑          │
└─────────────────────────────────────────────────────────┘
                          ↑
┌─────────────────────────────────────────────────────────┐
│                      DATA LAYER                         │
│  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐ │
│  │    Models    │  │ Repositories │  │ Data Sources │ │
│  │  (Freezed)   │  │    (Impl)    │  │ (Remote/Loc) │ │
│  └──────────────┘  └──────────────┘  └──────────────┘ │
│         ↓                ↓                  ↓          │
└─────────────────────────────────────────────────────────┘
                          ↓
┌─────────────────────────────────────────────────────────┐
│                    EXTERNAL LAYER                       │
│        ┌──────────┐        ┌────────────────┐          │
│        │   API    │        │ Local Storage  │          │
│        │ PokeAPI  │        │ SharedPrefs    │          │
│        └──────────┘        └────────────────┘          │
└─────────────────────────────────────────────────────────┘
```

---

## 📂 Estructura Detallada del Proyecto

```
lib/
├── 📱 presentation/              # Capa de Presentación
│   ├── splash/                  # Pantalla inicial
│   │   └── pages/
│   │       └── splash_screen.dart
│   │
│   ├── onboarding/              # Tutorial inicial
│   │   ├── pages/
│   │   │   └── onboarding_screen.dart
│   │   ├── viewmodels/
│   │   │   └── onboarding_viewmodel.dart
│   │   └── widgets/
│   │       └── onboarding_page_widget.dart
│   │
│   ├── home/                    # Pantalla principal
│   │   ├── pages/
│   │   │   └── home_screen.dart
│   │   ├── viewmodels/
│   │   │   └── pokemon_list_viewmodel.dart
│   │   ├── models/
│   │   │   └── pokemon_list_state.dart
│   │   ├── providers/
│   │   │   └── pokemon_detail_provider.dart
│   │   └── widgets/
│   │       ├── pokemon_card.dart
│   │       └── search_bar_widget.dart
│   │
│   ├── detail/                  # Detalles del Pokémon
│   │   ├── pages/
│   │   │   └── pokemon_detail_screen.dart
│   │   ├── viewmodels/
│   │   │   └── pokemon_detail_viewmodel.dart
│   │   ├── models/
│   │   │   └── pokemon_detail_state.dart
│   │   ├── providers/
│   │   │   └── pokemon_species_provider.dart
│   │   └── widgets/
│   │       ├── pokemon_stat_bar.dart
│   │       └── type_badge.dart
│   │
│   ├── favorites/               # Pokémon favoritos
│   │   ├── pages/
│   │   │   └── favorites_screen.dart
│   │   └── viewmodels/
│   │       └── favorites_viewmodel.dart
│   │
│   ├── regions/                 # Navegación por regiones
│   │   └── pages/
│   │       └── regions_screen.dart
│   │
│   ├── profile/                 # Perfil de usuario
│   │   ├── pages/
│   │   │   └── profile_screen.dart
│   │   └── viewmodels/
│   │       └── profile_viewmodel.dart
│   │
│   ├── theme/                   # Selector de tema
│   │   └── viewmodels/
│   │       └── theme_viewmodel.dart
│   │
│   └── navigation/              # Navegación inferior
│       └── pages/
│           └── main_navigation_screen.dart
│
├── 🎯 domain/                    # Capa de Dominio (Business Logic)
│   ├── entities/                # Entidades puras
│   │   ├── pokemon.dart
│   │   ├── pokemon_list_item.dart
│   │   └── pokemon_species.dart
│   │
│   ├── repositories/            # Interfaces (contratos)
│   │   └── pokemon_repository.dart
│   │
│   └── usecases/               # Casos de uso
│       ├── get_pokemon_list_usecase.dart
│       ├── get_pokemon_detail_usecase.dart
│       ├── get_pokemon_species_usecase.dart
│       ├── search_pokemon_usecase.dart
│       ├── get_favorites_usecase.dart
│       └── toggle_favorite_usecase.dart
│
├── 💾 data/                      # Capa de Datos
│   ├── models/                  # Modelos Freezed con JSON
│   │   ├── pokemon_model.dart
│   │   ├── pokemon_list_response_model.dart
│   │   └── pokemon_species_model.dart
│   │
│   ├── datasources/             # Fuentes de datos
│   │   ├── remote/
│   │   │   └── pokemon_remote_datasource.dart
│   │   └── local/
│   │       └── pokemon_local_datasource.dart
│   │
│   └── repositories/            # Implementaciones
│       └── pokemon_repository_impl.dart
│
├── ⚙️ core/                      # Funcionalidades compartidas
│   ├── constants/
│   │   └── app_constants.dart
│   │
│   ├── di/                     # Dependency Injection
│   │   └── injection.dart
│   │
│   ├── error/                  # Manejo de errores
│   │   ├── failures.dart
│   │   └── exceptions.dart
│   │
│   ├── extensions/             # Extensiones de Dart
│   │   ├── context_extension.dart
│   │   ├── string_extension.dart
│   │   └── int_extension.dart
│   │
│   ├── network/                # Cliente HTTP
│   │   ├── dio_client.dart
│   │   └── api_constants.dart
│   │
│   ├── routes/                 # Configuración de rutas
│   │   └── app_router.dart
│   │
│   ├── theme/                  # Sistema de temas
│   │   ├── app_theme.dart
│   │   ├── colors.dart
│   │   └── tokens.dart
│   │
│   ├── utils/                  # Utilidades
│   │   ├── logger.dart
│   │   ├── pokemon_type_helper.dart
│   │   └── pokemon_type_effectiveness.dart
│   │
│   └── widgets/                # Widgets reutilizables
│       ├── loading_indicator.dart
│       ├── error_widget.dart
│       ├── favorite_icon_button.dart
│       ├── pokemon_type_badge.dart
│       ├── pokemon_gender_ratio.dart
│       ├── pokemon_type_icon_background.dart
│       └── pokemon_image_with_type_background.dart
│
├── 🌍 l10n/                      # Localización
│   ├── app_en.arb
│   ├── app_es.arb
│   └── app_localizations.dart
│
└── main.dart                    # Punto de entrada
```

---

## 🔄 Flujo de Datos

### **Ejemplo: Cargar Lista de Pokémon**

```
1. UI (HomeScreen)
   ↓ Interacción del usuario

2. ViewModel (PokemonListViewModel)
   ↓ Llama al caso de uso

3. Use Case (GetPokemonListUseCase)
   ↓ Ejecuta lógica de negocio
   ↓ Llama al repositorio

4. Repository Interface (PokemonRepository)
   ↓ Contrato definido

5. Repository Implementation (PokemonRepositoryImpl)
   ↓ Decide: ¿cache o remote?

6. Data Source (PokemonRemoteDataSource)
   ↓ Hace request HTTP

7. API (PokeAPI)
   ↓ Responde con JSON

8. Model (PokemonModel)
   ↓ Parsea JSON con Freezed
   ↓ Convierte a Entity

9. Entity (Pokemon)
   ↓ Retorna al Use Case
   ↓ Envuelve en Either<Failure, Success>

10. ViewModel
    ↓ Actualiza estado

11. Provider (Riverpod)
    ↓ Notifica cambios

12. UI
    └─ Se redibuja con nuevos datos
```

### **Manejo de Errores en el Flujo**

```dart
// En cualquier punto del flujo:
try {
  // Operación normal
  return Either.right(data);
} on ServerException {
  return Either.left(ServerFailure('Server error'));
} on NetworkException {
  return Either.left(NetworkFailure('No internet'));
}

// En el ViewModel:
result.fold(
  (failure) => state = ErrorState(failure.message),
  (data) => state = SuccessState(data),
);
```

---

## 🧩 Componentes Principales

### **1. Entities (Domain Layer)**

**Propósito:** Modelos puros de negocio sin dependencias externas.

```dart
/// lib/domain/entities/pokemon.dart
class Pokemon {
  final int id;
  final String name;
  final int height;
  final int weight;
  final int baseExperience;
  final List<String> types;
  final List<String> abilities;
  final PokemonStats stats;
  final PokemonSprites sprites;

  // Métodos helper
  String get heightInMeters => '${(height / 10).toStringAsFixed(1)} m';
  String get weightInKg => '${(weight / 10).toStringAsFixed(1)} kg';
  String get formattedId => '#${id.toString().padLeft(3, '0')}';
}
```

**Características:**

- ✅ Sin anotaciones de serialización
- ✅ Solo lógica de dominio
- ✅ Inmutables por diseño

---

### **2. Use Cases (Domain Layer)**

**Propósito:** Encapsular lógica de negocio específica.

```dart
/// lib/domain/usecases/get_pokemon_detail_usecase.dart
class GetPokemonDetailUseCase {
  final PokemonRepository repository;

  GetPokemonDetailUseCase(this.repository);

  Future<Either<Failure, Pokemon>> call(int id) async {
    // Validación de entrada
    if (id <= 0) {
      return Either.left(
        const ValidationFailure('ID must be positive'),
      );
    }

    // Delega al repositorio
    return await repository.getPokemonDetail(id);
  }
}
```

**Reglas:**

- ✅ Una responsabilidad por caso de uso
- ✅ Validación de entradas
- ✅ Retorna Either<Failure, Success>

---

### **3. Repositories (Interfaces y Implementaciones)**

**Interface (Domain):**

```dart
/// lib/domain/repositories/pokemon_repository.dart
abstract class PokemonRepository {
  Future<Either<Failure, List<PokemonListItem>>> getPokemonList({
    required int limit,
    required int offset,
  });

  Future<Either<Failure, Pokemon>> getPokemonDetail(int id);
  Future<Either<Failure, PokemonSpecies>> getPokemonSpecies(int id);
  Future<Either<Failure, List<PokemonListItem>>> searchPokemon(String query);
}
```

**Implementación (Data):**

```dart
/// lib/data/repositories/pokemon_repository_impl.dart
class PokemonRepositoryImpl implements PokemonRepository {
  final PokemonRemoteDataSource remoteDataSource;
  final PokemonLocalDataSource localDataSource;

  @override
  Future<Either<Failure, Pokemon>> getPokemonDetail(int id) async {
    try {
      // 1. Intentar cache local
      final cached = await localDataSource.getCachedPokemon(id);
      if (cached != null) return Either.right(cached.toEntity());

      // 2. Fetch desde API
      final model = await remoteDataSource.getPokemonDetail(id);

      // 3. Guardar en cache
      await localDataSource.cachePokemon(model);

      // 4. Retornar entity
      return Either.right(model.toEntity());

    } on ServerException catch (e) {
      return Either.left(ServerFailure(e.message));
    } on NetworkException catch (e) {
      return Either.left(NetworkFailure(e.message));
    }
  }
}
```

---

### **4. Models con Freezed (Data Layer)**

```dart
/// lib/data/models/pokemon_model.dart
@freezed
class PokemonModel with _$PokemonModel {
  const factory PokemonModel({
    required int id,
    required String name,
    required int height,
    required int weight,
    @JsonKey(name: 'base_experience') required int baseExperience,
    required List<PokemonTypeSlot> types,
    required List<PokemonAbilitySlot> abilities,
    required List<PokemonStatModel> stats,
    required PokemonSpritesModel sprites,
  }) = _PokemonModel;

  factory PokemonModel.fromJson(Map<String, dynamic> json) =>
      _$PokemonModelFromJson(json);
}

// Extensión para conversión
extension PokemonModelX on PokemonModel {
  Pokemon toEntity() {
    return Pokemon(
      id: id,
      name: name,
      height: height,
      weight: weight,
      baseExperience: baseExperience,
      types: types.map((t) => t.type.name).toList(),
      abilities: abilities.map((a) => a.ability.name).toList(),
      stats: PokemonStats(...),
      sprites: PokemonSprites(...),
    );
  }
}
```

**Ventajas de Freezed:**

- ✅ Inmutabilidad garantizada
- ✅ copyWith automático
- ✅ Equality por valor
- ✅ toString, hashCode generados
- ✅ JSON serialization

---

### **5. ViewModels con Riverpod (Presentation Layer)**

```dart
/// lib/presentation/detail/viewmodels/pokemon_detail_viewmodel.dart
@riverpod
class PokemonDetailViewModel extends _$PokemonDetailViewModel {
  late final GetPokemonDetailUseCase _getPokemonDetailUseCase;
  late final GetFavoritesUseCase _getFavoritesUseCase;
  late final ToggleFavoriteUseCase _toggleFavoriteUseCase;

  @override
  Future<PokemonDetailState> build(int pokemonId) async {
    // Inyección de dependencias
    _getPokemonDetailUseCase = getIt<GetPokemonDetailUseCase>();
    _getFavoritesUseCase = getIt<GetFavoritesUseCase>();
    _toggleFavoriteUseCase = getIt<ToggleFavoriteUseCase>();

    return await _loadPokemonDetail(pokemonId);
  }

  Future<PokemonDetailState> _loadPokemonDetail(int pokemonId) async {
    final result = await _getPokemonDetailUseCase(pokemonId);

    return await result.fold(
      (failure) async => PokemonDetailState(
        pokemon: null,
        isFavorite: false,
        errorMessage: failure.message,
      ),
      (pokemon) async {
        final isFavorite = await _checkIfFavorite(pokemon.id);
        return PokemonDetailState(
          pokemon: pokemon,
          isFavorite: isFavorite,
          errorMessage: null,
        );
      },
    );
  }

  Future<void> toggleFavorite() async {
    final currentState = state.value;
    if (currentState?.pokemon == null) return;

    final pokemon = currentState!.pokemon!;

    // Optimistic update (UI instantánea)
    state = AsyncValue.data(
      currentState.copyWith(isFavorite: !currentState.isFavorite),
    );

    // Operación en background
    await _toggleFavoriteUseCase(pokemon.id);
  }
}
```

**Beneficios:**

- ✅ Separación clara UI/lógica
- ✅ Testeable con mocks
- ✅ Optimistic updates
- ✅ Code generation con riverpod_annotation

---

### **6. Providers (Presentation Layer)**

```dart
/// lib/presentation/detail/providers/pokemon_species_provider.dart

/// Provider para obtener información de especies de un Pokémon
///
/// - autoDispose: Se limpia automáticamente cuando no hay listeners
/// - family: Permite crear un provider por cada ID de Pokémon
///   Ejemplo: pokemonSpeciesProvider(1) es diferente de pokemonSpeciesProvider(2)
final pokemonSpeciesProvider =
    FutureProvider.autoDispose.family<PokemonSpecies, int>((ref, id) async {
  final useCase = getIt<GetPokemonSpeciesUseCase>();
  final result = await useCase(id);

  return result.fold(
    (failure) => throw Exception(failure.message),
    (species) => species,
  );
});
```

**Tipos de Providers usados:**

- `@riverpod` - Code generation para ViewModels
- `FutureProvider` - Para operaciones asíncronas
- `autoDispose` - Limpieza automática
- `family` - Providers parametrizados

---

## 🎨 Patrones de Diseño

### **1. Repository Pattern**

Abstrae la fuente de datos (API, cache, base de datos).

### **2. Use Case Pattern (Clean Architecture)**

Encapsula lógica de negocio específica.

### **3. Dependency Injection (Service Locator)**

```dart
// lib/core/di/injection.dart
final getIt = GetIt.instance;

void setupDependencies() {
  // Data sources
  getIt.registerLazySingleton<DioClient>(() => DioClient());
  getIt.registerLazySingleton<PokemonRemoteDataSource>(
    () => PokemonRemoteDataSourceImpl(getIt()),
  );

  // Repositories
  getIt.registerLazySingleton<PokemonRepository>(
    () => PokemonRepositoryImpl(getIt(), getIt()),
  );

  // Use cases
  getIt.registerLazySingleton(() => GetPokemonListUseCase(getIt()));
  getIt.registerLazySingleton(() => GetPokemonDetailUseCase(getIt()));
}
```

### **4. Factory Pattern (Freezed)**

Creación de objetos inmutables con factories.

### **5. Observer Pattern (Riverpod)**

Notificación automática de cambios de estado.

### **6. Either Pattern (Functional Programming)**

Manejo de errores sin excepciones.

```dart
Either<Failure, Success> result = await operation();

result.fold(
  (failure) => handleError(failure),
  (success) => handleSuccess(success),
);
```

---

## 📊 Gestión de Estado

### **Estrategia Multi-Capa**

```
┌─────────────────────────────────────┐
│   UI Layer (Widgets)                │
│   ↓ consume                         │
├─────────────────────────────────────┤
│   Provider Layer (Riverpod)         │
│   ↓ observa                         │
├─────────────────────────────────────┤
│   ViewModel Layer (Business Logic)  │
│   ↓ ejecuta                         │
├─────────────────────────────────────┤
│   Use Case Layer (Domain)           │
│   ↓ retorna                         │
├─────────────────────────────────────┤
│   State Model (Freezed)             │
└─────────────────────────────────────┘
```

### **Ejemplo de Estado**

```dart
@freezed
class PokemonListState with _$PokemonListState {
  const factory PokemonListState({
    @Default([]) List<PokemonListItem> pokemons,
    @Default(false) bool isLoading,
    @Default(false) bool isLoadingMore,
    @Default(false) bool hasMore,
    @Default(0) int currentPage,
    String? errorMessage,
    String? searchQuery,
  }) = _PokemonListState;
}
```

### **ViewModel con Estado**

```dart
@riverpod
class PokemonListViewModel extends _$PokemonListViewModel {
  @override
  PokemonListState build() {
    _useCase = getIt<GetPokemonListUseCase>();
    Future.microtask(() => loadPokemons());
    return const PokemonListState();
  }

  Future<void> loadPokemons() async {
    state = state.copyWith(isLoading: true, errorMessage: null);

    final result = await _useCase(limit: 20, offset: 0);

    result.fold(
      (failure) => state = state.copyWith(
        isLoading: false,
        errorMessage: failure.message,
      ),
      (pokemons) => state = state.copyWith(
        isLoading: false,
        pokemons: pokemons,
        hasMore: pokemons.length >= 20,
      ),
    );
  }
}
```

---

## 🎯 Casos de Uso Implementados

### **1. Listado de Pokémon**

- **Use Case:** `GetPokemonListUseCase`
- **Features:** Paginación, scroll infinito
- **ViewModel:** `PokemonListViewModel`
- **Screen:** `HomeScreen`

### **2. Detalle de Pokémon**

- **Use Cases:** `GetPokemonDetailUseCase`, `GetPokemonSpeciesUseCase`
- **Features:** Stats, tipos, habilidades, especies, género
- **ViewModel:** `PokemonDetailViewModel`
- **Screen:** `PokemonDetailScreen`

### **3. Búsqueda**

- **Use Case:** `SearchPokemonUseCase`
- **Features:** Búsqueda en tiempo real con debouncing
- **ViewModel:** `PokemonListViewModel`
- **Widget:** `SearchBarWidget`

### **4. Favoritos**

- **Use Cases:** `GetFavoritesUseCase`, `ToggleFavoriteUseCase`
- **Features:** Persistencia local, toggle optimista
- **ViewModel:** `FavoritesViewModel`, `PokemonDetailViewModel`
- **Screen:** `FavoritesScreen`

### **5. Temas**

- **Use Case:** Preferencias locales
- **Features:** Dark/Light mode, persistencia
- **ViewModel:** `ThemeViewModel`
- **Widget:** Theme selector

### **6. Onboarding**

- **Use Case:** Primera vez del usuario
- **Features:** Tutorial interactivo, skip
- **ViewModel:** `OnboardingViewModel`
- **Screen:** `OnboardingScreen`

---

## 🔧 Herramientas y Utilidades

### **Type Effectiveness Calculator**

```dart
/// lib/core/utils/pokemon_type_effectiveness.dart
/// Calcula debilidades basándose en la tabla de tipos de Pokémon

class PokemonTypeEffectiveness {
  static const Map<String, Map<String, double>> _effectivenessChart = {
    'fire': {
      'grass': 2.0,   // 2× daño
      'water': 0.5,   // 0.5× daño
      'rock': 0.5,
      // ... 18 tipos
    },
    // ... más tipos
  };

  /// Calcula debilidades considerando tipos múltiples
  /// Para Pokémon con 2 tipos, multiplica los valores
  /// Ejemplo: Fire/Flying vs Water = 2× (fire) × 1× (flying) = 2×
  static List<String> getWeaknesses(List<String> types) {
    // Lógica de cálculo con multiplicadores
  }
}
```

### **Gender Rate Calculator**

```dart
/// Sistema de 8 partes de PokeAPI
/// -1 = sin género
/// 0 = 100% macho, 0% hembra
/// 1 = 87.5% macho, 12.5% hembra
/// 4 = 50% macho, 50% hembra
/// 8 = 0% macho, 100% hembra

double get femalePercentage {
  if (genderRate == -1) return 0;
  return (genderRate / 8) * 100;
}

double get malePercentage {
  if (genderRate == -1) return 0;
  return ((8 - genderRate) / 8) * 100;
}
```

### **Logger**

```dart
Logger.info('Pokemon loaded successfully');
Logger.error('Failed to fetch', error);
Logger.debug('Response: $data');
```

---

## ✅ Checklist de Clean Architecture

- [x] Entidades sin dependencias externas
- [x] Casos de uso con validación de entradas
- [x] Interfaces de repositorios en Domain
- [x] Implementaciones de repositorios en Data
- [x] Modelos separados de entities
- [x] Conversión model → entity
- [x] Manejo de errores con Either
- [x] Dependency injection con GetIt
- [x] ViewModels separados de UI
- [x] Providers para gestión de estado
- [x] Tests unitarios de lógica de negocio
- [x] Sin lógica de negocio en UI
- [x] Sin acceso directo a Use Cases desde Screens

---

## 🚀 Próximos Pasos

### **Mejoras Arquitecturales**

1. **Cache Layer**

   - Implementar Hive/Drift para cache persistente
   - Estrategia cache-first con fallback a API

2. **Offline-First**

   - Sincronización en background
   - Queue de operaciones pendientes

3. **Feature Modules**

   - Separar features en módulos independientes
   - Lazy loading de features

4. **BLoC Pattern** (alternativa)
   - Migrar ViewModels a BLoCs si se requiere
   - Manejo de eventos más complejo

### **Testing**

1. **Integration Tests**

   - Tests end-to-end de flujos completos
   - Tests de navegación

2. **Widget Tests**

   - Tests de UI individual
   - Tests de interacciones

3. **Coverage**
   - Objetivo: 80%+ de cobertura
   - CI/CD con checks automáticos

---

## 📚 Referencias

- [Clean Architecture - Robert C. Martin](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html)
- [Flutter Architecture Samples](https://github.com/brianegan/flutter_architecture_samples)
- [Riverpod Documentation](https://riverpod.dev/)
- [Freezed Package](https://pub.dev/packages/freezed)
- [PokeAPI Documentation](https://pokeapi.co/docs/v2)

---

<p align="center">
  <strong>Arquitectura diseñada para escalar 🚀</strong>
</p>
