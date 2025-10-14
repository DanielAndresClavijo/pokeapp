import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:pokeapp/core/extensions/context_extension.dart';
import 'package:pokeapp/core/widgets/error_widget.dart';
import 'package:pokeapp/core/widgets/loading_indicator.dart';
import 'package:pokeapp/presentation/favorites/viewmodels/favorites_viewmodel.dart';
import 'package:pokeapp/presentation/home/models/pokemon_list_state.dart';
import 'package:pokeapp/presentation/home/viewmodels/pokemon_list_viewmodel.dart';
import 'package:pokeapp/presentation/home/widgets/pokemon_card.dart';

/// Home screen with Pokemon list
class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _searchController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent * 0.9) {
      ref.read(pokemonListViewModelProvider.notifier).loadPokemons();
    }
  }

  void _onSearch() {
    final query = _searchController.text;
    ref.read(pokemonListViewModelProvider.notifier).searchPokemons(query);
  }

  void _onClearSearch() {
    _searchController.clear();
    ref.read(pokemonListViewModelProvider.notifier).refresh();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final state = ref.watch(pokemonListViewModelProvider);

    return SafeArea(
      child: Scaffold(
        backgroundColor: colors.surfaceDefault,
        body: Column(
          children: [
            // Search bar
            if (state.errorMessage?.isEmpty ?? true)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _searchController,
                        style: context.fonts.bodyLarge,
                        decoration: InputDecoration(
                          hintText: context.l10n.searchPokemon,
                          prefixIcon: Container(
                            padding: const EdgeInsets.only(left: 14.5),
                            child: const Icon(Icons.search),
                          ),
                          prefixIconConstraints: const BoxConstraints(
                            minWidth: 48,
                            minHeight: 24,
                          ),
                          contentPadding:
                              const EdgeInsets.fromLTRB(0, 14, 0, 14),
                          suffixIcon: _searchController.text.isNotEmpty
                              ? IconButton(
                                  icon: Icon(
                                    Icons.clear,
                                    color: colors.iconDisabled,
                                  ),
                                  onPressed: _onClearSearch,
                                )
                              : null,
                          filled: true,
                        ),
                        onChanged: (value) {
                          setState(() {});
                        },
                        onSubmitted: (_) => _onSearch(),
                      ),
                    ),
                    const SizedBox(width: 8),
                    IconButton.outlined(
                      onPressed: _onSearch,
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14.5,
                          vertical: 12.5,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(30),
                        ),
                        side: BorderSide(
                          color: colors.borderDefault,
                          width: 1.5,
                        ),
                        iconColor: colors.iconDisabled,
                      ),
                      icon: const Icon(Icons.search),
                    ),
                  ],
                ),
              ),

            // Pokemon list
            Expanded(
              child: _buildPokemonList(state),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPokemonList(PokemonListState state) {
    final colors = context.colors;

    if (state.pokemons.isEmpty && state.isLoading) {
      return const Center(child: LoadingIndicator());
    }

    if (state.errorMessage?.isNotEmpty ?? false) {
      return Center(
        child: ErrorDisplayWidget(
          message: state.errorMessage?.isNotEmpty ?? false
              ? state.errorMessage!
              : context.l10n.noPokemonFound,
          onRetry: () {
            ref.read(pokemonListViewModelProvider.notifier).refresh();
          },
        ),
      );
    }

    if (state.pokemons.isEmpty) {
      return Center(
        child: Text(
          context.l10n.noPokemonFound,
          style: context.fonts.bodyLarge,
        ),
      );
    }

    return RefreshIndicator(
      color: colors.azulNormal,
      onRefresh: () async {
        ref.read(pokemonListViewModelProvider.notifier).refresh();
      },
      child: ListView.separated(
        controller: _scrollController,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        separatorBuilder: (context, index) => const SizedBox(height: 12),
        itemCount: state.pokemons.length + (state.isLoading ? 1 : 0),
        itemBuilder: (context, index) {
          if (index == state.pokemons.length) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: CircularProgressIndicator(
                  color: colors.azulNormal,
                ),
              ),
            );
          }

          final pokemon = state.pokemons[index];
          final favoritesAsync = ref.watch(favoritesViewModelProvider);
          final isFavorite =
              favoritesAsync.valueOrNull?.any((fav) => fav.id == pokemon.id) ??
                  false;

          return PokemonCard(
            pokemon: pokemon,
            isFavorite: isFavorite,
            onTap: () {
              context.push('/pokemon/${pokemon.id}');
            },
            onFavoriteToggle: () async {
              await ref
                  .read(favoritesViewModelProvider.notifier)
                  .toggleFavorite(pokemon.id);
            },
          );
        },
      ),
    );
  }
}
