import 'package:pokeapp/domain/entities/pokemon_list_item.dart';
import 'package:pokeapp/core/network/api_constants.dart';

/// Pokemon entity - Pure business logic model
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

  const Pokemon({
    required this.id,
    required this.name,
    required this.height,
    required this.weight,
    required this.baseExperience,
    required this.types,
    required this.abilities,
    required this.stats,
    required this.sprites,
  });

  /// Get the main sprite (front default)
  String get mainSprite => sprites.frontDefault;

  /// Get formatted height in meters
  String get heightInMeters => '${(height / 10).toStringAsFixed(1)} m';

  /// Get formatted weight in kg
  String get weightInKg => '${(weight / 10).toStringAsFixed(1)} kg';

  /// Get formatted ID with padding
  String get formattedId => '#${id.toString().padLeft(3, '0')}';

  /// Convert to PokemonListItem
  PokemonListItem toListItem() {
    return PokemonListItem(
      id: id,
      name: name,
      url: ApiConstants.getPokemonUrl(id),    );
  }
}

/// Pokemon stats
class PokemonStats {
  final int hp;
  final int attack;
  final int defense;
  final int specialAttack;
  final int specialDefense;
  final int speed;

  const PokemonStats({
    required this.hp,
    required this.attack,
    required this.defense,
    required this.specialAttack,
    required this.specialDefense,
    required this.speed,
  });

  /// Get total stats
  int get total =>
      hp + attack + defense + specialAttack + specialDefense + speed;

  /// Get average stats
  double get average => total / 6;
}

/// Pokemon sprites
class PokemonSprites {
  final String frontDefault;
  final String? frontShiny;
  final String? backDefault;
  final String? backShiny;
  final String? officialArtwork;

  const PokemonSprites({
    required this.frontDefault,
    this.frontShiny,
    this.backDefault,
    this.backShiny,
    this.officialArtwork,
  });

  /// Get the best quality sprite available
  String get bestQuality => officialArtwork ?? frontDefault;
}



enum PokemonListItemType {
  bug,
  dark,
  dragon,
  electric,
  fairy,
  fighting,
  fire,
  flying,
  ghost,
  grass,
  ground,
  ice,
  normal,
  poison,
  psychic,
  rock,
  steel,
  water,
  unknown,
}
