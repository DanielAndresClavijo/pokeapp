import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pokeapp/core/extensions/context_extension.dart';
import 'package:pokeapp/core/utils/pokemon_type_helper.dart';

/// Reusable Pokemon Type Badge Widget
/// Displays a colored badge with type icon and label
class PokemonTypeBadge extends StatelessWidget {
  final String type;

  const PokemonTypeBadge({
    super.key,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    final pokemonColors = context.pokemonColors;
    final translatedType = PokemonTypeHelper.translateType(type);
    final typeColor = PokemonTypeHelper.getTypeColor(type, pokemonColors);
    final typeIconAsset = PokemonTypeHelper.getTypeIconAsset(type);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
      decoration: BoxDecoration(
        color: typeColor,
        borderRadius: BorderRadius.circular(48.61),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        spacing: 6,
        children: [
          ClipOval(
            child: Material(
              color: context.colors.surfaceDefault,
              child: Padding(
                padding: const EdgeInsets.all(3),
                child: SvgPicture.asset(
                  typeIconAsset,
                  width: 14,
                  height: 14,
                  colorFilter: ColorFilter.mode(
                    typeColor,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
          ),
          Text(
            translatedType,
            style: context.fonts.labelSmall,
          ),
        ],
      ),
    );
  }
}
