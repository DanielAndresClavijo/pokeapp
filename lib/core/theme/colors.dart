import 'package:flutter/material.dart';

@immutable
class ColorsApp extends ThemeExtension<ColorsApp> {
  // Background
  final Color surfaceDefault;

  // Blues
  final Color azulNormal;
  final Color azulSemiLight;

  // Reds
  final Color colorBronze500;

  // Texts
  final Color textPrimary;
  final Color textSecondary;
  final Color textInverse;
  final Color textDisabled;

  // Buttons
  final Color buttonPrimaryDefaultText;
  final Color buttonPrimaryDefaultBg;

  // Borders
  final Color borderDefault;

  // Icons
  final Color iconDisabled;

  // Neutral
  final Color colorNeutral25;

  // Escala de cinza
  final Color escalaDeCinza700;
  final Color escalaDeCinza800;

  // Tap Bar
  final Color tapBarIconDefault;
  final Color tapBarIconActive;
  final Color tapBarTextActive;
  final Color tapBarTextDefault;
  final Color tapBarBorderTop;

  // Line Chart Gender
  final Color lineGenderM;
  final Color lineGenderF;

  const ColorsApp._({
    // Background
    required this.surfaceDefault,

    // Blues
    required this.azulNormal,
    required this.azulSemiLight,

    // Reds
    required this.colorBronze500,

    // Texts
    required this.textPrimary,
    required this.textSecondary,
    required this.textInverse,
    required this.textDisabled,

    // Buttons
    required this.buttonPrimaryDefaultText,
    required this.buttonPrimaryDefaultBg,

    // Borders
    required this.borderDefault,

    // Icons
    required this.iconDisabled,

    // Neutral
    required this.colorNeutral25,

    // Escala de cinza
    required this.escalaDeCinza700,
    required this.escalaDeCinza800,

    // Tap Bar
    required this.tapBarIconDefault,
    required this.tapBarIconActive,
    required this.tapBarTextActive,
    required this.tapBarTextDefault,
    required this.tapBarBorderTop,

    // Line Chart
    required this.lineGenderM,
    required this.lineGenderF,
  });

  const ColorsApp.light()
      : this._(
          // Background
          surfaceDefault: const Color(0xFFFAFAFA),

          // Blues
          azulNormal: const Color(0xFF173EA5),
          azulSemiLight: const Color(0xFF4565B7),

          // Reds
          colorBronze500: const Color(0xFFE53935),

          // Texts
          textPrimary: const Color(0xFF121212),
          textSecondary: const Color(0xFF424242),
          textInverse: const Color(0xFFFAFAFA),
          textDisabled: const Color(0xFF9E9E9E),

          // Buttons
          buttonPrimaryDefaultText: const Color(0xFFFAFAFA),
          buttonPrimaryDefaultBg: const Color(0xFF1E88E5),

          // Borders
          borderDefault: const Color(0xFFE0E0E0),

          // Icons
          iconDisabled: const Color(0xFF9E9E9E),

          // Neutral
          colorNeutral25: const Color(0xFFFAFAFA),

          // Escala de cinza
          escalaDeCinza700: const Color(0xFF4D4D4D),
          escalaDeCinza800: const Color(0xFF333333),

          // Tap Bar
          tapBarIconDefault: const Color(0xFF424242),
          tapBarIconActive: const Color(0xFF1565C0),
          tapBarTextActive: const Color(0xFF0D47A1),
          tapBarTextDefault: const Color(0xFF424242),
          tapBarBorderTop: const Color(0xFFE0E0E0),

          // Line Chart
          lineGenderM: const Color(0xFF2551C3),
          lineGenderF: const Color(0xFFFF7596),
        );

