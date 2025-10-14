import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokeapp/presentation/navigation/widgets/custom_bottom_navigation_bar.dart';

/// Main navigation scaffold with bottom navigation bar
class MainNavigationScaffold extends StatelessWidget {
  final Widget child;
  final int currentIndex;

  const MainNavigationScaffold({
    super.key,
    required this.child,
    required this.currentIndex,
  });

  void _onItemTapped(BuildContext context, int index) {
    switch (index) {
      case 0:
        context.go('/home');
        break;
      case 1:
        context.go('/regions');
        break;
      case 2:
        context.go('/favorites');
        break;
      case 3:
        context.go('/profile');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) => _onItemTapped(context, index),
      ),
    );
  }
}
