import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pokeapp/core/extensions/context_extension.dart';
import 'package:pokeapp/core/widgets/loading_indicator.dart';
import 'package:pokeapp/presentation/favorites/viewmodels/favorites_viewmodel.dart';
import 'package:pokeapp/presentation/home/widgets/pokemon_card.dart';

/// Favorites screen
class FavoritesScreen extends ConsumerWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoritesAsync = ref.watch(favoritesViewModelProvider);

    return Scaffold(
      backgroundColor: context.colors.surfaceDefault,
      appBar: AppBar(
        backgroundColor: context.colors.surfaceDefault,
        leading: IconButton(
          onPressed: () {
            if (context.canPop()) {
              context.pop();
              return;
            }
            context.go('/');
          },
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        centerTitle: true,
        title: Text(
          context.l10n.favorites,
          style: context.fonts.titleLarge,
        ),
      ),
      body: favoritesAsync.when(
        data: (favorites) {
          if (favorites.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.favorite_border,
                    size: 80,
                    color: context.colors.textDisabled,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    context.l10n.noFavorites,
                    style: context.fonts.titleLarge?.copyWith(
                      color: context.colors.textSecondary,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    context.l10n.addFavoritesMessage,
                    style: context.fonts.bodyMedium?.copyWith(
                      color: context.colors.textDisabled,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            );
          }

          return RefreshIndicator(
            color: context.colors.azulNormal,
            onRefresh: () async {
              await ref.read(favoritesViewModelProvider.notifier).refresh();
            },
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: favorites.length,
              itemBuilder: (context, index) {
                final pokemon = favorites[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: PokemonCard(
                    pokemon: pokemon,
                    isFavorite: true, // All items in favorites are favorites
                    onTap: () {
                      context.push('/pokemon/${pokemon.id}');
                    },
                    onFavoriteToggle: () async {
                      await ref
                          .read(favoritesViewModelProvider.notifier)
                          .toggleFavorite(pokemon.id);
                    },
                  ),
                );
              },
            ),
          );
        },
        loading: () => const Center(child: LoadingIndicator()),
        error: (error, stack) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.error_outline,
                size: 60,
                color: context.colors.colorBronze500,
              ),
              const SizedBox(height: 16),
              Text(
                context.l10n.errorLoadingFavorites,
                style: context.fonts.titleLarge?.copyWith(
                  color: context.colors.textPrimary,
                ),
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {
                  ref.read(favoritesViewModelProvider.notifier).refresh();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: context.colors.azulNormal,
                  foregroundColor: Colors.white,
                ),
                child: Text(context.l10n.retry),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
