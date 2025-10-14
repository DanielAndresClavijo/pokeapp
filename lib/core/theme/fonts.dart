import 'package:flutter/material.dart';

/// Custom font styles for the application.
///
/// ** This class defines a set of text styles using from figma specifications **
/// ** ./fonts-figma.json **
@immutable
class AppFonts extends TextTheme {
  static const String poppinsFont = 'Poppins';
  static const String montserratFont = 'Montserrat';

  const AppFonts._({
    required super.displayLarge,
    required super.displayMedium,
    required super.displaySmall,
    required super.headlineLarge,
    required super.headlineMedium,
    required super.headlineSmall,
    required super.titleLarge,
    required super.titleMedium,
    required super.titleSmall,
    required super.bodyLarge,
    required super.bodyMedium,
    required super.bodySmall,
    required super.labelLarge,
    required super.labelMedium,
    required super.labelSmall,
  });

  const AppFonts.light()
      : this._(
          displayLarge: const _DisplayLargeTextStyle(color: Color(0xFF121212)),
          displayMedium:
              const _DisplayMediumTextStyle(color: Color(0xFF121212)),
          displaySmall: const _DisplaySmallTextStyle(color: Color(0xFF121212)),
          headlineLarge:
              const _HeadlineLargeTextStyle(color: Color(0xFF333333)),
          headlineMedium:
              const _HeadlineMediumTextStyle(color: Color(0xFF121212)),
          headlineSmall:
              const _HeadlineSmallTextStyle(color: Color(0xFF424242)),
          titleLarge: const _TitleLargeTextStyle(color: Color(0xFF121212)),
          titleMedium: const _TitleMediumTextStyle(color: Color(0xFF424242)),
          titleSmall: const _TitleSmallTextStyle(color: Color(0xFF424242)),
          bodyLarge: const _BodyLargeTextStyle(color: Color(0xFF424242)),
          bodyMedium: const _BodyMediumTextStyle(color: Color(0xFF4D4D4D)),
          bodySmall: const _BodySmallTextStyle(color: Color(0xFF424242)),
          labelLarge: const _LabelLargeTextStyle(color: Color(0xFF9E9E9E)),
          labelMedium: const _LabelMediumTextStyle(color: Color(0xFF424242)),
          labelSmall: const _LabelSmallTextStyle(color: Color(0xFFFAFAFA)),
        );

  /// For dark colors: https://www.realtimecolors.com/
  const AppFonts.dark()
      : this._(
          displayLarge: const _DisplayLargeTextStyle(color: Color(0xFFededed)),
          displayMedium:
              const _DisplayMediumTextStyle(color: Color(0xFFededed)),
          displaySmall: const _DisplaySmallTextStyle(color: Color(0xFFededed)),
          headlineLarge:
              const _HeadlineLargeTextStyle(color: Color(0xFFcccccc)),
          headlineMedium:
              const _HeadlineMediumTextStyle(color: Color(0xFFededed)),
          headlineSmall:
              const _HeadlineSmallTextStyle(color: Color(0xFFbdbdbd)),
          titleLarge: const _TitleLargeTextStyle(color: Color(0xFFededed)),
          titleMedium: const _TitleMediumTextStyle(color: Color(0xFFbdbdbd)),
          titleSmall: const _TitleSmallTextStyle(color: Color(0xFFbdbdbd)),
          bodyLarge: const _BodyLargeTextStyle(color: Color(0xFFbdbdbd)),
          bodyMedium: const _BodyMediumTextStyle(color: Color(0xFFb3b3b3)),
          bodySmall: const _BodySmallTextStyle(color: Color(0xFFbdbdbd)),
          labelLarge: const _LabelLargeTextStyle(color: Color(0xFF616161)),
          labelMedium: const _LabelMediumTextStyle(color: Color(0xFFbdbdbd)),
          labelSmall: const _LabelSmallTextStyle(color: Color(0xFF050505)),
        );
}

@immutable
class _DisplayLargeTextStyle extends TextStyle {
  const _DisplayLargeTextStyle({required Color color})
      : super(
          fontFamily: AppFonts.poppinsFont,
          fontSize: 32,
          fontWeight: FontWeight.w500,
          fontStyle: FontStyle.normal,
          height: 1.0,
          letterSpacing: 0,
          color: color,
        );
}

@immutable
class _DisplayMediumTextStyle extends TextStyle {
  const _DisplayMediumTextStyle({required Color color})
      : super(
          fontFamily: AppFonts.poppinsFont,
          fontSize: 26,
          fontWeight: FontWeight.w500,
          fontStyle: FontStyle.normal,
          height: 1.0,
          letterSpacing: 0,
          color: color,
        );
}

