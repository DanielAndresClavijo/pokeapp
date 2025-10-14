// GoRouter configuration
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokeapp/presentation/splash/splash_page.dart';
import 'package:pokeapp/presentation/onboarding/pages/onboarding_screen.dart';
import 'package:pokeapp/presentation/home/pages/home_screen.dart';
import 'package:pokeapp/presentation/favorites/pages/favorites_screen.dart';
import 'package:pokeapp/presentation/regions/pages/regions_screen.dart';
import 'package:pokeapp/presentation/profile/pages/profile_screen.dart';
import 'package:pokeapp/presentation/navigation/main_navigation_scaffold.dart';
import 'package:pokeapp/presentation/detail/pages/pokemon_detail_screen.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _shellNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: 'splash',
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      path: '/onboarding',
      name: 'onboarding',
      builder: (context, state) => const OnboardingScreen(),
    ),
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) {
        final location = state.uri.path;
        int currentIndex = 0;
        
        if (location.startsWith('/home')) {
          currentIndex = 0;
        } else if (location.startsWith('/regions')) {
          currentIndex = 1;
        } else if (location.startsWith('/favorites')) {
          currentIndex = 2;
        } else if (location.startsWith('/profile')) {
          currentIndex = 3;
        }

        return MainNavigationScaffold(
          currentIndex: currentIndex,
          child: child,
        );
      },
      routes: [
        GoRoute(
          path: '/home',
          name: 'home',
          builder: (context, state) => const HomeScreen(),
        ),
        GoRoute(
          path: '/regions',
          name: 'regions',
          builder: (context, state) => const RegionsScreen(),
        ),
        GoRoute(
          path: '/favorites',
          name: 'favorites',
          builder: (context, state) => const FavoritesScreen(),
        ),
        GoRoute(
          path: '/profile',
          name: 'profile',
          builder: (context, state) => const ProfileScreen(),
        ),
      ],
    ),
    // Pokemon detail route
    GoRoute(
      path: '/pokemon/:id',
      name: 'pokemon-detail',
      builder: (context, state) {
        final id = state.pathParameters['id']!;
        return PokemonDetailScreen(pokemonId: id);
      },
    ),
  ],
);
