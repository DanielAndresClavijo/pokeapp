import 'package:flutter/material.dart';
import 'package:pokeapp/core/extensions/context_extension.dart';

/// Custom error widget
class ErrorDisplayWidget extends StatelessWidget {
  final String message;
  final VoidCallback? onRetry;
  final IconData icon;

  const ErrorDisplayWidget({
    super.key,
    required this.message,
    this.onRetry,
    this.icon = Icons.error_outline,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              context.assets.error,
              width: 215,
              height: 215,
            ),
            const SizedBox(height: 24),
            Text(
              context.l10n.errorPage,
              style: context.fonts.headlineLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            Text(
              message,
              style: context.fonts.bodyLarge,
              textAlign: TextAlign.center,
            ),
            if (onRetry != null) ...[
              const SizedBox(height: 24),
              ElevatedButton.icon(
                onPressed: onRetry,
                label: Center(child: Text(context.l10n.retry)),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

