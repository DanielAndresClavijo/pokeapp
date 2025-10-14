/// Pokemon species entity - información adicional del Pokémon
class PokemonSpecies {
  final int id;
  final String name;
  final int genderRate;
  final String description;
  final String habitat;
  final int captureRate;
  final bool isLegendary;
  final bool isMythical;

  const PokemonSpecies({
    required this.id,
    required this.name,
    required this.genderRate,
    required this.description,
    required this.habitat,
    required this.captureRate,
    required this.isLegendary,
    required this.isMythical,
  });

  /// Retorna true si el Pokémon es sin género
  bool get isGenderless => genderRate == -1;

  /// Retorna el porcentaje de machos (0-100)
  /// 
  /// Usa el sistema de 8 partes de PokeAPI donde:
  /// - genderRate indica cuántas de 8 partes son HEMBRAS
  /// - Por lo tanto, las partes MACHOS son: (8 - genderRate)
  /// Ejemplo: genderRate=1 → (8-1)/8 = 7/8 = 87.5% machos
  double get malePercentage {
    if (isGenderless) return 0;
    return ((8 - genderRate) / 8) * 100;
  }

  /// Retorna el porcentaje de hembras (0-100)
  /// 
  /// Usa el sistema de 8 partes de PokeAPI donde:
  /// - genderRate indica directamente cuántas de 8 partes son HEMBRAS
  /// Ejemplo: genderRate=1 → 1/8 = 12.5% hembras
  double get femalePercentage {
    if (isGenderless) return 0;
    return (genderRate / 8) * 100;
  }

  /// Retorna true si el Pokémon es 100% macho
  bool get isOnlyMale => genderRate == 0;

  /// Retorna true si el Pokémon es 100% hembra
  bool get isOnlyFemale => genderRate == 8;
}
