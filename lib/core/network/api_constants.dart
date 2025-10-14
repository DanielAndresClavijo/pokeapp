class ApiConstants {
  ApiConstants._();

  // Base URLs
  static const String baseUrl = 'https://pokeapi.co/api/v2';

  // Endpoints
  static const String pokemon = '/pokemon';
  static const String pokemonSpecies = '/pokemon-species';
  static const String type = '/type';
  static const String ability = '/ability';
  static const String evolution = '/evolution-chain';

  // Pagination
  static const int defaultLimit = 20;
  static const int defaultOffset = 0;

  // Timeouts
  static const Duration connectTimeout = Duration(seconds: 30);
  static const Duration receiveTimeout = Duration(seconds: 30);
  static const Duration sendTimeout = Duration(seconds: 30);

  // Cache
  static const Duration cacheMaxAge = Duration(hours: 1);

  // Headers
  static const Map<String, String> defaultHeaders = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  // Helper methods
  static String getPokemonUrl(int id) => '$baseUrl$pokemon/$id';
  static String getPokemonByNameUrl(String name) => '$baseUrl$pokemon/$name';
  static String getPokemonListUrl(
      {int limit = defaultLimit, int offset = defaultOffset}) {
    return '$baseUrl$pokemon?limit=$limit&offset=$offset';
  }

  static String getPokemonSpeciesUrl(int id) => '$baseUrl$pokemonSpecies/$id';
  static String getTypeUrl(int id) => '$baseUrl$type/$id';
  static String getAbilityUrl(int id) => '$baseUrl$ability/$id';
}
