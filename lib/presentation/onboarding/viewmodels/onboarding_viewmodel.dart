import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:pokeapp/core/di/injection.dart';
import 'package:pokeapp/domain/usecases/set_onboarding_completed_usecase.dart';

part 'onboarding_viewmodel.g.dart';

@riverpod
class OnboardingViewModel extends _$OnboardingViewModel {
  late final SetOnboardingCompletedUseCase _setOnboardingCompletedUseCase;

  @override
  void build() {
    _setOnboardingCompletedUseCase = getIt<SetOnboardingCompletedUseCase>();
  }

  Future<void> completeOnboarding() async {
    await _setOnboardingCompletedUseCase(true);
  }
}
