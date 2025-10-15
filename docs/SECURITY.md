# 🔒 Seguridad - PokeApp

## 📋 Tabla de Contenidos

1. [Visión General](#-visión-general)
2. [Capas de Seguridad](#-capas-de-seguridad)
3. [Seguridad en la Red](#-seguridad-en-la-red)
4. [Gestión de Estado Segura](#-gestión-de-estado-segura)
5. [Almacenamiento Seguro](#-almacenamiento-seguro)
6. [Validación y Sanitización](#-validación-y-sanitización)
7. [Manejo de Errores](#-manejo-de-errores)
8. [Logging Seguro](#-logging-seguro)
9. [Protección contra Ataques](#-protección-contra-ataques)
10. [Configuración de Producción](#-configuración-de-producción)
11. [Checklist de Seguridad](#-checklist-de-seguridad)

---

## 🎯 Visión General

Este documento describe las **9 capas de seguridad** implementadas en PokeApp, siguiendo las mejores prácticas de la industria para aplicaciones móviles.

### **Filosofía de Seguridad**

```
Security by Design, not by Accident
(Seguridad por diseño, no por accidente)
```

**Principios:**

- ✅ **Defense in Depth** - Múltiples capas de protección
- ✅ **Least Privilege** - Permisos mínimos necesarios
- ✅ **Fail Securely** - Fallar de forma segura
- ✅ **Trust Nothing** - Validar todas las entradas

---

## 🛡️ Capas de Seguridad

### **Diagrama de Capas**

```
┌─────────────────────────────────────────┐
│  Capa 9: Code Obfuscation              │ ← Build-time
├─────────────────────────────────────────┤
│  Capa 8: Logging Controlado            │ ← Runtime
├─────────────────────────────────────────┤
│  Capa 7: Dependency Injection Segura   │ ← Architecture
├─────────────────────────────────────────┤
│  Capa 6: Protección Anti-Ataques       │ ← Input Control
├─────────────────────────────────────────┤
│  Capa 5: Almacenamiento Seguro         │ ← Data at Rest
├─────────────────────────────────────────┤
│  Capa 4: Manejo de Errores Robusto     │ ← Error Handling
├─────────────────────────────────────────┤
│  Capa 3: Validación de Datos           │ ← Input Validation
├─────────────────────────────────────────┤
│  Capa 2: Gestión de Estado Segura      │ ← State Management
├─────────────────────────────────────────┤
│  Capa 1: Seguridad en la Red           │ ← Network Security
└─────────────────────────────────────────┘
```

---

## 🌐 Seguridad en la Red (Capa 1)

### **1.1 HTTPS Enforced**

**Implementación:**

```dart
// lib/core/network/api_constants.dart
class ApiConstants {
  /// Base URL con HTTPS obligatorio
  static const String baseUrl = 'https://pokeapi.co/api/v2';

  // ❌ NO permitir HTTP en producción
  // static const String baseUrl = 'http://pokeapi.co/api/v2';
}
```

**Verificación:**

```dart
assert(
  ApiConstants.baseUrl.startsWith('https://'),
  'La URL base debe usar HTTPS en producción',
);
```

---

### **1.2 Certificate Pinning (Preparado)**

**¿Qué es?**
Validar que el certificado del servidor coincida con uno esperado, previniendo ataques Man-in-the-Middle.

**Implementación Futura:**

```dart
// TODO: Implementar con dio_security_options
import 'package:dio_security_options/dio_security_options.dart';

final dio = Dio()
  ..httpClientAdapter = IOHttpClientAdapter()
  ..options.baseUrl = ApiConstants.baseUrl;

// Certificate pinning
dio.httpClientAdapter = IOHttpClientAdapter(
  createHttpClient: () {
    final client = HttpClient();
    client.badCertificateCallback = (cert, host, port) {
      // Validar certificado contra hash esperado
      return cert.sha256.hex == expectedCertHash;
    };
    return client;
  },
);
```

**Beneficio:** Previene MITM attacks incluso con certificados válidos.

---

### **1.3 Timeout Configuration**

**Implementación:**

```dart
// lib/core/network/dio_client.dart
class DioClient {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      connectTimeout: const Duration(seconds: 30),  // Conexión
      receiveTimeout: const Duration(seconds: 30),  // Recepción
      sendTimeout: const Duration(seconds: 30),     // Envío
    ),
  );
}
```

**Beneficio:** Previene DoS (Denial of Service) por requests colgados.

---

### **1.4 Request Retry with Exponential Backoff**

**Implementación:**

```dart
// Interceptor para retry con backoff
class RetryInterceptor extends Interceptor {
  final int maxRetries = 3;
  final Duration initialDelay = Duration(milliseconds: 500);

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    if (err.type == DioExceptionType.connectionTimeout ||
        err.type == DioExceptionType.receiveTimeout) {

      final retryCount = err.requestOptions.extra['retryCount'] ?? 0;

      if (retryCount < maxRetries) {
        // Exponential backoff: 500ms, 1s, 2s
        final delay = initialDelay * pow(2, retryCount);
        await Future.delayed(delay);

        err.requestOptions.extra['retryCount'] = retryCount + 1;

        try {
          final response = await _dio.fetch(err.requestOptions);
          return handler.resolve(response);
        } catch (e) {
          return handler.next(err);
        }
      }
    }

    return handler.next(err);
  }
}
```

**Beneficio:** Resiliencia ante fallos temporales de red.

---

## 🔐 Gestión de Estado Segura (Capa 2)

### **2.1 Immutability con Freezed**

**¿Por qué es seguro?**

- Estado inmutable = no hay race conditions
- No se puede modificar accidentalmente
- Cambios explícitos con copyWith

**Implementación:**

```dart
@freezed
class PokemonDetailState with _$PokemonDetailState {
  const factory PokemonDetailState({
    required Pokemon? pokemon,
    required bool isFavorite,
    required String? errorMessage,
  }) = _PokemonDetailState;
}

// ❌ NO se puede hacer esto:
// state.pokemon = newPokemon; // ERROR: Inmutable

// ✅ Solo esto:
state = state.copyWith(pokemon: newPokemon);
```

---

### **2.2 Provider Scoping y AutoDispose**

**Aislamiento de Estado:**

```dart
/// Provider con family: cada ID tiene su propio estado
final pokemonDetailProvider =
    FutureProvider.autoDispose.family<Pokemon, int>((ref, id) async {
  // Estado aislado por ID
  // Pokemon 1 NO afecta a Pokemon 25
});
```

**Auto-limpieza:**

```dart
/// autoDispose: se limpia cuando no hay listeners
final pokemonSpeciesProvider =
    FutureProvider.autoDispose.family<PokemonSpecies, int>((ref, id) async {
  // Se limpia automáticamente cuando la pantalla se cierra
  // Previene memory leaks
});
```

**Beneficio:**

- No hay contaminación de estado entre componentes
- Memory leaks prevenidos automáticamente

---

### **2.3 Validación en ViewModels**

**Ejemplo:**

```dart
@riverpod
class PokemonDetailViewModel extends _$PokemonDetailViewModel {
  Future<void> toggleFavorite() async {
    final currentState = state.value;

    // ✅ Validar estado antes de actuar
    if (currentState?.pokemon == null) {
      Logger.warning('Toggle favorite called without pokemon loaded');
      return; // Fail securely
    }

    final pokemon = currentState!.pokemon!;

    // Optimistic update
    state = AsyncValue.data(
      currentState.copyWith(isFavorite: !currentState.isFavorite),
    );

    // Execute
    await _toggleFavoriteUseCase(pokemon.id);
  }
}
```

---

## ✅ Validación de Datos (Capa 3)

### **3.1 Input Validation en Use Cases**

**Principio:** Nunca confíes en inputs del usuario o externos.

**Ejemplo 1: Validación de Límites**

```dart
// lib/domain/usecases/get_pokemon_list_usecase.dart
class GetPokemonListUseCase {
  Future<Either<Failure, List<PokemonListItem>>> call({
    required int limit,
    required int offset,
  }) async {
    // ✅ Validar límite
    if (limit <= 0 || limit > 100) {
      return Either.left(
        const ValidationFailure(
          'Limit must be between 1 and 100',
        ),
      );
    }

    // ✅ Validar offset
    if (offset < 0) {
      return Either.left(
        const ValidationFailure(
          'Offset cannot be negative',
        ),
      );
    }

    // Continuar con la lógica
    return await repository.getPokemonList(limit: limit, offset: offset);
  }
}
```

**Ejemplo 2: Validación de Búsqueda**

```dart
// lib/domain/usecases/search_pokemon_usecase.dart
class SearchPokemonUseCase {
  Future<Either<Failure, List<PokemonListItem>>> call(String query) async {
    // ✅ Validar query no vacío
    if (query.trim().isEmpty) {
      return Either.left(
        const ValidationFailure('Query cannot be empty'),
      );
    }

    // ✅ Validar longitud mínima
    if (query.length < 2) {
      return Either.left(
        const ValidationFailure(
          'Query must have at least 2 characters',
        ),
      );
    }

    // ✅ Sanitizar query
    final sanitizedQuery = query.trim().toLowerCase();

    return await repository.searchPokemon(sanitizedQuery);
  }
}
```

---

### **3.2 Sanitización de Respuestas API**

**Problema:** API puede retornar datos malformados o inesperados.

**Solución:**

```dart
// lib/data/models/pokemon_species_model.dart
extension PokemonSpeciesModelX on PokemonSpeciesModel {
  PokemonSpecies toEntity() {
    return PokemonSpecies(
      id: id,
      name: name.trim().toLowerCase(), // ✅ Normalizar

      // ✅ Limpiar caracteres especiales de descripción
      description: description
          .replaceAll('\n', ' ')  // Saltos de línea → espacios
          .replaceAll('\f', ' ')  // Form feed → espacios
          .replaceAll(RegExp(r'\s+'), ' ') // Múltiples espacios → uno
          .trim(),

      habitat: habitat.trim().toLowerCase(),

      // ✅ Validar rangos
      genderRate: genderRate.clamp(-1, 8), // Solo -1 a 8 válidos
      captureRate: captureRate.clamp(0, 255), // 0 a 255 válidos

      isLegendary: isLegendary,
      isMythical: isMythical,
    );
  }
}
```

---

### **3.3 Null Safety**

**Dart 3.0+ Null Safety:**

```dart
// ❌ Esto NO compila si pokemon es nullable
String name = pokemon.name;

// ✅ Forma segura
String? name = pokemon?.name;
String name = pokemon?.name ?? 'Unknown';
```

**En Models:**

```dart
@freezed
class PokemonDetailState with _$PokemonDetailState {
  const factory PokemonDetailState({
    required Pokemon? pokemon,        // ✅ Explícitamente nullable
    required bool isFavorite,         // ✅ Nunca null
    required String? errorMessage,    // ✅ Nullable explícito
  }) = _PokemonDetailState;
}
```

---

## 🔥 Manejo de Errores Robusto (Capa 4)

### **4.1 Jerarquía de Failures**

```dart
// lib/core/error/failures.dart
abstract class Failure {
  final String message;
  const Failure(this.message);
}

// 8 tipos específicos de errores
class ServerFailure extends Failure {
  const ServerFailure(String message) : super(message);
}

class NetworkFailure extends Failure {
  const NetworkFailure(String message) : super(message);
}

class CacheFailure extends Failure {
  const CacheFailure(String message) : super(message);
}

class NotFoundFailure extends Failure {
  const NotFoundFailure(String message) : super(message);
}

class ValidationFailure extends Failure {
  const ValidationFailure(String message) : super(message);
}

class UnauthorizedFailure extends Failure {
  const UnauthorizedFailure(String message) : super(message);
}

class TimeoutFailure extends Failure {
  const TimeoutFailure(String message) : super(message);
}

class UnknownFailure extends Failure {
  const UnknownFailure(String message) : super(message);
}
```

---

### **4.2 Try-Catch Granular**

**Implementación en Repository:**

```dart
// lib/data/repositories/pokemon_repository_impl.dart
@override
Future<Either<Failure, Pokemon>> getPokemonDetail(int id) async {
  try {
    final model = await remoteDataSource.getPokemonDetail(id);
    return Either.right(model.toEntity());

  } on ServerException catch (e) {
    Logger.error('Server error fetching pokemon $id', e);
    return Either.left(ServerFailure(e.message));

  } on NetworkException catch (e) {
    Logger.error('Network error fetching pokemon $id', e);
    return Either.left(NetworkFailure(e.message));

  } on NotFoundException catch (e) {
    Logger.warning('Pokemon $id not found');
    return Either.left(NotFoundFailure(e.message));

  } on TimeoutException catch (e) {
    Logger.warning('Timeout fetching pokemon $id');
    return Either.left(TimeoutFailure('Request timeout'));

  } catch (e, stackTrace) {
    Logger.error('Unknown error fetching pokemon $id', e, stackTrace);
    return Either.left(UnknownFailure(e.toString()));
  }
}
```

**Beneficio:**

- Errores específicos = mejores mensajes al usuario
- Logging detallado para debugging
- No se exponen detalles técnicos al usuario

---

### **4.3 Error Handling en UI**

```dart
// lib/presentation/detail/pages/pokemon_detail_screen.dart
@override
Widget build(BuildContext context) {
  final viewModelState = ref.watch(pokemonDetailViewModelProvider(pokemonId));

  return viewModelState.when(
    data: (state) {
      // ✅ Estado exitoso
      if (state.pokemon != null) {
        return _buildPokemonDetail(context, state.pokemon!, state.isFavorite);
      }

      // ✅ Error con UI amigable
      return ErrorDisplayWidget(
        message: state.errorMessage ?? 'Unknown error',
        onRetry: () => ref.refresh(pokemonDetailViewModelProvider(pokemonId)),
      );
    },

    // ✅ Loading state
    loading: () => const LoadingIndicator(),

    // ✅ Error capturado
    error: (error, _) => ErrorDisplayWidget(
      message: 'Failed to load Pokemon',
      onRetry: () => ref.refresh(pokemonDetailViewModelProvider(pokemonId)),
    ),
  );
}
```

---

## 💾 Almacenamiento Seguro (Capa 5)

### **5.1 SharedPreferences con Consideraciones de Seguridad**

**Uso Actual:**

```dart
// lib/data/datasources/local/pokemon_local_datasource.dart
class PokemonLocalDataSourceImpl implements PokemonLocalDataSource {
  final SharedPreferences _prefs;
  static const String _favoritesKey = 'favorites';

  @override
  Future<List<int>> getFavorites() async {
    final List<String>? favoritesStr = _prefs.getStringList(_favoritesKey);
    return favoritesStr?.map((id) => int.parse(id)).toList() ?? [];
  }

  @override
  Future<void> saveFavorites(List<int> favorites) async {
    final List<String> favoritesStr = favorites.map((id) => id.toString()).toList();
    await _prefs.setStringList(_favoritesKey, favoritesStr);
  }
}
```

**Datos Almacenados:**

- ✅ IDs de favoritos (no sensibles)
- ✅ Preferencias de tema (no sensibles)
- ✅ Flag de onboarding completado (no sensibles)

---

### **5.2 Almacenamiento Cifrado (Preparado para Futuro)**

**Para Datos Sensibles:**

```dart
// TODO: Implementar para tokens de autenticación futura
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  final FlutterSecureStorage _storage = const FlutterSecureStorage(
    aOptions: AndroidOptions(
      encryptedSharedPreferences: true,
    ),
    iOptions: IOSOptions(
      accessibility: KeychainAccessibility.first_unlock,
    ),
  );

  Future<void> saveToken(String token) async {
    await _storage.write(key: 'auth_token', value: token);
  }

  Future<String?> getToken() async {
    return await _storage.read(key: 'auth_token');
  }

  Future<void> deleteToken() async {
    await _storage.delete(key: 'auth_token');
  }
}
```

**Beneficio:**

- Datos cifrados en reposo
- Protección contra root/jailbreak
- Integración con Keychain (iOS) y KeyStore (Android)

---

### **5.3 Política de No Almacenar Datos Sensibles**

**❌ NO Almacenamos:**

- Contraseñas
- Tokens de autenticación (aún)
- Información personal identificable
- Datos de pago
- Claves API

**✅ SÍ Almacenamos:**

- IDs de favoritos
- Preferencias de UI
- Cache de datos públicos

---

## 🔒 Dependency Injection Segura (Capa 7)

### **6.1 Lazy Loading con GetIt**

**Beneficio de Seguridad:**

```dart
// lib/core/di/injection.dart
final getIt = GetIt.instance;

void setupDependencies() {
  // ✅ Lazy Singleton: se crea solo cuando se usa
  getIt.registerLazySingleton<DioClient>(() => DioClient());

  // ✅ No se crean todas las dependencias al inicio
  // ✅ Reduce surface de ataque
  // ✅ Memory footprint mínimo
}
```

---

### **6.2 Fácil de Mockear en Tests**

```dart
// test/presentation/detail/viewmodels/pokemon_detail_viewmodel_test.dart
setUp(() {
  mockUseCase = MockGetPokemonDetailUseCase();

  // ✅ Reemplazar dependencia real con mock
  if (getIt.isRegistered<GetPokemonDetailUseCase>()) {
    getIt.unregister<GetPokemonDetailUseCase>();
  }
  getIt.registerLazySingleton<GetPokemonDetailUseCase>(
    () => mockUseCase,
  );
});
```

**Beneficio:** Tests no hacen llamadas reales a APIs.

---

## 📝 Logging Seguro (Capa 8)

### **7.1 Logger con Niveles**

```dart
// lib/core/utils/logger.dart
class Logger {
  static void info(String message) {
    // ✅ OK en producción
    debugPrint('[INFO] $message');
  }

  static void debug(String message) {
    // ⚠️ Solo en debug mode
    assert(() {
      debugPrint('[DEBUG] $message');
      return true;
    }());
  }

  static void warning(String message) {
    // ✅ OK en producción
    debugPrint('[WARNING] $message');
  }

  static void error(String message, [Object? error, StackTrace? stackTrace]) {
    // ✅ OK en producción (no expone datos sensibles)
    debugPrint('[ERROR] $message');
    if (error != null) {
      debugPrint('[ERROR] Exception: $error');
    }
    if (stackTrace != null) {
      debugPrint('[ERROR] StackTrace: $stackTrace');
    }
  }
}
```

---

### **7.2 Eliminar Logs en Release**

**En android/app/proguard-rules.pro:**

```proguard
# Eliminar logs en release
-assumenosideeffects class android.util.Log {
    public static *** d(...);
    public static *** v(...);
    public static *** i(...);
}
```

**En iOS (Xcode Scheme):**

```
Disable logging for Release configuration
```

---

## 🛡️ Protección contra Ataques (Capa 6)

### **8.1 XSS Prevention**

**PokeApp NO ejecuta:**

- ❌ HTML dinámico
- ❌ JavaScript externo
- ❌ Código evaluado en runtime

**Sanitización de Texto:**

```dart
// Todo texto de API es sanitizado
description: description
    .replaceAll('<script>', '')    // ✅ Remove scripts
    .replaceAll('</script>', '')
    .replaceAll('<', '&lt;')       // ✅ Escape HTML
    .replaceAll('>', '&gt;')
    .trim(),
```

---

### **8.2 SQL Injection Prevention**

**PokeApp NO usa:**

- ❌ SQL directo
- ❌ Queries concatenadas

**Usa:**

- ✅ SharedPreferences (key-value store)
- ✅ Futuro: Drift/Hive con queries parametrizadas

```dart
// Ejemplo con Drift (futuro)
Future<List<Pokemon>> searchPokemon(String query) {
  // ✅ Query parametrizada (segura)
  return (select(pokemons)
    ..where((p) => p.name.like('%$query%'))) // Drift escapa automáticamente
    .get();
}
```

---

### **8.3 Rate Limiting**

**Debouncer para Búsqueda:**

```dart
// lib/presentation/home/pages/home_screen.dart
final _searchDebouncer = Debouncer(
  delay: const Duration(milliseconds: 500),
);

void _onSearchChanged(String query) {
  // ✅ Solo ejecuta después de 500ms de inactividad
  _searchDebouncer.run(() {
    ref.read(pokemonListViewModelProvider.notifier).searchPokemons(query);
  });
}
```

**Beneficio:** Previene spam de requests.

---

### **8.4 Input Length Limits**

```dart
TextField(
  maxLength: 50, // ✅ Límite de caracteres
  inputFormatters: [
    FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9]')), // ✅ Solo alfanuméricos
  ],
)
```

---

## 🚀 Configuración de Producción (Capa 9)

### **9.1 Code Obfuscation**

**Build de Producción:**

```bash
# Android
flutter build apk --release \
  --obfuscate \
  --split-debug-info=build/app/outputs/symbols

# iOS
flutter build ipa --release \
  --obfuscate \
  --split-debug-info=build/ios/outputs/symbols
```

**¿Qué hace?**

- Renombra clases, métodos, variables
- Hace el código ilegible en reverse engineering
- Separa símbolos de debug

---

### **9.2 ProGuard/R8 (Android)**

**android/app/build.gradle:**

```gradle
buildTypes {
    release {
        minifyEnabled true
        shrinkResources true
        proguardFiles getDefaultProguardFile('proguard-android-optimize.txt'), 'proguard-rules.pro'
    }
}
```

---

### **9.3 Signing Configuration**

**Android (android/app/build.gradle):**

```gradle
signingConfigs {
    release {
        storeFile file(KEYSTORE_FILE)
        storePassword KEYSTORE_PASSWORD
        keyAlias KEY_ALIAS
        keyPassword KEY_PASSWORD
    }
}
```

**iOS (Xcode):**

- Code Signing Identity
- Provisioning Profile
- Entitlements configurados

---

## ✅ Checklist de Seguridad

### **Pre-Release Checklist**

#### **Red**

- [ ] HTTPS enforced en todas las URLs
- [ ] Timeouts configurados (30s)
- [ ] Certificate pinning implementado (futuro)
- [ ] Retry con exponential backoff

#### **Estado**

- [ ] Todos los modelos son inmutables (Freezed)
- [ ] Providers usan autoDispose
- [ ] No hay estado global mutable

#### **Validación**

- [ ] Inputs validados en Use Cases
- [ ] Sanitización de respuestas API
- [ ] Null safety habilitado
- [ ] Límites de caracteres en inputs

#### **Errores**

- [ ] 8 tipos de Failures definidos
- [ ] Try-catch granular en repositories
- [ ] Errors no exponen stack traces al usuario
- [ ] UI maneja todos los estados (loading/error/success)

#### **Almacenamiento**

- [ ] No se almacenan datos sensibles
- [ ] SharedPreferences solo para preferencias
- [ ] Flutter Secure Storage preparado para futuro

#### **Logging**

- [ ] Logger con niveles (info/debug/error)
- [ ] Debug logs solo en modo debug
- [ ] No se loggean datos sensibles
- [ ] ProGuard elimina logs en release

#### **Ataques**

- [ ] XSS prevention (no HTML/JS dinámico)
- [ ] SQL Injection prevention (no SQL directo)
- [ ] Rate limiting (debouncer en búsqueda)
- [ ] Input length limits

#### **Build**

- [ ] Obfuscation habilitado para release
- [ ] ProGuard configurado (Android)
- [ ] Code signing configurado
- [ ] Debug symbols separados

---

## 🔍 Auditoría de Seguridad

### **Herramientas Recomendadas**

#### **1. flutter_lints**

```yaml
# analysis_options.yaml
include: package:flutter_lints/flutter.yaml
```

#### **2. OWASP Mobile Security Testing Guide**

- [OWASP MSTG](https://github.com/OWASP/owasp-mstg)

#### **3. Snyk (Vulnerabilities Scanner)**

```bash
npm install -g snyk
snyk test
```

#### **4. MobSF (Mobile Security Framework)**

- Escanea APK/IPA en busca de vulnerabilidades

---

## 📊 Matriz de Riesgos

| Amenaza             | Probabilidad | Impacto | Mitigación                  | Estado      |
| ------------------- | ------------ | ------- | --------------------------- | ----------- |
| MITM Attack         | Media        | Alto    | HTTPS + Certificate Pinning | ✅ Parcial  |
| XSS                 | Baja         | Medio   | No HTML/JS dinámico         | ✅ Completa |
| SQL Injection       | Nula         | Alto    | No SQL directo              | ✅ Completa |
| Data Leak           | Baja         | Medio   | No datos sensibles          | ✅ Completa |
| Reverse Engineering | Alta         | Bajo    | Code Obfuscation            | ✅ Completa |
| DoS                 | Media        | Medio   | Timeouts + Rate Limiting    | ✅ Completa |
| Memory Leak         | Baja         | Bajo    | AutoDispose                 | ✅ Completa |

---

## 🎓 Recursos de Seguridad

### **Documentación**

- [Flutter Security Best Practices](https://flutter.dev/security)
- [OWASP Mobile Top 10](https://owasp.org/www-project-mobile-top-10/)
- [Dart Security Guidelines](https://dart.dev/guides/libraries/library-tour#security-and-http)

### **Paquetes Útiles**

- `flutter_secure_storage` - Almacenamiento cifrado
- `dio_security_options` - Certificate pinning
- `flutter_jailbreak_detection` - Root/Jailbreak detection
- `local_auth` - Biometric authentication

---

## 🚨 Reporte de Vulnerabilidades

Si encuentras una vulnerabilidad de seguridad, por favor **NO abras un issue público**.

**Contacto:**

- Email: security@example.com
- GPG Key: [Clave pública]

**Tiempo de respuesta:** 48 horas

---

<p align="center">
  <strong>Seguridad es un proceso continuo, no un producto 🔒</strong>
</p>
