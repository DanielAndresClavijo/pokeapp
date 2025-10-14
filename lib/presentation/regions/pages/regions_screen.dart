import 'package:flutter/material.dart';
import 'package:pokeapp/core/extensions/context_extension.dart';

/// Regions screen placeholder
class RegionsScreen extends StatelessWidget {
  const RegionsScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white.withValues(alpha: 0.5),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                      blurStyle: BlurStyle.inner,
                    ),
                  ],
                ),
                child: Image.asset(
                  context.assets.magikarp,
                  width: 209,
                  height: 209,
                  errorBuilder: (context, error, stackTrace) => const SizedBox(
                    width: 209,
                    height: 209,
                    child: Center(
                      child: Icon(Icons.catching_pokemon_outlined, size: 209),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                context.l10n.comingSoon,
                style: context.fonts.headlineLarge,
              ),
              const SizedBox(height: 16),
              Text(
                context.l10n.regionsFeatureMessage,
                style: context.fonts.bodyLarge,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
