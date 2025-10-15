import 'package:flutter/material.dart';
import 'package:pokeapp/core/theme/colors.dart';
import 'package:pokeapp/core/theme/fonts.dart';
import 'package:pokeapp/core/theme/pokemon_colors.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme.g.dart';

@riverpod
class AppThemeNotifier extends _$AppThemeNotifier {
  @override
  AppTheme build() {
    // Initial theme mode, e.g., from shared preferences or system settings
    return AppTheme._(mode: ThemeMode.system);
  }

  void toggleTheme() {
    state.isDarkMode
        ? state = AppTheme._(mode: ThemeMode.light)
        : state = AppTheme._(mode: ThemeMode.dark);
  }

  void setThemeMode(AppTheme mode) {
    state = mode;
  }

  ThemeData get themeData => state.current;
}

class AppTheme {
  final ThemeData current;
  final ThemeMode mode;

  AppTheme._({required this.mode})
      : current = mode == ThemeMode.dark ? _dark : _light;

  bool get isDarkMode => mode == ThemeMode.dark;
  ThemeData get light => _light;
  ThemeData get dark => _dark;
}

ThemeData get _light => ThemeData(
      applyElevationOverlayColor: true,
      cupertinoOverrideTheme: null,
      extensions: const [ColorsApp.light(), PokemonTypeColors()],
      inputDecorationTheme: InputDecorationThemeData(
        border: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(30)),
          borderSide: BorderSide(
            color: const ColorsApp.light().borderDefault,
            width: 1.5,
            strokeAlign: BorderSide.strokeAlignInside,
          ),
          gapPadding: 0,
        ),
        activeIndicatorBorder: BorderSide(
          color: const ColorsApp.light().borderDefault,
          width: 1.5,
          strokeAlign: BorderSide.strokeAlignInside,
        ),
        outlineBorder: BorderSide(
          color: const ColorsApp.light().borderDefault,
          width: 1.5,
          strokeAlign: BorderSide.strokeAlignInside,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(30)),
          borderSide: BorderSide(
            color: const ColorsApp.light().azulNormal,
            width: 1.5,
            strokeAlign: BorderSide.strokeAlignInside,
          ),
          gapPadding: 0,
        ),
        iconColor: const ColorsApp.light().iconDisabled,
        prefixIconColor: const ColorsApp.light().iconDisabled,
        fillColor: const ColorsApp.light().surfaceDefault,
        focusColor: const ColorsApp.light().azulNormal,
        hintStyle: const AppFonts.light().bodyLarge,
      ),
      materialTapTargetSize: MaterialTapTargetSize.padded,
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {
          TargetPlatform.android: PredictiveBackPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        },
      ),
      platform: TargetPlatform.android,
      splashFactory: InkSplash.splashFactory,
      visualDensity: VisualDensity.standard,
      colorScheme: const ColorScheme.light(),
      canvasColor: const ColorsApp.light().surfaceDefault,
      cardColor: const Color(0xFFFFFFFF),
      disabledColor: const Color(0xFFE0E0E0),
      dividerColor: const Color(0xFF4565B7),
      focusColor: const Color(0xFF1E88E5),
      highlightColor: const Color(0xFFBBDEFB),
      hintColor: const Color(0xFF9E9E9E),
      hoverColor: const Color(0xFF1976D2),
      primaryColor: const Color(0xFF1E88E5),
      primaryColorDark: const Color(0xFF1a84e0),
      primaryColorLight: const Color(0xFF1E88E5),
      scaffoldBackgroundColor: const ColorsApp.light().surfaceDefault,
      secondaryHeaderColor: const Color(0xFFBBDEFB),
      shadowColor: const Color(0x0000001F),
      splashColor: const Color(0xFF1565C0),
      unselectedWidgetColor: const Color(0xFFD6D6D6),
      iconTheme: const IconThemeData(
        color: Color(0xFF424242),
        opacity: 1,
        size: 24,
      ),
      primaryIconTheme: const IconThemeData(
        color: Color(0xFFFFFFFF),
        opacity: 1,
        size: 24,
      ),
      primaryTextTheme: const AppFonts.light(),
      textTheme: const AppFonts.light(),
      appBarTheme: null,
      badgeTheme: null,
      bannerTheme: null,
      bottomAppBarTheme: null,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.transparent,
        selectedItemColor: const ColorsApp.light().tapBarIconActive,
        unselectedItemColor: const ColorsApp.light().tapBarIconDefault,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: const AppFonts.light().labelSmall?.copyWith(
          fontSize: 10,
          fontWeight: FontWeight.w700,
          color: const ColorsApp.light().tapBarTextActive,
        ),
        unselectedLabelStyle: const AppFonts.light().labelSmall?.copyWith(
          fontSize: 10,
          color: const ColorsApp.light().tapBarTextDefault,
        ),
        elevation: 0,
      ),
      bottomSheetTheme: null,
      buttonTheme: null,
      cardTheme: null,
      carouselViewTheme: null,
      checkboxTheme: null,
      chipTheme: ChipThemeData(
        labelStyle: const TextStyle(
          color: Color(0xFF212121),
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        secondaryLabelStyle: const TextStyle(
          color: Color(0xFFFFFFFF),
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        brightness: Brightness.light,
      ),
      dataTableTheme: null,
      datePickerTheme: null,
      dialogTheme: null,
      dividerTheme: null,
      drawerTheme: null,
      dropdownMenuTheme: null,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: const ColorsApp.light().buttonPrimaryDefaultBg,
          foregroundColor: const ColorsApp.light().buttonPrimaryDefaultText,
          textStyle: const AppFonts.light().headlineMedium?.copyWith(
            fontWeight: FontWeight.w600,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        ),
      ),
      expansionTileTheme: null,
      filledButtonTheme: null,
      floatingActionButtonTheme: null,
      iconButtonTheme: null,
      listTileTheme: null,
      menuBarTheme: null,
      menuButtonTheme: null,
      menuTheme: null,
      navigationBarTheme: null,
      navigationDrawerTheme: null,
      navigationRailTheme: null,
      outlinedButtonTheme: null,
      popupMenuTheme: null,
      progressIndicatorTheme: null,
      radioTheme: null,
      searchBarTheme: null,
      searchViewTheme: null,
      segmentedButtonTheme: null,
      sliderTheme: null,
      snackBarTheme: null,
      switchTheme: null,
      tabBarTheme: null,
      textButtonTheme: null,
      textSelectionTheme: null,
      timePickerTheme: null,
      toggleButtonsTheme: null,
      tooltipTheme: null,
    );

