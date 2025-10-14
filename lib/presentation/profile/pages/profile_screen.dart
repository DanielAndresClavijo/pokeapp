import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pokeapp/core/extensions/context_extension.dart';
import 'package:pokeapp/presentation/profile/viewmodels/profile_viewmodel.dart';
import 'package:pokeapp/presentation/theme/viewmodels/theme_viewmodel.dart';

/// Profile screen
class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileState = ref.watch(profileViewModelProvider);
    final themeAsync = ref.watch(themeViewModelProvider);

    // Show success/error messages
    ref.listen<ProfileState>(profileViewModelProvider, (previous, next) {
      if (next.successMessage != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(context.l10n.dataCleared),
            backgroundColor: Colors.green,
          ),
        );
        ref.read(profileViewModelProvider.notifier).clearMessages();
        // Navigate to onboarding after clearing data
        Future.delayed(const Duration(seconds: 1), () {
          context.go('/onboarding');
        });
      }
      if (next.errorMessage != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${context.l10n.errorClearingData}: ${next.errorMessage}'),
            backgroundColor: context.colors.colorBronze500,
          ),
        );
        ref.read(profileViewModelProvider.notifier).clearMessages();
      }
    });

    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // Settings Section
            _SectionHeader(title: context.l10n.settings),
            const SizedBox(height: 8),
            
            // Theme Card
            Card(
              color: context.colors.surfaceDefault,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(color: context.colors.borderDefault),
              ),
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.palette_outlined, color: context.colors.azulNormal),
                    title: Text(
                      context.l10n.theme,
                      style: context.fonts.titleMedium?.copyWith(
                        color: context.colors.textPrimary,
                      ),
                    ),
                    subtitle: themeAsync.when(
                      data: (themeMode) => Text(
                        _getThemeModeLabel(context, themeMode),
                        style: context.fonts.bodyMedium?.copyWith(
                          color: context.colors.textSecondary,
                        ),
                      ),
                      loading: () => Text(
                        context.l10n.systemMode,
                        style: context.fonts.bodyMedium?.copyWith(
                          color: context.colors.textSecondary,
                        ),
                      ),
                      error: (_, __) => Text(
                        context.l10n.error,
                        style: context.fonts.bodyMedium?.copyWith(
                          color: context.colors.colorBronze500,
                        ),
                      ),
                    ),
                  ),
                  const Divider(height: 1),
                  themeAsync.when(
                    data: (currentMode) => Column(
                      children: [
                        _ThemeOption(
                          mode: ThemeMode.light,
                          currentMode: currentMode,
                          label: context.l10n.lightMode,
                          icon: Icons.light_mode,
                          onTap: () => ref.read(themeViewModelProvider.notifier)
                              .setThemeMode(ThemeMode.light),
                        ),
                        _ThemeOption(
                          mode: ThemeMode.dark,
                          currentMode: currentMode,
                          label: context.l10n.darkMode,
                          icon: Icons.dark_mode,
                          onTap: () => ref.read(themeViewModelProvider.notifier)
                              .setThemeMode(ThemeMode.dark),
                        ),
                        _ThemeOption(
                          mode: ThemeMode.system,
                          currentMode: currentMode,
                          label: context.l10n.systemMode,
                          icon: Icons.brightness_auto,
                          onTap: () => ref.read(themeViewModelProvider.notifier)
                              .setThemeMode(ThemeMode.system),
                        ),
                      ],
                    ),
                    loading: () => const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Center(child: CircularProgressIndicator()),
                    ),
                    error: (_, __) => const SizedBox.shrink(),
                  ),
                ],
              ),
            ),
        
            const SizedBox(height: 32),
        
            // Data Section
            _SectionHeader(title: context.l10n.data),
            const SizedBox(height: 8),
            
            // Clear Data Card
            Card(
              color: context.colors.surfaceDefault,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(color: context.colors.borderDefault),
              ),
              child: ListTile(
                leading: Icon(Icons.delete_outline, color: context.colors.colorBronze500),
                title: Text(
                  context.l10n.clearLocalData,
                  style: context.fonts.titleMedium?.copyWith(
                    color: context.colors.textPrimary,
                  ),
                ),
                subtitle: Text(
                  context.l10n.clearDataDescription,
                  style: context.fonts.bodySmall?.copyWith(
                    color: context.colors.textSecondary,
                  ),
                ),
                trailing: profileState.isLoading
                    ? const SizedBox(
                        width: 24,
                        height: 24,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : null,
                onTap: profileState.isLoading
                    ? null
                    : () => _showClearDataDialog(context, ref),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getThemeModeLabel(BuildContext context, ThemeMode mode) {
    switch (mode) {
      case ThemeMode.light:
        return context.l10n.lightMode;
      case ThemeMode.dark:
        return context.l10n.darkMode;
      case ThemeMode.system:
        return context.l10n.systemMode;
    }
  }

  void _showClearDataDialog(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(context.l10n.clearLocalData),
        content: Text(context.l10n.confirmClearData),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(context.l10n.cancel),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              ref.read(profileViewModelProvider.notifier).clearAllData();
            },
            style: TextButton.styleFrom(
              foregroundColor: context.colors.colorBronze500,
            ),
            child: Text(context.l10n.confirm),
          ),
        ],
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;

  const _SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 4, bottom: 8),
      child: Text(
        title.toUpperCase(),
        style: context.fonts.labelMedium?.copyWith(
          color: context.colors.textSecondary,
          fontWeight: FontWeight.w600,
          letterSpacing: 1.2,
        ),
      ),
    );
  }
}

class _ThemeOption extends StatelessWidget {
  final ThemeMode mode;
  final ThemeMode currentMode;
  final String label;
  final IconData icon;
  final VoidCallback onTap;

  const _ThemeOption({
    required this.mode,
    required this.currentMode,
    required this.label,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isSelected = mode == currentMode;

    return ListTile(
      leading: Icon(
        icon,
        color: isSelected ? context.colors.azulNormal : context.colors.textDisabled,
      ),
      title: Text(
        label,
        style: context.fonts.bodyLarge?.copyWith(
          color: isSelected ? context.colors.azulNormal : context.colors.textPrimary,
          fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
        ),
      ),
      trailing: isSelected
          ? Icon(Icons.check_circle, color: context.colors.azulNormal)
          : null,
      onTap: onTap,
    );
  }
}
