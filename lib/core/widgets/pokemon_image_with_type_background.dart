import 'package:flutter/material.dart';
import 'package:pokeapp/core/widgets/pokemon_type_icon_background.dart';

/// Widget reutilizable para mostrar la imagen del Pokémon con el icono de tipo como fondo
class PokemonImageWithTypeBackground extends StatelessWidget {
  /// URL de la imagen del Pokémon
  final String imageUrl;
  
  /// Tipo primario del Pokémon para mostrar el icono de fondo
  final String? primaryType;
  
  /// Color de fondo del contenedor
  final Color backgroundColor;
  
  /// Ancho de la imagen del Pokémon
  final double imageSize;
  
  /// Ancho del icono de tipo en el fondo
  final double typeIconSize;
  
  /// Padding del contenedor
  final EdgeInsetsGeometry padding;
  
  /// Widget hijo opcional que se superpone a la imagen (ej: botón de favorito)
  final Widget? overlay;
  
  /// Si debe mostrar bordes redondeados
  final BorderRadius? borderRadius;

  const PokemonImageWithTypeBackground({
    super.key,
    required this.imageUrl,
    required this.backgroundColor,
    this.primaryType,
    this.imageSize = 85,
    this.typeIconSize = 90,
    this.padding = const EdgeInsets.fromLTRB(16, 0, 0, 4),
    this.overlay,
    this.borderRadius = const BorderRadius.only(
      topLeft: Radius.circular(16),
      bottomLeft: Radius.circular(16),
    ),
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: backgroundColor,
      borderRadius: borderRadius,
      child: Padding(
        padding: padding,
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Type icon with gradient background
            PokemonTypeIconBackground(
              type: primaryType,
              size: typeIconSize,
            ),
            
            // Pokemon image
            _buildPokemonImage(),
            
            // Overlay widget (ej: botón de favorito)
            if (overlay != null) overlay!,
          ],
        ),
      ),
    );
  }

  /// Construye la imagen del Pokémon con manejo de carga y errores
  Widget _buildPokemonImage() {
    return Image.network(
      imageUrl,
      width: imageSize,
      height: imageSize,
      fit: BoxFit.contain,
      errorBuilder: (context, error, stackTrace) {
        return Icon(
          Icons.catching_pokemon,
          size: imageSize * 0.6,
          color: Colors.white.withValues(alpha: 0.7),
        );
      },
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        
        return SizedBox(
          width: imageSize,
          height: imageSize,
          child: Center(
            child: CircularProgressIndicator(
              value: loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded /
                      loadingProgress.expectedTotalBytes!
                  : null,
              strokeWidth: 2,
              valueColor: AlwaysStoppedAnimation<Color>(
                Colors.white.withValues(alpha: 0.7),
              ),
            ),
          ),
        );
      },
    );
  }
}
