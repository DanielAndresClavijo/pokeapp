import 'package:flutter/material.dart';
import 'package:pokeapp/core/extensions/context_extension.dart';
import 'package:pokeapp/domain/entities/pokemon_species.dart';

/// Widget reutilizable para mostrar el ratio de género de un Pokémon
class PokemonGenderRatio extends StatelessWidget {
  final PokemonSpecies species;
  final TextStyle? textStyle;

  const PokemonGenderRatio({
    super.key,
    required this.species,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    // Si el Pokémon es sin género
    if (species.isGenderless) {
      return Text(
        'Sin género',
        style: textStyle ?? context.fonts.bodyMedium,
      );
    }

    final malePercent = species.malePercentage;
    final femalePercent = species.femalePercentage;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Barra de género visual usando flex proporcional
        // flex usa enteros, así que convertimos los porcentajes (0-100) a enteros
        // Ejemplo: 87.5% macho + 12.5% hembra = flex 87:12 (proporción visual correcta)
        Row(
          children: [
            if (malePercent > 0)
              Expanded(
                flex: malePercent.toInt(), // Convierte 87.5 a 87, etc.
                child: Container(
                  height: 8,
                  decoration: BoxDecoration(
                    color: const Color(0xFF6390F0), // Azul para macho
                    borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(4),
                      bottomLeft: const Radius.circular(4),
                      topRight:
                          femalePercent == 0 ? const Radius.circular(4) : Radius.zero,
                      bottomRight:
                          femalePercent == 0 ? const Radius.circular(4) : Radius.zero,
                    ),
                  ),
                ),
              ),
            if (femalePercent > 0)
              Expanded(
                flex: femalePercent.toInt(),
                child: Container(
                  height: 8,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF95587), // Rosa para hembra
                    borderRadius: BorderRadius.only(
                      topLeft:
                          malePercent == 0 ? const Radius.circular(4) : Radius.zero,
                      bottomLeft:
                          malePercent == 0 ? const Radius.circular(4) : Radius.zero,
                      topRight: const Radius.circular(4),
                      bottomRight: const Radius.circular(4),
                    ),
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(height: 8),
        
        // Porcentajes
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (malePercent > 0)
              Row(
                children: [
                  const Icon(
                    Icons.male,
                    color: Color(0xFF6390F0),
                    size: 16,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    '${malePercent.toStringAsFixed(1)}%',
                    style: textStyle ?? context.fonts.bodySmall,
                  ),
                ],
              ),
            if (femalePercent > 0)
              Row(
                children: [
                  const Icon(
                    Icons.female,
                    color: Color(0xFFF95587),
                    size: 16,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    '${femalePercent.toStringAsFixed(1)}%',
                    style: textStyle ?? context.fonts.bodySmall,
                  ),
                ],
              ),
          ],
        ),
      ],
    );
  }
}
