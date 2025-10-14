import 'package:flutter/material.dart';
import 'package:pokeapp/core/constants/assets.dart';
import 'package:pokeapp/core/theme/colors.dart';
import 'package:pokeapp/core/theme/pokemon_colors.dart';
import 'package:pokeapp/l10n/app_localizations.dart';

extension ContextExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  ColorsApp get colors =>
      Theme.of(this).extension<ColorsApp>() ?? const ColorsApp.light();
  PokemonTypeColors get pokemonColors =>
      Theme.of(this).extension<PokemonTypeColors>() ??
      const PokemonTypeColors();
  TextTheme get fonts => Theme.of(this).textTheme;
  Assets get assets => const Assets();
  AppLocalizations get l10n => AppLocalizations.of(this)!;
}
