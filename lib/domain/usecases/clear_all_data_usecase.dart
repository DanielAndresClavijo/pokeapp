import 'package:pokeapp/data/repositories/preferences_repository_impl.dart';

/// Use case to clear all local data
class ClearAllDataUseCase {
  final PreferencesRepository _repository;

  ClearAllDataUseCase(this._repository);

  Future<void> call() async {
    await _repository.clearAllData();
  }
}
