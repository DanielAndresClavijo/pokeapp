import 'package:flutter/material.dart';
import 'package:pokeapp/core/extensions/context_extension.dart';

class BottomNavigationItem extends StatelessWidget {
  final bool isSelected;
  final Widget icon;
  final String label;
  final EdgeInsetsGeometry? padding;

  const BottomNavigationItem({
    super.key,
    required this.isSelected,
    required this.icon,
    required this.label,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.all(8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 4,
        children: [
          IconTheme(
            data: IconThemeData(
              color: isSelected
                  ? context.theme.bottomNavigationBarTheme.selectedItemColor
                  : context.theme.bottomNavigationBarTheme.unselectedItemColor,
            ),
            child: icon,
          ),
          Text(
            label,
            style: isSelected
                ? context.theme.bottomNavigationBarTheme.selectedLabelStyle
                : context.theme.bottomNavigationBarTheme.unselectedLabelStyle,
          ),
        ],
      ),
    );
  }
}