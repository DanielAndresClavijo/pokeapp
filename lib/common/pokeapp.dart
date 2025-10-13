import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokeapp/common/theme/theme.dart';
import 'package:pokeapp/presentation/splash/splash_page.dart';

class PokeApp extends ConsumerWidget {
  const PokeApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeNotifierProvider);
    return MaterialApp(
      title: 'PokeApp',
      theme: theme.current,
      darkTheme: theme.dark,
      themeMode: theme.mode,

      home: const SplashPage(),
    );
  }
}
