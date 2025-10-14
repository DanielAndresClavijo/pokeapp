/// Utilidad para calcular efectividad de tipos de Pokémon
/// Basado en la tabla oficial de efectividad de tipos
class PokemonTypeEffectiveness {
  /// Mapa de debilidades: qué tipos son super efectivos contra cada tipo
  static const Map<String, List<String>> _weaknesses = {
    'normal': ['fighting'],
    'fire': ['water', 'ground', 'rock'],
    'water': ['electric', 'grass'],
    'electric': ['ground'],
    'grass': ['fire', 'ice', 'poison', 'flying', 'bug'],
    'ice': ['fire', 'fighting', 'rock', 'steel'],
    'fighting': ['flying', 'psychic', 'fairy'],
    'poison': ['ground', 'psychic'],
    'ground': ['water', 'grass', 'ice'],
    'flying': ['electric', 'ice', 'rock'],
    'psychic': ['bug', 'ghost', 'dark'],
    'bug': ['fire', 'flying', 'rock'],
    'rock': ['water', 'grass', 'fighting', 'ground', 'steel'],
    'ghost': ['ghost', 'dark'],
    'dragon': ['ice', 'dragon', 'fairy'],
    'dark': ['fighting', 'bug', 'fairy'],
    'steel': ['fire', 'fighting', 'ground'],
    'fairy': ['poison', 'steel'],
  };

  /// Mapa de resistencias: qué tipos son no muy efectivos contra cada tipo
  static const Map<String, List<String>> _resistances = {
    'normal': [],
    'fire': ['fire', 'grass', 'ice', 'bug', 'steel', 'fairy'],
    'water': ['fire', 'water', 'ice', 'steel'],
    'electric': ['electric', 'flying', 'steel'],
    'grass': ['water', 'electric', 'grass', 'ground'],
    'ice': ['ice'],
    'fighting': ['bug', 'rock', 'dark'],
    'poison': ['grass', 'fighting', 'poison', 'bug', 'fairy'],
    'ground': ['poison', 'rock'],
    'flying': ['grass', 'fighting', 'bug'],
    'psychic': ['fighting', 'psychic'],
    'bug': ['grass', 'fighting', 'ground'],
    'rock': ['normal', 'fire', 'poison', 'flying'],
    'ghost': ['poison', 'bug'],
    'dragon': ['fire', 'water', 'electric', 'grass'],
    'dark': ['ghost', 'dark'],
    'steel': [
      'normal',
      'grass',
      'ice',
      'flying',
      'psychic',
      'bug',
      'rock',
      'dragon',
      'steel',
      'fairy'
    ],
    'fairy': ['fighting', 'bug', 'dark'],
  };

  /// Mapa de inmunidades: qué tipos no afectan a cada tipo
  static const Map<String, List<String>> _immunities = {
    'normal': ['ghost'],
    'fire': [],
    'water': [],
    'electric': [],
    'grass': [],
    'ice': [],
    'fighting': [],
    'poison': [],
    'ground': ['electric'],
    'flying': ['ground'],
    'psychic': [],
    'bug': [],
    'rock': [],
    'ghost': ['normal', 'fighting'],
    'dragon': [],
    'dark': ['psychic'],
    'steel': ['poison'],
    'fairy': ['dragon'],
  };