  const ColorsApp.dark()
      : this._(
          // Background
          surfaceDefault: const Color(0xFF050505),

          // Blues
          azulNormal: const Color(0xFF597fe8),
          azulSemiLight: const Color(0xFF09599a),

          // Reds
          colorBronze500: const Color(0xFFcb1d1a),

          // Texts
          textPrimary: const Color(0xFFEDEDED),
          textSecondary: const Color(0xFFBDBDBD),
          textInverse: const Color(0xFF050505),
          textDisabled: const Color(0xFF616161),

          // Buttons
          buttonPrimaryDefaultText: const Color(0xFF050505),
          buttonPrimaryDefaultBg: const Color(0xFF06406f),

          // Borders
          borderDefault: const Color(0xFF1f1f1f),

          // Icons
          iconDisabled: const Color(0xFF616161),

          // Neutral
          colorNeutral25: const Color(0xFF050505),

          // Escala de cinza
          escalaDeCinza700: const Color(0xFFb3b3b3),
          escalaDeCinza800: const Color(0xFFcccccc),

          // Tap Bar
          tapBarIconDefault: const Color(0xFFbdbdbd),
          tapBarIconActive: const Color(0xFF3e8eea),
          tapBarTextActive: const Color(0xFF5f9af2),
          tapBarTextDefault: const Color(0xFFbdbdbd),
          tapBarBorderTop: const Color(0xFF1f1f1f),

          // Line Chart
          lineGenderM: const Color(0xFF3e6ada),
          lineGenderF: const Color(0xFF8a0020),
        );

  @override
  ColorsApp copyWith({
    // Background
    Color? surfaceDefault,

    // Blues
    Color? azulNormal,
    Color? azulSemiLight,

    // Reds
    Color? colorBronze500,

    // Texts
    Color? textPrimary,
    Color? textSecondary,
    Color? textInverse,
    Color? textDisabled,

    // Buttons
    Color? buttonPrimaryDefaultText,
    Color? buttonPrimaryDefaultBg,

    // Borders
    Color? borderDefault,

    // Icons
    Color? iconDisabled,

    // Neutral
    Color? colorNeutral25,

    // Escala de cinza
    Color? escalaDeCinza700,
    Color? escalaDeCinza800,

    // Tap Bar
    Color? tapBarIconDefault,
    Color? tapBarIconActive,
    Color? tapBarTextActive,
    Color? tapBarTextDefault,
    Color? tapBarBorderTop,

    // Line Chart
    Color? lineGenderM,
    Color? lineGenderF,
  }) {
    return ColorsApp._(
      // Background
      surfaceDefault: surfaceDefault ?? this.surfaceDefault,

      // Blues
      azulNormal: azulNormal ?? this.azulNormal,
      azulSemiLight: azulSemiLight ?? this.azulSemiLight,

      // Reds
      colorBronze500: colorBronze500 ?? this.colorBronze500,

      // Texts
      textPrimary: textPrimary ?? this.textPrimary,
      textSecondary: textSecondary ?? this.textSecondary,
      textInverse: textInverse ?? this.textInverse,
      textDisabled: textDisabled ?? this.textDisabled,

      // Buttons
      buttonPrimaryDefaultText:
          buttonPrimaryDefaultText ?? this.buttonPrimaryDefaultText,
      buttonPrimaryDefaultBg:
          buttonPrimaryDefaultBg ?? this.buttonPrimaryDefaultBg,

      // Borders
      borderDefault: borderDefault ?? this.borderDefault,

      // Icons
      iconDisabled: iconDisabled ?? this.iconDisabled,

      // Neutral
      colorNeutral25: colorNeutral25 ?? this.colorNeutral25,

      // Escala de cinza
      escalaDeCinza700: escalaDeCinza700 ?? this.escalaDeCinza700,
      escalaDeCinza800: escalaDeCinza800 ?? this.escalaDeCinza800,

      // Tap Bar
      tapBarIconDefault: tapBarIconDefault ?? this.tapBarIconDefault,
      tapBarIconActive: tapBarIconActive ?? this.tapBarIconActive,
      tapBarTextActive: tapBarTextActive ?? this.tapBarTextActive,
      tapBarTextDefault: tapBarTextDefault ?? this.tapBarTextDefault,
      tapBarBorderTop: tapBarBorderTop ?? this.tapBarBorderTop,
      // Line Chart
      lineGenderM: lineGenderM ?? this.lineGenderM,
      lineGenderF: lineGenderF ?? this.lineGenderF,
    );
  }

