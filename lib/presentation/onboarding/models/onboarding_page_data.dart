import 'package:flutter/material.dart';
import 'package:pokeapp/core/extensions/context_extension.dart';

/// Model for onboarding page data
class OnboardingPageData {
  final String title;
  final String description;
  final String imageAsset;
  final Color backgroundColor;

  const OnboardingPageData({
    required this.title,
    required this.description,
    required this.imageAsset,
    required this.backgroundColor,
  });
}

/// Onboarding pages content
class OnboardingContent {
  static List<OnboardingPageData> getPages(BuildContext context) {
    return [
      OnboardingPageData(
        title: context.l10n.onboardingTitle1,
        description: context.l10n.onboardingDescription1,
        imageAsset: context.assets.onboarding1,
        backgroundColor: const Color(0xFFE3F2FD),
      ),
      OnboardingPageData(
        title: context.l10n.onboardingTitle2,
        description: context.l10n.onboardingDescription2,
        imageAsset: context.assets.onboarding2,
        backgroundColor: const Color(0xFFFFF3E0),
      ),
    ];
  }
}