@immutable
class _DisplaySmallTextStyle extends TextStyle {
  const _DisplaySmallTextStyle({required Color color})
      : super(
          fontFamily: AppFonts.poppinsFont,
          fontSize: 21,
          fontWeight: FontWeight.w600,
          fontStyle: FontStyle.normal,
          height: 1.0,
          letterSpacing: 0,
          color: color,
        );
}

@immutable
class _HeadlineLargeTextStyle extends TextStyle {
  const _HeadlineLargeTextStyle({required Color color})
      : super(
          fontFamily: AppFonts.poppinsFont,
          fontSize: 20,
          fontWeight: FontWeight.w600,
          fontStyle: FontStyle.normal,
          height: 1.0,
          letterSpacing: 0,
          color: color,
        );
}

@immutable
class _HeadlineMediumTextStyle extends TextStyle {
  const _HeadlineMediumTextStyle({required Color color})
      : super(
          fontFamily: AppFonts.poppinsFont,
          fontSize: 18,
          fontWeight: FontWeight.w500,
          fontStyle: FontStyle.normal,
          height: 1.0,
          letterSpacing: 0,
          color: color,
        );
}

@immutable
class _HeadlineSmallTextStyle extends TextStyle {
  const _HeadlineSmallTextStyle({required Color color})
      : super(
          fontFamily: AppFonts.poppinsFont,
          fontSize: 16,
          fontWeight: FontWeight.w500,
          fontStyle: FontStyle.normal,
          height: 1.0,
          letterSpacing: 0,
          color: color,
        );
}

@immutable
class _TitleLargeTextStyle extends TextStyle {
  const _TitleLargeTextStyle({required Color color})
      : super(
          fontFamily: AppFonts.montserratFont,
          fontSize: 16,
          fontWeight: FontWeight.w600,
          fontStyle: FontStyle.normal,
          height: 1.0,
          letterSpacing: 0,
          color: color,
        );
}

@immutable
class _TitleMediumTextStyle extends TextStyle {
  const _TitleMediumTextStyle({required Color color})
      : super(
          fontFamily: AppFonts.montserratFont,
          fontSize: 14,
          fontWeight: FontWeight.w500,
          fontStyle: FontStyle.normal,
          height: 1.5,
          letterSpacing: 0,
          color: color,
        );
}

@immutable
class _TitleSmallTextStyle extends TextStyle {
  const _TitleSmallTextStyle({required Color color})
      : super(
          fontFamily: AppFonts.montserratFont,
          fontSize: 14,
          fontWeight: FontWeight.w700,
          fontStyle: FontStyle.normal,
          height: 1.5,
          letterSpacing: 0,
          color: color,
        );
}

@immutable
class _BodyLargeTextStyle extends TextStyle {
  const _BodyLargeTextStyle({required Color color})
      : super(
          fontFamily: AppFonts.poppinsFont,
          fontSize: 14,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
          height: 1.5,
          letterSpacing: 0,
          color: color,
        );
}

@immutable
class _BodyMediumTextStyle extends TextStyle {
  const _BodyMediumTextStyle({required Color color})
      : super(
          fontFamily: AppFonts.poppinsFont,
          fontSize: 14,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
          height: 1.0,
          letterSpacing: 0,
          color: color,
        );
}

@immutable
class _BodySmallTextStyle extends TextStyle {
  const _BodySmallTextStyle({required Color color})
      : super(
          fontFamily: AppFonts.poppinsFont,
          fontSize: 12,
          fontWeight: FontWeight.w500,
          fontStyle: FontStyle.normal,
          height: 1.0,
          letterSpacing: 0.6, // 5% de 12px
          color: color,
        );
}

@immutable
class _LabelLargeTextStyle extends TextStyle {
  const _LabelLargeTextStyle({required Color color})
      : super(
          fontFamily: AppFonts.poppinsFont,
          fontSize: 14,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
          height: 1.0,
          letterSpacing: 0,
          color: color,
        );
}

@immutable
class _LabelMediumTextStyle extends TextStyle {
  const _LabelMediumTextStyle({required Color color})
      : super(
          fontFamily: AppFonts.poppinsFont,
          fontSize: 12,
          fontWeight: FontWeight.w600,
          fontStyle: FontStyle.normal,
          height: 1.0,
          letterSpacing: 0,
          color: color,
        );
}

@immutable
class _LabelSmallTextStyle extends TextStyle {
  const _LabelSmallTextStyle({required Color color})
      : super(
          fontFamily: AppFonts.poppinsFont,
          fontSize: 11,
          fontWeight: FontWeight.w500,
          fontStyle: FontStyle.normal,
          height: 1.0,
          letterSpacing: 0,
          color: color,
        );
}
