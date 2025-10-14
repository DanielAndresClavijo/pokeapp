import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pokeapp/core/extensions/context_extension.dart';
import 'package:pokeapp/presentation/onboarding/models/onboarding_page_data.dart';

/// Single onboarding page widget
class OnboardingPageWidget extends StatelessWidget {
  final OnboardingPageData pageData;

  const OnboardingPageWidget({
    super.key,
    required this.pageData,
  });

  @override
  Widget build(BuildContext context) {    
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Image placeholder
          Expanded(
            flex: 3,
            child: Container(
              alignment: Alignment.lerp(
                Alignment.topCenter,
                Alignment.bottomCenter,
                0.9,
              ),
              child: SvgPicture.asset(
                pageData.imageAsset,
                width: 240,
                height: 240,
              ),
            ),
          ),
          const SizedBox(height: 40),

          // Title
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Text(
                  pageData.title,
                  style: context.fonts.displaySmall?.copyWith(
                    color: context.colors.textPrimary,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),

                // Description
                Text(
                  pageData.description,
                  style: context.fonts.bodyLarge?.copyWith(
                    color: context.colors.textSecondary,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
