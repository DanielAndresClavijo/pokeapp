# 🎮 PokeApp - Aplicación Flutter con Clean Architecture

<p align="center">
  <img src="assets/images_svg/pokeball.svg" alt="Pokeball" width="100"/>
</p>

<p align="center">
  Una aplicación moderna de Pokémon construida con Flutter siguiendo los principios de Clean Architecture, 
  diseñada para demostrar las mejores prácticas de desarrollo móvil.
</p>

<p align="center">
  <a href="#-características">Características</a> •
  <a href="#-tecnologías">Tecnologías</a> •
  <a href="#-arquitectura">Arquitectura</a> •
  <a href="#-instalación">Instalación</a> •
  <a href="#-testing">Testing</a> •
  <a href="#-ia-en-el-desarrollo">IA</a> •
  <a href="#-seguridad">Seguridad</a>
</p>

---

## 📱 Características

- ✅ **Listado de Pokémon** con scroll infinito y paginación
- ✅ **Búsqueda en tiempo real** con debouncing
- ✅ **Detalles completos** de cada Pokémon (stats, tipos, habilidades, especies)
- ✅ **Sistema de favoritos** con persistencia local
- ✅ **Modo oscuro/claro** con soporte para temas personalizados
- ✅ **Multiidioma** (Español e Inglés)
- ✅ **Onboarding** interactivo para nuevos usuarios
- ✅ **Navegación por regiones** de Pokémon
- ✅ **Indicadores de género** basados en el sistema de PokeAPI
- ✅ **Cálculo de debilidades** por tipo de Pokémon
- ✅ **Animaciones fluidas** y transiciones suaves
- ✅ **Arquitectura escalable** y mantenible

---

## 🛠️ Tecnologías

### **Framework & Lenguaje**

- **Flutter** 3.35.5 - Framework multiplataforma (gestionado con FVM)
- **FVM** (Flutter Version Management) - Gestión de versiones de Flutter
- **Dart** 3.0+ - Lenguaje de programación

### **State Management**

- **Riverpod** 2.6.1 - Gestión de estado reactiva
- **riverpod_annotation** 2.6.1 - Code generation para providers
- **riverpod_generator** 2.6.2 - Generador de código

### **Networking**

- **Dio** 5.9.0 - Cliente HTTP con interceptores
- **PokeAPI v2** - API REST de Pokémon

### **Dependency Injection**

- **GetIt** 8.2.0 - Service locator pattern

### **Code Generation**

- **Freezed** 2.5.8 - Modelos inmutables
- **json_serializable** 6.8.0 - Serialización JSON
- **build_runner** 2.4.13 - Generador de código

### **Routing**

- **GoRouter** 16.2.4 - Navegación declarativa

### **Storage**

- **shared_preferences** 2.5.3 - Persistencia local

### **UI/UX**

- **flutter_svg** 2.2.1 - Soporte para SVG
- **Custom theme system** - Tema personalizado con tokens

### **Internacionalización**

- **flutter_localizations** - Soporte multiidioma
- **intl** 0.20.2 - Formateo de texto y fechas

### **Testing**

- **flutter_test** - Framework de testing
- **mockito** 5.4.4 - Mocking para tests
- **18 unit tests** - Cobertura de providers y ViewModels

### **Utils**

- **equatable** 2.0.7 - Comparación de objetos

---

## 🏗️ Arquitectura

Este proyecto sigue los principios de **Clean Architecture** con una separación clara de responsabilidades en capas independientes.

### **📐 Diagrama de Capas**

