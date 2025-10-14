import 'package:pokeapp/data/repositories/preferences_repository_impl.dart';

/// Use case to check if onboarding is completed
class GetOnboardingCompletedUseCase {
  final PreferencesRepository _repository;

  GetOnboardingCompletedUseCase(this._repository);

  Future<bool> call() async {
    return await _repository.getOnboardingCompleted();
  }
}
