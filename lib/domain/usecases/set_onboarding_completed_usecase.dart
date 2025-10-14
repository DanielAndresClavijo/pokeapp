import 'package:pokeapp/data/repositories/preferences_repository_impl.dart';

/// Use case to mark onboarding as completed
class SetOnboardingCompletedUseCase {
  final PreferencesRepository _repository;

  SetOnboardingCompletedUseCase(this._repository);

  Future<void> call(bool completed) async {
    await _repository.setOnboardingCompleted(completed);
  }
}