ThemeData get _dark => ThemeData(
      applyElevationOverlayColor: true,
      cupertinoOverrideTheme: null,
      extensions: const [ColorsApp.dark(), PokemonTypeColors()],
      inputDecorationTheme: InputDecorationThemeData(
        border: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(30)),
          borderSide: BorderSide(
            color: const ColorsApp.dark().borderDefault,
            width: 1.5,
            strokeAlign: BorderSide.strokeAlignInside,
          ),
          gapPadding: 0,
        ),
        activeIndicatorBorder: BorderSide(
          color: const ColorsApp.dark().borderDefault,
          width: 1.5,
          strokeAlign: BorderSide.strokeAlignInside,
        ),
        outlineBorder: BorderSide(
          color: const ColorsApp.dark().borderDefault,
          width: 1.5,
          strokeAlign: BorderSide.strokeAlignInside,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(30)),
          borderSide: BorderSide(
            color: const ColorsApp.dark().azulNormal,
            width: 1.5,
            strokeAlign: BorderSide.strokeAlignInside,
          ),
          gapPadding: 0,
        ),
        iconColor: const ColorsApp.dark().iconDisabled,
        prefixIconColor: const ColorsApp.dark().iconDisabled,
        fillColor: const ColorsApp.dark().surfaceDefault,
        focusColor: const ColorsApp.dark().azulNormal,
        hintStyle: const AppFonts.dark().bodyLarge,
      ),
      materialTapTargetSize: MaterialTapTargetSize.padded,
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {
          TargetPlatform.android: PredictiveBackPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        },
      ),
      platform: TargetPlatform.android,
      splashFactory: InkSplash.splashFactory,
      visualDensity: VisualDensity.standard,
      colorScheme: const ColorScheme.dark(),
      canvasColor: const Color(0xFF121212),
      cardColor: const Color(0xFF1E1E1E),
      disabledColor: const Color(0xFF424242),
      dividerColor: const Color(0xFF8EA6D9),
      focusColor: const Color(0xFF90CAF9),
      highlightColor: const Color(0xFF1565C0),
      hintColor: const Color(0xFF616161),
      hoverColor: const Color(0xFF1976D2),
      primaryColor: const Color(0xFF90CAF9),
      primaryColorDark: const Color(0xFF82B1FF),
      primaryColorLight: const Color(0xFF90CAF9),
      scaffoldBackgroundColor: const ColorsApp.dark().surfaceDefault,
      secondaryHeaderColor: const Color(0xFF1565C0),
      shadowColor: const Color(0x0000001F),
      splashColor: const Color(0xFF42A5F5),
      unselectedWidgetColor: const Color(0xFF616161),
      iconTheme: const IconThemeData(
        color: Color(0xFFBDBDBD),
        opacity: 1,
        size: 24,
      ),
      primaryIconTheme: const IconThemeData(
        color: Color(0xFFFAFAFA),
        opacity: 1,
        size: 24,
      ),
      primaryTextTheme: const AppFonts.dark(),
      textTheme: const AppFonts.dark(),
      appBarTheme: null,
      badgeTheme: null,
      bannerTheme: null,
      bottomAppBarTheme: null,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.transparent,
        selectedItemColor: const ColorsApp.dark().tapBarIconActive,
        unselectedItemColor: const ColorsApp.dark().tapBarIconDefault,
        selectedLabelStyle: const AppFonts.dark().labelSmall?.copyWith(
              fontSize: 10,
              color: const ColorsApp.dark().tapBarTextActive,
            ),
        unselectedLabelStyle: const AppFonts.dark().labelSmall?.copyWith(
              fontSize: 10,
              fontWeight: FontWeight.w500,
              color: const ColorsApp.dark().tapBarTextDefault,
            ),
        elevation: 0,
        
      ),
      bottomSheetTheme: null,
      buttonTheme: null,
      cardTheme: null,
      carouselViewTheme: null,
      checkboxTheme: null,
      chipTheme: null,
      dataTableTheme: null,
      datePickerTheme: null,
      dialogTheme: null,
      dividerTheme: null,
      drawerTheme: null,
      dropdownMenuTheme: null,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: const ColorsApp.dark().buttonPrimaryDefaultBg,
          foregroundColor: const ColorsApp.dark().textPrimary,
          textStyle: const AppFonts.dark().headlineMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        ),
      ),
      expansionTileTheme: null,
      filledButtonTheme: null,
      floatingActionButtonTheme: null,
      iconButtonTheme: null,
      listTileTheme: null,
      menuBarTheme: null,
      menuButtonTheme: null,
      menuTheme: null,
      navigationBarTheme: null,
      navigationDrawerTheme: null,
      navigationRailTheme: null,
      outlinedButtonTheme: null,
      popupMenuTheme: null,
      progressIndicatorTheme: null,
      radioTheme: null,
      searchBarTheme: null,
      searchViewTheme: null,
      segmentedButtonTheme: null,
      sliderTheme: null,
      snackBarTheme: null,
      switchTheme: null,
      tabBarTheme: null,
      textButtonTheme: null,
      textSelectionTheme: null,
      timePickerTheme: null,
      toggleButtonsTheme: null,
      tooltipTheme: null,
    );
