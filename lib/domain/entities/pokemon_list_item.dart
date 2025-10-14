/// Pokemon list item entity - Simplified version for lists
class PokemonListItem {
  final int id;
  final String name;
  final String url;

  const PokemonListItem({
    required this.id,
    required this.name,
    required this.url,
  });

  /// Get formatted ID with padding
  String get formattedId => '#${id.toString().padLeft(3, '0')}';

  /// Get capitalized name
  String get capitalizedName {
    if (name.isEmpty) return name;
    return name[0].toUpperCase() + name.substring(1);
  }

  /// Extract ID from URL
  /// URL format: https://pokeapi.co/api/v2/pokemon/1/
  static int extractIdFromUrl(String url) {
    final parts = url.split('/');
    final idString = parts[parts.length - 2];
    return int.tryParse(idString) ?? 0;
  }
}