  @override
  ColorsApp lerp(ThemeExtension<ColorsApp>? other, double t) {
    if (other is! ColorsApp) {
      return this;
    }
    return ColorsApp._(
      // Background
      surfaceDefault: Color.lerp(surfaceDefault, other.surfaceDefault, t)!,

      // Blues
      azulNormal: Color.lerp(azulNormal, other.azulNormal, t)!,
      azulSemiLight: Color.lerp(azulSemiLight, other.azulSemiLight, t)!,

      // Reds
      colorBronze500: Color.lerp(colorBronze500, other.colorBronze500, t)!,

      // Texts
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t)!,
      textSecondary: Color.lerp(textSecondary, other.textSecondary, t)!,
      textInverse: Color.lerp(textInverse, other.textInverse, t)!,
      textDisabled: Color.lerp(textDisabled, other.textDisabled, t)!,

      // Buttons
      buttonPrimaryDefaultText: Color.lerp(
          buttonPrimaryDefaultText, other.buttonPrimaryDefaultText, t)!,
      buttonPrimaryDefaultBg:
          Color.lerp(buttonPrimaryDefaultBg, other.buttonPrimaryDefaultBg, t)!,

      // Borders
      borderDefault: Color.lerp(borderDefault, other.borderDefault, t)!,

      // Icons
      iconDisabled: Color.lerp(iconDisabled, other.iconDisabled, t)!,

      // Neutral
      colorNeutral25: Color.lerp(colorNeutral25, other.colorNeutral25, t)!,

      // Escala de cinza
      escalaDeCinza700:
          Color.lerp(escalaDeCinza700, other.escalaDeCinza700, t)!,
      escalaDeCinza800:
          Color.lerp(escalaDeCinza800, other.escalaDeCinza800, t)!,

      // Tap Bar
      tapBarIconDefault:
          Color.lerp(tapBarIconDefault, other.tapBarIconDefault, t)!,
      tapBarIconActive:
          Color.lerp(tapBarIconActive, other.tapBarIconActive, t)!,
      tapBarTextActive:
          Color.lerp(tapBarTextActive, other.tapBarTextActive, t)!,
      tapBarTextDefault:
          Color.lerp(tapBarTextDefault, other.tapBarTextDefault, t)!,
      tapBarBorderTop: Color.lerp(tapBarBorderTop, other.tapBarBorderTop, t)!,
      // Line Chart
      lineGenderM: Color.lerp(lineGenderM, other.lineGenderM, t)!,
      lineGenderF: Color.lerp(lineGenderF, other.lineGenderF, t)!,
    );
  }

  @override
  String toString() {
    return 'ColorsApp(lightSurfaceDefault: $surfaceDefault, azulNormal: $azulNormal, azulSemiLight: $azulSemiLight, colorBronze500: $colorBronze500, textPrimary: $textPrimary, textSecondary: $textSecondary, textInverse: $textInverse, textDisabled: $textDisabled, buttonPrimaryDefaultText: $buttonPrimaryDefaultText, buttonPrimaryDefaultBg: $buttonPrimaryDefaultBg, borderDefault: $borderDefault, iconDisabled: $iconDisabled, colorNeutral25: $colorNeutral25, escalaDeCinza700: $escalaDeCinza700, escalaDeCinza800: $escalaDeCinza800, tapBarIconDefault: $tapBarIconDefault, tapBarIconActive: $tapBarIconActive, tapBarTextActive: $tapBarTextActive, tapBarTextDefault: $tapBarTextDefault, tapBarBorderTop: $tapBarBorderTop, lineGenderM: $lineGenderM, lineGenderF: $lineGenderF)';
  }
}
