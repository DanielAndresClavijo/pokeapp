import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_es.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('es')
  ];

  /// Título de la aplicación
  ///
  /// In es, this message translates to:
  /// **'Pokédex'**
  String get appTitle;

  /// Etiqueta de la pestaña de inicio
  ///
  /// In es, this message translates to:
  /// **'Inicio'**
  String get home;

  /// Etiqueta de la pestaña de regiones
  ///
  /// In es, this message translates to:
  /// **'Regiones'**
  String get regions;

  /// Etiqueta de la pestaña de favoritos
  ///
  /// In es, this message translates to:
  /// **'Favoritos'**
  String get favorites;

  /// Etiqueta de la pestaña de perfil
  ///
  /// In es, this message translates to:
  /// **'Perfil'**
  String get profile;

  /// Placeholder del campo de búsqueda
  ///
  /// In es, this message translates to:
  /// **'Buscar Pokémon...'**
  String get searchPokemon;

  /// Mensaje cuando no hay resultados de búsqueda
  ///
  /// In es, this message translates to:
  /// **'No se encontraron Pokémon'**
  String get noPokemonFound;

  /// Botón para reintentar una acción
  ///
  /// In es, this message translates to:
  /// **'Reintentar'**
  String get retry;

  /// No description provided for @errorPage.
  ///
  /// In es, this message translates to:
  /// **'Algo salió mal...'**
  String get errorPage;

  /// Error al cargar la lista de favoritos
  ///
  /// In es, this message translates to:
  /// **'Error al cargar favoritos'**
  String get errorLoadingFavorites;

  /// Mensaje cuando no hay favoritos
  ///
  /// In es, this message translates to:
  /// **'No tienes Pokémon favoritos'**
  String get noFavorites;

  /// Mensaje descriptivo para agregar favoritos
  ///
  /// In es, this message translates to:
  /// **'Agrega tus Pokémon favoritos para verlos aquí'**
  String get addFavoritesMessage;

  /// Mensaje para funcionalidades futuras
  ///
  /// In es, this message translates to:
  /// **'¡Muy pronto disponible!'**
  String get comingSoon;

  /// Mensaje de funcionalidad de regiones próximamente
  ///
  /// In es, this message translates to:
  /// **'Estamos trabajando para traerte esta sección. Vuelve más adelante para descubrir todas las novedades.'**
  String get regionsFeatureMessage;

  /// Mensaje de funcionalidad de perfil próximamente
  ///
  /// In es, this message translates to:
  /// **'La funcionalidad de perfil estará disponible en una futura actualización.'**
  String get profileFeatureMessage;

  /// Título de la primera página de onboarding
  ///
  /// In es, this message translates to:
  /// **'Todos los Pokémon en un solo lugar'**
  String get onboardingTitle1;

  /// Descripción de la primera página de onboarding
  ///
  /// In es, this message translates to:
  /// **'Accede a una amplia lista de Pokémon de todas las generaciones creadas por Nintendo'**
  String get onboardingDescription1;

  /// Título de la segunda página de onboarding
  ///
  /// In es, this message translates to:
  /// **'Mantén tu Pokédex actualizada'**
  String get onboardingTitle2;

  /// Descripción de la segunda página de onboarding
  ///
  /// In es, this message translates to:
  /// **'Regístrate y guarda tu perfil, Pokémon favoritos, configuraciones y mucho más en la aplicación'**
  String get onboardingDescription2;

  /// Descripción del boton finalizar recorrido de onboarding
  ///
  /// In es, this message translates to:
  /// **'Empecemos'**
  String get onboardingFinish;

  /// Descripción del boton continual recorrido de onboarding
  ///
  /// In es, this message translates to:
  /// **'Continuar'**
  String get onboardingNext;

  /// Botón para saltar el onboarding
  ///
  /// In es, this message translates to:
  /// **'Saltar'**
  String get skip;

  /// Botón para ir a la siguiente página
  ///
  /// In es, this message translates to:
  /// **'Siguiente'**
  String get next;

  /// Botón para comenzar a usar la app
  ///
  /// In es, this message translates to:
  /// **'Comenzar'**
  String get start;

  /// Etiqueta genérica de acción
  ///
  /// In es, this message translates to:
  /// **'Acción'**
  String get action;

  /// Título de la sección de configuración
  ///
  /// In es, this message translates to:
  /// **'Configuración'**
  String get settings;

  /// Etiqueta para cambiar tema
  ///
  /// In es, this message translates to:
  /// **'Tema'**
  String get theme;

  /// Etiqueta para modo oscuro
  ///
  /// In es, this message translates to:
  /// **'Modo Oscuro'**
  String get darkMode;

  /// Etiqueta para modo claro
  ///
  /// In es, this message translates to:
  /// **'Modo Claro'**
  String get lightMode;

  /// Etiqueta para modo del sistema
  ///
  /// In es, this message translates to:
  /// **'Sistema'**
  String get systemMode;

  /// Título de la sección de datos
  ///
  /// In es, this message translates to:
  /// **'Datos'**
  String get data;

  /// Botón para limpiar datos locales
  ///
  /// In es, this message translates to:
  /// **'Limpiar datos locales'**
  String get clearLocalData;

  /// Descripción de limpiar datos
  ///
  /// In es, this message translates to:
  /// **'Eliminar favoritos, preferencias y restablecer el onboarding'**
  String get clearDataDescription;

  /// Mensaje de confirmación para limpiar datos
  ///
  /// In es, this message translates to:
  /// **'¿Estás seguro de que deseas eliminar todos los datos locales?'**
  String get confirmClearData;

  /// Botón cancelar
  ///
  /// In es, this message translates to:
  /// **'Cancelar'**
  String get cancel;

  /// Botón confirmar
  ///
  /// In es, this message translates to:
  /// **'Confirmar'**
  String get confirm;

  /// Mensaje de éxito al limpiar datos
  ///
  /// In es, this message translates to:
  /// **'Datos eliminados exitosamente'**
  String get dataCleared;

  /// Título de error
  ///
  /// In es, this message translates to:
  /// **'Error'**
  String get error;

  /// Mensaje de error al limpiar datos
  ///
  /// In es, this message translates to:
  /// **'Error al limpiar los datos'**
  String get errorClearingData;

  /// Etiqueta de peso
  ///
  /// In es, this message translates to:
  /// **'Peso'**
  String get weight;

  /// Etiqueta de altura
  ///
  /// In es, this message translates to:
  /// **'Altura'**
  String get height;

  /// Etiqueta de categoría
  ///
  /// In es, this message translates to:
  /// **'Categoría'**
  String get category;

  /// Etiqueta de habilidad
  ///
  /// In es, this message translates to:
  /// **'Habilidad'**
  String get ability;

  /// Etiqueta de género
  ///
  /// In es, this message translates to:
  /// **'Género'**
  String get gender;

  /// Título de la sección acerca de
  ///
  /// In es, this message translates to:
  /// **'Acerca de'**
  String get about;

  /// Pokémon sin género
  ///
  /// In es, this message translates to:
  /// **'Sin género'**
  String get genderless;

  /// Título de la sección de debilidades
  ///
  /// In es, this message translates to:
  /// **'Debilidades'**
  String get weaknesses;

  /// Título de la sección de estadísticas
  ///
  /// In es, this message translates to:
  /// **'Estadísticas'**
  String get stats;

  /// Puntos de salud
  ///
  /// In es, this message translates to:
  /// **'PS'**
  String get hp;

  /// Estadística de ataque
  ///
  /// In es, this message translates to:
  /// **'Ataque'**
  String get attack;

  /// Estadística de defensa
  ///
  /// In es, this message translates to:
  /// **'Defensa'**
  String get defense;

  /// Ataque especial
  ///
  /// In es, this message translates to:
  /// **'At. Esp.'**
  String get specialAttack;

  /// Defensa especial
  ///
  /// In es, this message translates to:
  /// **'Def. Esp.'**
  String get specialDefense;

  /// Estadística de velocidad
  ///
  /// In es, this message translates to:
  /// **'Velocidad'**
  String get speed;

  /// Género masculino
  ///
  /// In es, this message translates to:
  /// **'Macho'**
  String get male;

  /// Género femenino
  ///
  /// In es, this message translates to:
  /// **'Hembra'**
  String get female;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'es'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
