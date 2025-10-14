import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pokeapp/core/di/injection.dart';
import 'package:pokeapp/core/widgets/loading_indicator.dart';
import 'package:pokeapp/domain/usecases/get_onboarding_completed_usecase.dart';

class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({super.key});

  @override
  ConsumerState<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage> {

  @override
  void initState() {
    super.initState();
    _navigateToNextScreen();
  }

  Future<void> _navigateToNextScreen() async {
    await Future.delayed(const Duration(seconds: 2));
    
    if (!mounted) return;
    
    final getOnboardingCompleted = getIt<GetOnboardingCompletedUseCase>();
    final isOnboardingCompleted = await getOnboardingCompleted();
    
    if (!mounted) return;
    
    if (isOnboardingCompleted) {
      context.go('/home');
    } else {
      context.go('/onboarding');
    }
  }


  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: LoadingIndicator(size: 155)));
  }
}
