import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pokeapp/core/extensions/context_extension.dart';
import 'package:pokeapp/presentation/onboarding/models/onboarding_page_data.dart';
import 'package:pokeapp/presentation/onboarding/viewmodels/onboarding_viewmodel.dart';
import 'package:pokeapp/presentation/onboarding/widgets/onboarding_page_widget.dart';

/// Onboarding screen
class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int page) {
    setState(() {
      _currentPage = page;
    });
  }

  void _onSkip() {
    ref.read(onboardingViewModelProvider.notifier).completeOnboarding();
    context.go('/home');
  }

  void _onNext(int pagesLength) {
    if (_currentPage < pagesLength - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      _onSkip();
    }
  }

  @override
  Widget build(BuildContext context) {
    final pages = OnboardingContent.getPages(context);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // PageView
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: _onPageChanged,
                itemCount: pages.length,
                itemBuilder: (context, index) {
                  return OnboardingPageWidget(pageData: pages[index]);
                },
              ),
            ),
        
            // Bottom navigation
            Material(
              color: context.colors.surfaceDefault,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 24,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Page indicators
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        pages.length,
                        (index) => Container(
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          width: _currentPage == index ? 24 : 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: _currentPage == index
                                ? context.colors.azulNormal
                                : context.colors.azulNormal.withValues(alpha: 0.3),
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                
                    // Next/Finish button
                    ElevatedButton(
                      onPressed: () => _onNext(pages.length),
                      child: Center(
                        child: Text(
                          _currentPage == pages.length - 1
                              ? context.l10n.onboardingFinish
                              : context.l10n.onboardingNext,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
