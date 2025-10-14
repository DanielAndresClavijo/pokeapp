
import 'package:flutter/material.dart';

@immutable
class PokemonTypeColors extends ThemeExtension<PokemonTypeColors> {
  final water = const Color(0xFF2196F3);
  final dragon = const Color(0xFF00ACC1);
  final electric = const Color(0xFFFDD835);
  final fairy = const Color(0xFFE91E63);
  final ghost = const Color(0xFF8E24AA);
  final fire = const Color(0xFFFF9800);
  final ice = const Color(0xFF3D8BFF);
  final grass = const Color(0xFF8BC34A);
  final bug = const Color(0xFF43A047);
  final fighting = const Color(0xFFE53935);
  final normal = const Color(0xFF546E7A);
  final dark = const Color(0xFF546E7A);
  final steel = const Color(0xFF546E7A);
  final rock = const Color(0xFF795548);
  final psychic = const Color(0xFF673AB7);
  final ground = const Color(0xFFFFB300);
  final poison = const Color(0xFF9C27B0);
  final flying = const Color(0xFF00BCD4);
  final unknown = const Color(0xFF9E9E9E);

  const PokemonTypeColors();

  
  @override
  ThemeExtension<PokemonTypeColors> copyWith() {
    return const PokemonTypeColors();
  }
  
  @override
  ThemeExtension<PokemonTypeColors> lerp(covariant ThemeExtension<PokemonTypeColors>? other, double t) {
    return this;
  }
}