```
┌─────────────────────────────────────────┐
│         PRESENTATION LAYER              │
│  (UI, Pages, ViewModels, Providers)     │
│  ↓ Usa casos de uso                     │
└─────────────────────────────────────────┘
                  ↓
┌─────────────────────────────────────────┐
│           DOMAIN LAYER                  │
│  (Entities, Use Cases, Repositories)    │
│  ↓ Define contratos                     │
└─────────────────────────────────────────┘
                  ↓
┌─────────────────────────────────────────┐
│            DATA LAYER                   │
│  (Models, Data Sources, Repositories)   │
│  ↓ Implementa contratos                 │
└─────────────────────────────────────────┘
                  ↓
┌─────────────────────────────────────────┐
│          EXTERNAL LAYER                 │
│     (API, Local Storage, Services)      │
└─────────────────────────────────────────┘
```

### **📂 Estructura del Proyecto**

```
lib/
├── core/                    # Funcionalidades compartidas
│   ├── constants/          # Constantes globales
│   ├── di/                 # Dependency Injection (GetIt)
│   ├── error/              # Manejo de errores (Failures, Exceptions)
│   ├── extensions/         # Extensiones de Dart
│   ├── network/            # Cliente HTTP (Dio)
│   ├── routes/             # Configuración de rutas (GoRouter)
│   ├── theme/              # Sistema de temas
│   ├── utils/              # Utilidades (Logger, Type helpers)
│   └── widgets/            # Widgets reutilizables
│
├── domain/                  # Lógica de negocio
│   ├── entities/           # Entidades puras
│   ├── repositories/       # Interfaces de repositorios
│   └── usecases/           # Casos de uso
│
├── data/                    # Capa de datos
│   ├── models/             # Modelos con Freezed
│   ├── datasources/        # Fuentes de datos (Remote, Local)
│   └── repositories/       # Implementaciones de repositorios
│
├── presentation/            # Capa de presentación
│   ├── splash/             # Pantalla de splash
│   ├── onboarding/         # Onboarding
│   ├── home/               # Home con lista de Pokémon
│   ├── detail/             # Detalles del Pokémon
│   ├── favorites/          # Pokémon favoritos
│   ├── regions/            # Navegación por regiones
│   ├── profile/            # Perfil de usuario
│   ├── theme/              # Selector de tema
│   └── navigation/         # Bottom navigation bar
│
├── l10n/                    # Localizaciones (ES, EN)
└── main.dart               # Punto de entrada
```

Para más detalles sobre la arquitectura, consulta:

- 📖 [**ARCHITECTURE.md**](docs/ARCHITECTURE.md) - Documentación completa de la arquitectura
- 📖 [**AI_USAGE.md**](docs/AI_USAGE.md) - Uso de IA en el desarrollo
- 📖 [**SECURITY.md**](docs/SECURITY.md) - Medidas de seguridad implementadas
- 📖 [**TESTING.md**](test/README.md) - Guía de testing

---

## 🚀 Instalación

### **Prerequisitos**

