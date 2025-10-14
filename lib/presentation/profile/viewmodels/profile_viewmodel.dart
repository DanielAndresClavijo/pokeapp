import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokeapp/core/di/injection.dart';
import 'package:pokeapp/domain/usecases/clear_all_data_usecase.dart';

/// Profile view model state
class ProfileState {
  final bool isLoading;
  final String? errorMessage;
  final String? successMessage;

  ProfileState({
    this.isLoading = false,
    this.errorMessage,
    this.successMessage,
  });

  ProfileState copyWith({
    bool? isLoading,
    String? errorMessage,
    String? successMessage,
  }) {
    return ProfileState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
      successMessage: successMessage,
    );
  }
}

/// Profile view model provider
final profileViewModelProvider =
    StateNotifierProvider<ProfileViewModel, ProfileState>((ref) {
  return ProfileViewModel();
});

/// Profile view model
class ProfileViewModel extends StateNotifier<ProfileState> {
  final ClearAllDataUseCase _clearAllDataUseCase = getIt<ClearAllDataUseCase>();

  ProfileViewModel() : super(ProfileState());

  Future<void> clearAllData() async {
    state = state.copyWith(isLoading: true, errorMessage: null, successMessage: null);
    try {
      await _clearAllDataUseCase();
      state = state.copyWith(
        isLoading: false,
        successMessage: 'success',
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: e.toString(),
      );
    }
  }

  void clearMessages() {
    state = state.copyWith(errorMessage: null, successMessage: null);
  }
}