  /// Calcula las debilidades del Pokémon basándose en sus tipos
  /// Considera tipos dobles y calcula multiplicadores
  static List<String> getWeaknesses(List<String> pokemonTypes) {
    if (pokemonTypes.isEmpty) return [];

    final Map<String, double> typeMultipliers = {};

    // Inicializar todos los tipos con multiplicador 1.0
    for (final attackType in _weaknesses.keys) {
      typeMultipliers[attackType] = 1.0;
    }

    // Calcular multiplicadores para cada tipo del Pokémon
    // Los tipos dobles multiplican los efectos (ej: Fire/Flying vs Rock = 2.0 * 2.0 = 4.0×)
    for (final defenseType in pokemonTypes) {
      final normalizedType = defenseType.toLowerCase();

      // Aplicar debilidades (x2.0 = super efectivo)
      // Multiplica el valor actual, permitiendo 4× en tipos dobles
      for (final weakness in _weaknesses[normalizedType] ?? []) {
        typeMultipliers[weakness] = (typeMultipliers[weakness] ?? 1.0) * 2.0;
      }

      // Aplicar resistencias (x0.5 = no muy efectivo)
      // Multiplica el valor actual, permitiendo 0.25× en tipos dobles
      for (final resistance in _resistances[normalizedType] ?? []) {
        typeMultipliers[resistance] =
            (typeMultipliers[resistance] ?? 1.0) * 0.5;
      }

      // Aplicar inmunidades (x0 = sin efecto)
      // Una inmunidad hace que el daño sea 0 sin importar otros tipos
      for (final immunity in _immunities[normalizedType] ?? []) {
        typeMultipliers[immunity] = 0.0;
      }
    }

    // Retornar solo los tipos con multiplicador >= 2.0 (debilidades)
    // Incluye tanto 2× (normal) como 4× (tipo doble)
    final weaknesses = typeMultipliers.entries
        .where((entry) => entry.value >= 2.0)
        .map((entry) => entry.key)
        .toList();

    return weaknesses;
  }

  /// Calcula las resistencias del Pokémon
  static List<String> getResistances(List<String> pokemonTypes) {
    if (pokemonTypes.isEmpty) return [];

    final Map<String, double> typeMultipliers = {};

    // Inicializar todos los tipos con multiplicador 1.0
    for (final attackType in _weaknesses.keys) {
      typeMultipliers[attackType] = 1.0;
    }

    // Calcular multiplicadores
    for (final defenseType in pokemonTypes) {
      final normalizedType = defenseType.toLowerCase();

      for (final weakness in _weaknesses[normalizedType] ?? []) {
        typeMultipliers[weakness] = (typeMultipliers[weakness] ?? 1.0) * 2.0;
      }

      for (final resistance in _resistances[normalizedType] ?? []) {
        typeMultipliers[resistance] =
            (typeMultipliers[resistance] ?? 1.0) * 0.5;
      }

      for (final immunity in _immunities[normalizedType] ?? []) {
        typeMultipliers[immunity] = 0.0;
      }
    }

    // Retornar tipos con multiplicador <= 0.5 (resistencias)
    // entry.value > 0: excluye inmunidades (0.0)
    // entry.value <= 0.5: incluye resistencias normales (0.5×) y dobles (0.25×)
    final resistances = typeMultipliers.entries
        .where((entry) => entry.value > 0 && entry.value <= 0.5)
        .map((entry) => entry.key)
        .toList();

    return resistances;
  }

  /// Calcula las inmunidades del Pokémon
  static List<String> getImmunities(List<String> pokemonTypes) {
    if (pokemonTypes.isEmpty) return [];

    final Set<String> immunities = {};

    for (final defenseType in pokemonTypes) {
      final normalizedType = defenseType.toLowerCase();
      immunities.addAll(_immunities[normalizedType] ?? []);
    }

    return immunities.toList();
  }

  /// Calcula el multiplicador de daño de un tipo atacante contra un Pokémon
  /// 
  /// Retorna:
  /// - 4.0 = 4× efectivo (tipo doble débil, ej: Rock vs Charizard Fire/Flying)
  /// - 2.0 = 2× efectivo (super efectivo)
  /// - 1.0 = daño normal
  /// - 0.5 = ½× efectivo (resistente)
  /// - 0.25 = ¼× efectivo (tipo doble resistente)
  /// - 0.0 = inmune (sin efecto)
  static double getDamageMultiplier(
      String attackType, List<String> defenseTypes) {
    if (defenseTypes.isEmpty) return 1.0;

    double multiplier = 1.0;

    for (final defenseType in defenseTypes) {
      final normalized = defenseType.toLowerCase();
      final attackNormalized = attackType.toLowerCase();

      // Cada tipo del Pokémon multiplica el valor
      if ((_weaknesses[normalized] ?? []).contains(attackNormalized)) {
        multiplier *= 2.0; // Super efectivo
      }

      if ((_resistances[normalized] ?? []).contains(attackNormalized)) {
        multiplier *= 0.5; // Resistente
      }

      if ((_immunities[normalized] ?? []).contains(attackNormalized)) {
        multiplier = 0.0; // Inmune (sin efecto)
        break; // No necesita seguir calculando
      }
    }

    return multiplier;
  }
}
