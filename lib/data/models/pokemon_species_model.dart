import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokeapp/domain/entities/pokemon_species.dart';

part 'pokemon_species_model.freezed.dart';
part 'pokemon_species_model.g.dart';

/// Pokemon species model for API responses
@freezed
class PokemonSpeciesModel with _$PokemonSpeciesModel {
  const PokemonSpeciesModel._();

  const factory PokemonSpeciesModel({
    required int id,
    required String name,
    @JsonKey(name: 'gender_rate') required int genderRate,
    @JsonKey(name: 'flavor_text_entries')
    required List<FlavorTextEntry> flavorTextEntries,
    required SpeciesHabitat? habitat,
    @JsonKey(name: 'capture_rate') required int captureRate,
    @JsonKey(name: 'is_legendary') required bool isLegendary,
    @JsonKey(name: 'is_mythical') required bool isMythical,
  }) = _PokemonSpeciesModel;

  factory PokemonSpeciesModel.fromJson(Map<String, dynamic> json) =>
      _$PokemonSpeciesModelFromJson(json);

  /// Convert to entity
  PokemonSpecies toEntity() {
    // Obtener descripción en español, o inglés como fallback
    String description = _getDescription('es') ?? _getDescription('en') ?? '';

    return PokemonSpecies(
      id: id,
      name: name,
      genderRate: genderRate,
      description: description,
      habitat: habitat?.name ?? 'unknown',
      captureRate: captureRate,
      isLegendary: isLegendary,
      isMythical: isMythical,
    );
  }

  /// Obtiene la descripción en el idioma especificado
  /// 
  /// Prioriza versiones más recientes (Sword/Shield) sobre versiones antiguas
  /// para tener descripciones actualizadas
  String? _getDescription(String language) {
    try {
      // Buscar primero la versión más reciente (sword/shield)
      final entry = flavorTextEntries.firstWhere(
        (e) =>
            e.language.name == language &&
            (e.version.name == 'sword' || e.version.name == 'shield'),
        orElse: () => flavorTextEntries.firstWhere(
          (e) => e.language.name == language,
        ),
      );

      // Limpiar el texto de caracteres especiales del API:
      // \n = saltos de línea
      // \f = form feed (salto de página)
      // Espacios dobles a simples
      return entry.flavorText
          .replaceAll('\n', ' ')
          .replaceAll('\f', ' ')
          .replaceAll('  ', ' ')
          .trim();
    } catch (e) {
      return null;
    }
  }
}

/// Flavor text entry
@freezed
class FlavorTextEntry with _$FlavorTextEntry {
  const factory FlavorTextEntry({
    @JsonKey(name: 'flavor_text') required String flavorText,
    required NamedApiResource language,
    required NamedApiResource version,
  }) = _FlavorTextEntry;

  factory FlavorTextEntry.fromJson(Map<String, dynamic> json) =>
      _$FlavorTextEntryFromJson(json);
}

/// Species habitat
@freezed
class SpeciesHabitat with _$SpeciesHabitat {
  const factory SpeciesHabitat({
    required String name,
  }) = _SpeciesHabitat;

  factory SpeciesHabitat.fromJson(Map<String, dynamic> json) =>
      _$SpeciesHabitatFromJson(json);
}

/// Named API resource
@freezed
class NamedApiResource with _$NamedApiResource {
  const factory NamedApiResource({
    required String name,
    required String url,
  }) = _NamedApiResource;

  factory NamedApiResource.fromJson(Map<String, dynamic> json) =>
      _$NamedApiResourceFromJson(json);
}