- **FVM** (Flutter Version Management) - [Instalación](https://fvm.app/docs/getting_started/installation)
- **Flutter SDK** 3.35.5 (será instalado automáticamente con FVM)
- **Dart SDK** 3.0+ (incluido con Flutter)
- **Android Studio** / **VS Code** con extensiones de Flutter
- **Git**

### **Pasos de Instalación**

1. **Clonar el repositorio**

   ```bash
   git clone https://github.com/DanielAndresClavijo/pokeapp.git
   cd pokeapp
   ```

2. **Instalar FVM (si no lo tienes)**

   ```bash
   # macOS/Linux
   brew tap leoafarias/fvm
   brew install fvm

   # Windows (con Chocolatey)
   choco install fvm

   # O con Dart pub
   dart pub global activate fvm
   ```

3. **Usar la versión correcta de Flutter**

   ```bash
   # Instalar Flutter 3.35.5
   fvm install 3.35.5

   # Usar esta versión en el proyecto
   fvm use 3.35.5
   ```

4. **Instalar dependencias**

   ```bash
   fvm flutter pub get
   ```

5. **Generar código (Freezed, Riverpod, JSON)**

   ```bash
   fvm dart run build_runner build --delete-conflicting-outputs
   ```

6. **Verificar instalación**

   ```bash
   fvm flutter doctor
   ```

7. **Ejecutar la aplicación**

   ```bash
   # En modo debug
   fvm flutter run

   # En modo release
   fvm flutter run --release
   ```

> **Nota:** Si no usas FVM, reemplaza `fvm flutter` por `flutter` y `fvm dart` por `dart` en todos los comandos.

### **Configuración Adicional**

**Para Android:**

- Asegúrate de tener Android SDK 21+ configurado
- Configura las claves de firma en `android/app/build.gradle` (para producción)

**Para iOS:**

- Ejecuta `cd ios && pod install` si es necesario
- Configura el equipo de desarrollo en Xcode

### **¿Por qué FVM?**

**FVM (Flutter Version Management)** permite:

- ✅ Gestionar múltiples versiones de Flutter en tu sistema
- ✅ Asegurar que todo el equipo use la misma versión (3.35.5)
- ✅ Cambiar fácilmente entre versiones según el proyecto
- ✅ Evitar conflictos por diferencias de versión

**Configuración ya incluida:**

- `.fvm/fvm_config.json` - Define la versión 3.35.5
- `.vscode/settings.json` - VS Code usa automáticamente FVM
- `.gitignore` - Ignora el cache de FVM

**Comandos útiles:**

```bash
# Ver versión actual
fvm flutter --version

# Listar versiones instaladas
fvm list

# Cambiar versión global
fvm global 3.35.5

# Ver información de FVM
fvm --version
```

---

## 🧪 Testing

El proyecto cuenta con **18 tests unitarios** que cubren providers y ViewModels.

### **Ejecutar Tests**

```bash
# Todos los tests
fvm flutter test

# Tests específicos
fvm flutter test test/presentation/

# Con coverage
fvm flutter test --coverage

# Generar reporte HTML de coverage
genhtml coverage/lcov.info -o coverage/html

# Sin FVM
flutter test
```

### **Estructura de Tests**

```
test/
├── presentation/
│   ├── home/
│   │   └── providers/
│   │       └── pokemon_detail_provider_test.dart (3 tests)
│   └── detail/
│       ├── providers/
│       │   └── pokemon_species_provider_test.dart (6 tests)
│       └── viewmodels/
│           └── pokemon_detail_viewmodel_test.dart (9 tests)
└── README.md
```

**Cobertura:**

- ✅ Providers con Riverpod
- ✅ ViewModels con state management
- ✅ Casos de éxito y error
- ✅ Family providers
- ✅ Optimistic updates
- ✅ Cálculos complejos (gender rate)

Consulta [**test/README.md**](test/README.md) para más detalles.

---

## 🤖 IA en el Desarrollo

Este proyecto fue desarrollado con asistencia de **GitHub Copilot** y **ChatGPT/Claude**, siguiendo un conjunto de reglas y principios claros.

### **🎯 Principios de Uso de IA**

1. **Clean Architecture First** - La IA ayudó a mantener la separación de capas
2. **Code Review** - Todo código generado fue revisado y ajustado
3. **Best Practices** - Se siguieron las mejores prácticas de Flutter/Dart
4. **Documentation** - La IA ayudó a generar documentación detallada
5. **Testing** - Asistencia en la creación de tests unitarios

### **📋 Reglas Configuradas**

```markdown
# Rules para IA en el Proyecto

1. Siempre usar Clean Architecture (Domain → Data → Presentation)
2. Nunca acceder directamente a Use Cases desde Screens (usar ViewModels)
3. Todo modelo debe usar Freezed para inmutabilidad
4. Providers deben usar riverpod_annotation
5. Comentar "lógica oculta" (valores no obvios como el sistema de 8 partes)
6. Usar Either<Failure, Success> para manejo de errores
7. Inyección de dependencias con GetIt
8. Tests unitarios obligatorios para providers y ViewModels
9. Documentación en español, código en inglés
10. No markdown files para docs inline, solo comentarios en código
```

### **🔧 Casos de Uso de IA**

1. **Generación de Boilerplate**

   - Modelos Freezed con serialización JSON
   - Providers y ViewModels con Riverpod
   - Estructuras de casos de uso

2. **Refactoring**

   - Extracción de widgets reutilizables
   - Implementación de Clean Architecture
   - Corrección de violaciones arquitecturales

3. **Testing**

   - Generación de mocks con Mockito
   - Creación de casos de prueba
   - Setup y teardown de tests

4. **Documentación**
   - README y guías
   - Comentarios explicativos
   - Diagramas de arquitectura

Consulta [**docs/AI_USAGE.md**](docs/AI_USAGE.md) para más detalles.

---

## 🔒 Seguridad

### **1. Seguridad en la Red**

#### **HTTPS Enforced**

- ✅ Todas las conexiones a PokeAPI usan HTTPS
- ✅ Certificate pinning preparado para implementar

```dart
// lib/core/network/api_constants.dart
static const String baseUrl = 'https://pokeapi.co/api/v2';
```

#### **Timeout Configuration**

```dart
connectTimeout: 30 seconds
receiveTimeout: 30 seconds
sendTimeout: 30 seconds
```

### **2. Gestión de Estado Segura**

#### **Immutability con Freezed**

- ✅ Todos los modelos son inmutables
- ✅ No hay mutación directa de estado
- ✅ CopyWith para actualizaciones seguras

```dart
@freezed
class PokemonDetailState with _$PokemonDetailState {
  const factory PokemonDetailState({
    required Pokemon? pokemon,
    required bool isFavorite,
    required String? errorMessage,
  }) = _PokemonDetailState;
}
```

#### **Provider Scoping**

- ✅ AutoDispose para limpieza automática
- ✅ Family para aislamiento de estado

### **3. Validación de Datos**

#### **Input Validation en Use Cases**

```dart
// Validación de límites
if (limit <= 0 || limit > 100) {
  return Either.left(
    const ValidationFailure('Limit must be between 1 and 100'),
  );
}

// Validación de búsqueda
if (query.trim().isEmpty || query.length < 2) {
  return Either.left(
    const ValidationFailure('Query must have at least 2 characters'),
  );
}
```

#### **Sanitización de Respuestas API**

```dart
// Limpieza de texto de descripciones
description.replaceAll('\n', ' ').replaceAll('\f', ' ').trim()
```

### **4. Manejo de Errores Robusto**

#### **8 Tipos de Failures**

```dart
ServerFailure     // Errores del servidor (500+)
NetworkFailure    // Sin conexión a internet
CacheFailure      // Errores de almacenamiento local
NotFoundFailure   // Recurso no encontrado (404)
ValidationFailure // Datos inválidos
UnauthorizedFailure // Sin autorización (401)
TimeoutFailure    // Tiempo de espera agotado
UnknownFailure    // Error desconocido
```

#### **Try-Catch Granular**

```dart
try {
  final result = await dataSource.getPokemon(id);
  return Either.right(result.toEntity());
} on ServerException catch (e) {
  return Either.left(ServerFailure(e.message));
} on NetworkException catch (e) {
  return Either.left(NetworkFailure(e.message));
} catch (e) {
  return Either.left(UnknownFailure(e.toString()));
}
```

### **5. Almacenamiento Seguro**

#### **SharedPreferences con Cifrado Preparado**

```dart
// Favoritos almacenados localmente
// TODO: Implementar encrypted_shared_preferences para datos sensibles
final favorites = await _prefs.getStringList(_favoritesKey) ?? [];
```

#### **No Almacenamiento de Datos Sensibles**

- ❌ No se almacenan contraseñas
- ❌ No se almacenan tokens de autenticación
- ✅ Solo IDs de favoritos y preferencias de UI

### **6. Dependency Injection Segura**

#### **Lazy Loading con GetIt**

```dart
// Las dependencias se crean solo cuando se necesitan
getIt.registerLazySingleton<DioClient>(() => DioClient());

// Fácil de mockear en tests
if (getIt.isRegistered<UseCase>()) {
  getIt.unregister<UseCase>();
}
```

### **7. Logging Controlado**

#### **Logger con Niveles**

```dart
Logger.info('User loaded pokemon list');    // Production OK
Logger.debug('Response: $data');            // Solo en debug
Logger.error('Failed to load', error);      // Tracked
```

#### **Eliminación de Logs en Release**

```dart
// TODO: Configurar ProGuard/R8 para eliminar logs en release builds
```

### **8. Code Obfuscation (Preparado)**

```bash
# Para builds de producción
fvm flutter build apk --release --obfuscate --split-debug-info=build/debug-info
fvm flutter build appbundle --release --obfuscate --split-debug-info=build/debug-info

# Sin FVM
flutter build apk --release --obfuscate --split-debug-info=build/debug-info
```

### **9. Protección contra Ataques Comunes**

#### **XSS Prevention**

- ✅ No se ejecuta código HTML/JS dinámico
- ✅ Sanitización de texto de API

#### **SQL Injection Prevention**

- ✅ No hay SQL directo (se usa SharedPreferences)
- ✅ Futuro: Drift/Hive con queries seguras

#### **Rate Limiting**

- ✅ Debouncer para búsquedas (evita spam)
- ✅ Throttler preparado para acciones frecuentes

```dart
final debouncer = Debouncer(delay: Duration(milliseconds: 500));
debouncer.run(() => searchPokemon(query));
```

### **🚨 Recomendaciones Adicionales**

Para un entorno de producción real, considerar:

1. **Certificate Pinning** con `dio_security_options`
2. **Encrypted Storage** con `flutter_secure_storage`
3. **Code Signing** adecuado para iOS/Android
4. **Runtime Security Checks** con `flutter_jailbreak_detection`
5. **Analytics Seguro** con consentimiento GDPR
6. **Crash Reporting** con Firebase Crashlytics
7. **API Key Management** con Flutter dotenv

Consulta [**docs/SECURITY.md**](docs/SECURITY.md) para la guía completa de seguridad.

---

## 📚 Documentación Adicional

- 📖 [**Arquitectura Completa**](docs/ARCHITECTURE.md)
- 🤖 [**Uso de IA**](docs/AI_USAGE.md)
- 🔒 [**Seguridad**](docs/SECURITY.md)
- 🧪 [**Testing**](test/README.md)
- 🎨 [**Sistema de Temas**](docs/THEMING.md) _(próximamente)_
- 🌍 [**Internacionalización**](docs/I18N.md) _(próximamente)_

---

## 🤝 Contribuir

Las contribuciones son bienvenidas. Por favor:

1. Haz fork del proyecto
2. Crea una rama para tu feature (`git checkout -b feature/AmazingFeature`)
3. Commit tus cambios (`git commit -m 'Add some AmazingFeature'`)
4. Push a la rama (`git push origin feature/AmazingFeature`)
5. Abre un Pull Request

Asegúrate de:

- ✅ Seguir Clean Architecture
- ✅ Agregar tests para nuevas features
- ✅ Actualizar documentación
- ✅ Usar FVM con Flutter 3.35.5
- ✅ Ejecutar `fvm flutter analyze` sin errores

---

## 📄 Licencia

Este proyecto es de código abierto y está disponible bajo la licencia MIT.

---

## 👤 Autor

**Daniel Andrés Clavijo**

- GitHub: [@DanielAndresClavijo](https://github.com/DanielAndresClavijo)

---

## 🙏 Agradecimientos

- [PokeAPI](https://pokeapi.co/) - API REST de Pokémon
- [Flutter Community](https://flutter.dev/community) - Por las excelentes librerías
- [Clean Architecture](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html) - Por los principios arquitecturales

---

<p align="center">
  Hecho con ❤️ usando Flutter
</p>
