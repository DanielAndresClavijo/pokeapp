import 'package:flutter/material.dart';
import 'package:pokeapp/core/extensions/context_extension.dart';

/// Pokemon stat bar widget
class PokemonStatBar extends StatelessWidget {
  final String label;
  final int value;
  final int maxValue;
  final Color? color;

  const PokemonStatBar({
    super.key,
    required this.label,
    required this.value,
    this.maxValue = 255,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final percentage = (value / maxValue).clamp(0.0, 1.0);
    final barColor = color ?? _getStatColor(percentage);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          SizedBox(
            width: 90,
            child: Text(
              label,
              style: context.fonts.bodyMedium?.copyWith(
                color: context.colors.textSecondary,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(
            width: 40,
            child: Text(
              value.toString(),
              style: context.fonts.titleMedium?.copyWith(
                color: context.colors.textPrimary,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.right,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: LinearProgressIndicator(
                value: percentage,
                backgroundColor: context.colors.borderDefault,
                valueColor: AlwaysStoppedAnimation<Color>(barColor),
                minHeight: 8,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Color _getStatColor(double percentage) {
    if (percentage >= 0.8) {
      return const Color(0xFF7AC74C); // Verde
    } else if (percentage >= 0.6) {
      return const Color(0xFFF7D02C); // Amarillo
    } else if (percentage >= 0.4) {
      return const Color(0xFFEE8130); // Naranja
    } else {
      return const Color(0xFFC22E28); // Rojo
    }
  }
}
