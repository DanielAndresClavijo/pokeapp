import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:pokeapp/core/routes/routes.dart';
import 'package:pokeapp/core/theme/theme.dart';
import 'package:pokeapp/l10n/app_localizations.dart';
import 'package:pokeapp/presentation/theme/viewmodels/theme_viewmodel.dart';

class PokeApp extends ConsumerWidget {
  const PokeApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appTheme = ref.watch(appThemeNotifierProvider);
    final themeMode = ref.watch(themeViewModelProvider).valueOrNull ?? ThemeMode.system;
    
    return MaterialApp.router(
      title: 'PokeApp',
      theme: appTheme.light,
      darkTheme: appTheme.dark,
      themeMode: themeMode,
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('es'),
        Locale('en'),
      ],
    );
  }
}
