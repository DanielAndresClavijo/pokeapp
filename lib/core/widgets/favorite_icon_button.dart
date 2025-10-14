import 'package:flutter/material.dart';

/// Widget reutilizable para el botón de favorito
class FavoriteIconButton extends StatelessWidget {
  final bool isFavorite;
  final VoidCallback? onTap;
  final double size;
  final Color? favoriteColor;
  final Color? normalColor;
  final bool showBackground;
  final Color? backgroundColor;
  final EdgeInsetsGeometry padding;

  const FavoriteIconButton({
    super.key,
    required this.isFavorite,
    this.onTap,
    this.size = 16,
    this.favoriteColor,
    this.normalColor,
    this.showBackground = true,
    this.backgroundColor,
    this.padding = const EdgeInsets.all(8.0),
  });

  @override
  Widget build(BuildContext context) {
    final icon = Icon(
      isFavorite ? Icons.favorite : Icons.favorite_border,
      color: isFavorite 
          ? (favoriteColor ?? Colors.red)
          : (normalColor ?? Colors.white),
      size: size,
    );

    if (!showBackground) {
      return IconButton(
        onPressed: onTap,
        icon: icon,
        padding: padding,
        constraints: const BoxConstraints(),
        visualDensity: VisualDensity.compact,
      );
    }

    return Material(
      color: backgroundColor ?? const Color(0x75757599),
      shape: const CircleBorder(
        side: BorderSide(color: Colors.white, width: 2),
      ),
      child: InkWell(
        onTap: onTap,
        customBorder: const CircleBorder(),
        child: Padding(
          padding: padding,
          child: icon,
        ),
      ),
    );
  }
}
