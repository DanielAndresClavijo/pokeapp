import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pokeapp/core/utils/pokemon_type_helper.dart';

/// Widget reutilizable para mostrar el icono de tipo del Pokémon con efecto de gradiente
/// 
/// Este widget muestra el icono SVG del tipo de Pokémon con un efecto de gradiente
/// que va de blanco a transparente, creando un efecto decorativo de fondo.
class PokemonTypeIconBackground extends StatelessWidget {
  /// Tipo del Pokémon para mostrar su icono
  final String? type;
  
  /// Tamaño del icono
  final double size;
  
  /// Padding alrededor del icono
  final EdgeInsetsGeometry padding;
  
  /// Margen del contenedor fallback
  final EdgeInsetsGeometry margin;

  const PokemonTypeIconBackground({
    super.key,
    this.type,
    this.size = 90,
    this.padding = const EdgeInsets.fromLTRB(0, 4, 16, 0),
    this.margin = const EdgeInsets.fromLTRB(0, 4, 16, 0),
  });

  @override
  Widget build(BuildContext context) {
    // Si hay tipo, muestra el icono con gradiente
    if (type != null && type!.isNotEmpty) {
      return Padding(
        padding: padding,
        child: ShaderMask(
          shaderCallback: (Rect bounds) {
            return const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFFFFFFFF), // White
                Color(0x00FFFFFF), // Transparent
              ],
              stops: [0.0068, 1.0163],
            ).createShader(bounds);
          },
          blendMode: BlendMode.dstIn,
          child: SvgPicture.asset(
            PokemonTypeHelper.getTypeIconAsset(type!),
            width: size,
            height: size,
            colorFilter: ColorFilter.mode(
              Colors.white.withValues(alpha: 1),
              BlendMode.srcIn,
            ),
          ),
        ),
      );
    }

    // Fallback: círculo con gradiente si no hay tipo
    return Container(
      width: size,
      height: size,
      margin: margin,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFFFFFFFF),
            Color(0x00FFFFFF),
          ],
          stops: [0.0068, 1.0163],
        ),
      ),
    );
  }
}
