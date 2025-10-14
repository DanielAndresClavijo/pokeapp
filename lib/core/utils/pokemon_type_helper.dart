import 'package:flutter/material.dart';
import 'package:pokeapp/core/theme/pokemon_colors.dart';
import 'package:pokeapp/core/constants/assets.dart';

/// Helper class for Pokemon type utilities
class PokemonTypeHelper {
  static const _assets = Assets();
  /// Get color for a Pokemon type (English) from theme colors
  static Color getTypeColor(String type, PokemonTypeColors pokemonColors) {
    switch (type.toLowerCase()) {
      case 'grass':
        return pokemonColors.grass;
      case 'poison':
        return pokemonColors.poison;
      case 'fire':
        return pokemonColors.fire;
      case 'water':
        return pokemonColors.water;
      case 'electric':
        return pokemonColors.electric;
      case 'bug':
        return pokemonColors.bug;
      case 'normal':
        return pokemonColors.normal;
      case 'flying':
        return pokemonColors.flying;
      case 'psychic':
        return pokemonColors.psychic;
      case 'ground':
        return pokemonColors.ground;
      case 'rock':
        return pokemonColors.rock;
      case 'ice':
        return pokemonColors.ice;
      case 'dragon':
        return pokemonColors.dragon;
      case 'dark':
        return pokemonColors.dark;
      case 'steel':
        return pokemonColors.steel;
      case 'fairy':
        return pokemonColors.fairy;
      case 'fighting':
        return pokemonColors.fighting;
      case 'ghost':
        return pokemonColors.ghost;
      default:
        return pokemonColors.unknown;
    }
  }

  /// Translate type from English to Spanish
  static String translateType(String type) {
    switch (type.toLowerCase()) {
      case 'grass':
        return 'Planta';
      case 'poison':
        return 'Veneno';
      case 'fire':
        return 'Fuego';
      case 'water':
        return 'Agua';
      case 'electric':
        return 'Eléctrico';
      case 'bug':
        return 'Bicho';
      case 'normal':
        return 'Normal';
      case 'flying':
        return 'Volador';
      case 'psychic':
        return 'Psíquico';
      case 'ground':
        return 'Tierra';
      case 'rock':
        return 'Roca';
      case 'ice':
        return 'Hielo';
      case 'dragon':
        return 'Dragón';
      case 'dark':
        return 'Siniestro';
      case 'steel':
        return 'Acero';
      case 'fairy':
        return 'Hada';
      case 'fighting':
        return 'Lucha';
      case 'ghost':
        return 'Fantasma';
      default:
        return type;
    }
  }

  /// Get SVG asset path for a Pokemon type icon
  static String getTypeIconAsset(String type) {
    switch (type.toLowerCase()) {
      case 'grass':
      case 'planta':
        return _assets.grassPokemonType;
      case 'poison':
      case 'veneno':
        return _assets.poisonPokemonType;
      case 'fire':
      case 'fuego':
        return _assets.firePokemonType;
      case 'water':
      case 'agua':
        return _assets.waterPokemonType;
      case 'electric':
      case 'eléctrico':
        return _assets.electricPokemonType;
      case 'bug':
      case 'bicho':
        return _assets.bugPokemonType;
      case 'normal':
        return _assets.normalPokemonType;
      case 'flying':
      case 'volador':
        return _assets.flyingPokemonType;
      case 'psychic':
      case 'psíquico':
        return _assets.psychicPokemonType;
      case 'ground':
      case 'tierra':
        return _assets.groundPokemonType;
      case 'rock':
      case 'roca':
        return _assets.rockPokemonType;
      case 'ice':
      case 'hielo':
        return _assets.icePokemonType;
      case 'dragon':
      case 'dragón':
        return _assets.dragonPokemonType;
      case 'dark':
      case 'siniestro':
        return _assets.darkPokemonType;
      case 'steel':
      case 'acero':
        return _assets.steelPokemonType;
      case 'fairy':
      case 'hada':
        return _assets.fairyPokemonType;
      case 'fighting':
      case 'lucha':
        return _assets.fightingPokemonType;
      case 'ghost':
      case 'fantasma':
        return _assets.ghostPokemonType;
      default:
        return _assets.normalPokemonType;
    }
  }
}
