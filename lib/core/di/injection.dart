import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pokeapp/core/network/dio_client.dart';
import 'package:pokeapp/data/datasources/local/preferences_local_datasource.dart';
import 'package:pokeapp/data/datasources/remote/pokemon_remote_datasource.dart';
import 'package:pokeapp/data/repositories/pokemon_repository_impl.dart';
import 'package:pokeapp/data/repositories/preferences_repository_impl.dart';
import 'package:pokeapp/domain/repositories/pokemon_repository.dart';
import 'package:pokeapp/domain/usecases/clear_all_data_usecase.dart';
import 'package:pokeapp/domain/usecases/get_favorites_usecase.dart';
import 'package:pokeapp/domain/usecases/get_onboarding_completed_usecase.dart';
import 'package:pokeapp/domain/usecases/get_pokemon_detail_usecase.dart';
import 'package:pokeapp/domain/usecases/get_pokemon_list_usecase.dart';
import 'package:pokeapp/domain/usecases/get_pokemon_species_usecase.dart';
import 'package:pokeapp/domain/usecases/get_theme_mode_usecase.dart';
import 'package:pokeapp/domain/usecases/search_pokemon_usecase.dart';
import 'package:pokeapp/domain/usecases/set_onboarding_completed_usecase.dart';
import 'package:pokeapp/domain/usecases/set_theme_mode_usecase.dart';
import 'package:pokeapp/domain/usecases/toggle_favorite_usecase.dart';

final getIt = GetIt.instance;

/// Initialize dependency injection
Future<void> initializeDependencies() async {
  // Core
  getIt.registerLazySingleton<DioClient>(() => DioClient());

  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton<SharedPreferences>(() => sharedPreferences);

  // Data sources
  getIt.registerLazySingleton<PokemonRemoteDataSource>(
    () => PokemonRemoteDataSourceImpl(getIt<DioClient>()),
  );
  getIt.registerLazySingleton<PreferencesLocalDataSource>(
    () => PreferencesLocalDataSourceImpl(getIt<SharedPreferences>()),
  );

  // Repositories
  getIt.registerLazySingleton<PokemonRepository>(
    () => PokemonRepositoryImpl(getIt<PokemonRemoteDataSource>()),
  );
  getIt.registerLazySingleton<PreferencesRepository>(
    () => PreferencesRepositoryImpl(getIt<PreferencesLocalDataSource>()),
  );

  // Use cases - Pokemon
  getIt.registerLazySingleton(
      () => GetPokemonListUseCase(getIt<PokemonRepository>()));
  getIt.registerLazySingleton(
      () => GetPokemonDetailUseCase(getIt<PokemonRepository>()));
  getIt.registerLazySingleton(
      () => GetPokemonSpeciesUseCase(getIt<PokemonRepository>()));
  getIt.registerLazySingleton(
      () => SearchPokemonUseCase(getIt<PokemonRepository>()));

  // Use cases - Preferences
  getIt.registerLazySingleton(
      () => GetThemeModeUseCase(getIt<PreferencesRepository>()));
  getIt.registerLazySingleton(
      () => SetThemeModeUseCase(getIt<PreferencesRepository>()));
  getIt.registerLazySingleton(
      () => GetOnboardingCompletedUseCase(getIt<PreferencesRepository>()));
  getIt.registerLazySingleton(
      () => SetOnboardingCompletedUseCase(getIt<PreferencesRepository>()));
  getIt.registerLazySingleton(
      () => ToggleFavoriteUseCase(getIt<PreferencesRepository>()));
  getIt.registerLazySingleton(
      () => GetFavoritesUseCase(getIt<PreferencesRepository>()));
  getIt.registerLazySingleton(
      () => ClearAllDataUseCase(getIt<PreferencesRepository>()));
}
