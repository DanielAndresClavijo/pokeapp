# Tests Unitarios - PokeApp

Este directorio contiene tests unitarios para probar los providers y ViewModels de la aplicación.

## 📁 Estructura de Tests

```
test/
├── presentation/
│   ├── home/
│   │   └── providers/
│   │       └── pokemon_detail_provider_test.dart
│   ├── detail/
│   │   ├── providers/
│   │   │   └── pokemon_species_provider_test.dart
│   │   └── viewmodels/
│   │       └── pokemon_detail_viewmodel_test.dart
```

## 🧪 Tests Creados

### 1. `pokemon_detail_provider_test.dart`

**Provider**: `pokemonDetailProvider`

**Tests incluidos**:

- ✅ Debe retornar Pokemon cuando el use case es exitoso
- ✅ Debe lanzar Exception cuando el use case falla
- ✅ Debe crear diferentes providers para diferentes IDs (family behavior)

**Cubre**: 3 tests

---

### 2. `pokemon_species_provider_test.dart`

**Provider**: `pokemonSpeciesProvider`

**Tests incluidos**:

- ✅ Debe retornar PokemonSpecies cuando el use case es exitoso
- ✅ Debe lanzar Exception cuando el use case falla
- ✅ Debe calcular correctamente los porcentajes de género
- ✅ Debe manejar Pokémon sin género correctamente
- ✅ Debe ser autoDispose y limpiar el estado cuando no hay listeners
- ✅ Debe crear diferentes providers para diferentes IDs (family behavior)

**Cubre**: 6 tests
**Funcionalidades especiales testeadas**:

- Sistema de 8 partes para gender rate
- Pokémon sin género (genderRate = -1)
- Comportamiento de autoDispose
- Family provider con diferentes IDs

---

### 3. `pokemon_detail_viewmodel_test.dart`

**ViewModel**: `PokemonDetailViewModel`

**Tests incluidos**:

- ✅ Debe cargar Pokemon correctamente cuando no está en favoritos
- ✅ Debe cargar Pokemon correctamente cuando está en favoritos
- ✅ Debe retornar estado de error cuando falla la carga
- ✅ Debe hacer toggle de favorito correctamente
- ✅ Debe manejar toggle de favorito desde favorito a no-favorito
- ✅ Toggle no debe hacer nada si el Pokemon no está cargado
- ✅ Debe refrescar los datos correctamente
- ✅ Refresh no debe hacer nada si el Pokemon no está cargado
- ✅ Debe crear diferentes ViewModels para diferentes Pokemon IDs

**Cubre**: 9 tests
**Funcionalidades testeadas**:

- Carga inicial de Pokemon
- Verificación de favoritos
- Toggle de favoritos (optimistic update)
- Refresh de datos
- Manejo de errores
- Family provider con diferentes IDs

---

## 🚀 Cómo Ejecutar los Tests

### Todos los tests

```bash
flutter test
```

### Tests de providers

```bash
flutter test test/presentation/
```

### Tests específicos

```bash
# Test del provider de detalles
flutter test test/presentation/home/providers/pokemon_detail_provider_test.dart

# Test del provider de species
flutter test test/presentation/detail/providers/pokemon_species_provider_test.dart

# Test del ViewModel de detalles
flutter test test/presentation/detail/viewmodels/pokemon_detail_viewmodel_test.dart
```

### Tests con coverage

```bash
flutter test --coverage
```

---

## 🛠️ Tecnologías Utilizadas

- **flutter_test**: Framework de testing de Flutter
- **mockito**: Para crear mocks de use cases
- **build_runner**: Para generar mocks automáticamente
- **riverpod**: Para testing de providers

---

## 📝 Notas sobre Mocking

Los mocks se generan automáticamente usando la anotación `@GenerateMocks`.

**Ejemplo**:

```dart
@GenerateMocks([GetPokemonDetailUseCase])
void main() {
  // Los mocks se generan en el archivo .mocks.dart
}
```

Para regenerar los mocks después de cambios:

```bash
dart run build_runner build --delete-conflicting-outputs
```

---

## 📊 Cobertura de Tests

**Total**: 18 tests

- ✅ 3 tests para `pokemonDetailProvider`
- ✅ 6 tests para `pokemonSpeciesProvider`
- ✅ 9 tests para `PokemonDetailViewModel`

**Casos cubiertos**:

- ✅ Casos exitosos (happy path)
- ✅ Casos de error (error handling)
- ✅ Validación de estados
- ✅ Comportamiento de family providers
- ✅ Comportamiento de autoDispose
- ✅ Toggle de favoritos con optimistic update
- ✅ Refresh de datos
- ✅ Cálculos de gender rate (sistema de 8 partes)

---

## 🔍 Patrón de Testing

Todos los tests siguen el patrón **AAA** (Arrange-Act-Assert):

```dart
test('descripción del test', () async {
  // Arrange: Configurar mocks y datos de prueba
  when(mockUseCase.call(id)).thenAnswer((_) async => result);

  // Act: Ejecutar la acción a testear
  final result = await container.read(provider);

  // Assert: Verificar el resultado
  expect(result.pokemon, expectedPokemon);
  verify(mockUseCase.call(id)).called(1);
});
```

---

## 🐛 Debugging Tests

Si un test falla, puedes ver información detallada:

```bash
flutter test --verbose
```

Para ejecutar un solo test:

```bash
flutter test test/path/to/test.dart --name "nombre del test"
```

---

## ✨ Mejores Prácticas Aplicadas

1. **Isolation**: Cada test es independiente
2. **Mocking**: Use cases son mockeados, no se hacen llamadas reales
3. **Setup/Teardown**: Se limpia el estado entre tests
4. **Descriptive Names**: Nombres de tests descriptivos y en español
5. **Coverage**: Se cubren casos exitosos y de error
6. **DRY**: Helper functions para reducir código duplicado

---

## 📚 Recursos

- [Flutter Testing Guide](https://docs.flutter.dev/testing)
- [Mockito Documentation](https://pub.dev/packages/mockito)
- [Riverpod Testing](https://riverpod.dev/docs/essentials/testing)
