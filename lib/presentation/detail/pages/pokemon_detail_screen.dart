import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:pokeapp/core/extensions/context_extension.dart';
import 'package:pokeapp/core/utils/pokemon_type_effectiveness.dart';
import 'package:pokeapp/core/utils/pokemon_type_helper.dart';
import 'package:pokeapp/core/widgets/favorite_icon_button.dart';
import 'package:pokeapp/core/widgets/loading_indicator.dart';
import 'package:pokeapp/core/widgets/pokemon_gender_ratio.dart';
import 'package:pokeapp/core/widgets/pokemon_type_badge.dart';
import 'package:pokeapp/core/widgets/pokemon_type_icon_background.dart';
import 'package:pokeapp/domain/entities/pokemon.dart';
import 'package:pokeapp/presentation/detail/providers/pokemon_species_provider.dart';
import 'package:pokeapp/presentation/detail/viewmodels/pokemon_detail_viewmodel.dart';
import 'package:pokeapp/presentation/detail/widgets/pokemon_stat_bar.dart';

/// Pokemon detail screen
class PokemonDetailScreen extends ConsumerStatefulWidget {
  final String pokemonId;

  const PokemonDetailScreen({
    super.key,
    required this.pokemonId,
  });

  @override
  ConsumerState<PokemonDetailScreen> createState() =>
      _PokemonDetailScreenState();
}

class _PokemonDetailScreenState extends ConsumerState<PokemonDetailScreen> {
  final _draggableScrollableController = DraggableScrollableController();
  bool _showShadow = false;

  @override
  void initState() {
    super.initState();
    _draggableScrollableController.addListener(() {
      final showShadow = _draggableScrollableController.size > 0.75;
      if (showShadow != _showShadow) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          setState(() => _showShadow = showShadow);
        });
      }
    });
  }

  Future<void> _toggleFavorite() async {
    final pokemonId = int.tryParse(widget.pokemonId);
    if (pokemonId == null) return;
    
    // Delegar al ViewModel
    await ref.read(pokemonDetailViewModelProvider(pokemonId).notifier).toggleFavorite();
  }

  @override
  Widget build(BuildContext context) {
    final pokemonId = int.tryParse(widget.pokemonId);
    if (pokemonId == null) {
      return Scaffold(
        backgroundColor: context.colors.surfaceDefault,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new),
            onPressed: () => context.pop(),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.error_outline,
                size: 64,
                color: context.colors.colorBronze500,
              ),
              const SizedBox(height: 16),
              Text(
                'Invalid Pokemon ID',
                style: context.fonts.titleMedium?.copyWith(
                  color: context.colors.textSecondary,
                ),
              ),
            ],
          ),
        ),
      );
    }

    // Usar el ViewModel en lugar de acceder directamente a los use cases
    final viewModelState = ref.watch(pokemonDetailViewModelProvider(pokemonId));

    return viewModelState.when(
      data: (state) {
        final pokemon = state.pokemon;
        final isFavorite = state.isFavorite;

        if (pokemon == null) {
          return Scaffold(
            backgroundColor: context.colors.surfaceDefault,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios_new),
                onPressed: () => context.pop(),
              ),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.error_outline,
                    size: 64,
                    color: context.colors.colorBronze500,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    state.errorMessage ?? context.l10n.error,
                    style: context.fonts.titleMedium?.copyWith(
                      color: context.colors.textSecondary,
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => ref.refresh(pokemonDetailViewModelProvider(pokemonId)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: context.colors.azulNormal,
                      foregroundColor: Colors.white,
                    ),
                    child: Text(context.l10n.retry),
                  ),
                ],
              ),
            ),
          );
        }

        return _buildPokemonDetail(context, pokemon, isFavorite);
      },
      loading: () => Scaffold(
        backgroundColor: context.colors.surfaceDefault,
        body: const Center(child: LoadingIndicator()),
      ),
      error: (error, _) => Scaffold(
        backgroundColor: context.colors.surfaceDefault,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new),
            onPressed: () => context.pop(),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.error_outline,
                size: 64,
                color: context.colors.colorBronze500,
              ),
              const SizedBox(height: 16),
              Text(
                error.toString(),
                style: context.fonts.titleMedium?.copyWith(
                  color: context.colors.textSecondary,
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => ref.refresh(pokemonDetailViewModelProvider(pokemonId)),
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

  Widget _buildPokemonDetail(BuildContext context, Pokemon pokemon, bool isFavorite) {
    final primaryType =
        pokemon.types.isNotEmpty ? pokemon.types.first : 'normal';
    final pokemonColor = PokemonTypeHelper.getTypeColor(
      primaryType,
      context.pokemonColors,
    );
    final screenSize = MediaQuery.sizeOf(context);
    final circleWidht = screenSize.width + (screenSize.width * 0.1917);

    return Scaffold(
      backgroundColor: pokemonColor,
      body: SafeArea(
        child: Material(
          color: context.colors.surfaceDefault,
          child: Stack(
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: screenSize.height * 0.3,
                  ),
                  Positioned(
                    top: (circleWidht * 0.5) * -1,
                    left: -(screenSize.width * 0.1917),
                    right: -(screenSize.width * 0.1917),
                    child: ClipOval(
                      child: Container(
                        width: circleWidht,
                        height: circleWidht,
                        decoration: BoxDecoration(
                          color: pokemonColor,
                          borderRadius: const BorderRadius.vertical(
                              bottom: Radius.circular(100)),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: Material(
                      color: pokemonColor,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            color: Colors.white,
                            icon: const Icon(Icons.arrow_back_ios_new),
                            onPressed: () => context.pop(),
                          ),
                          FavoriteIconButton(
                            isFavorite: isFavorite,
                            onTap: _toggleFavorite,
                            size: 24,
                            showBackground: false,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 42,
                    left: 0,
                    right: 0,
                    child: PokemonTypeIconBackground(
                      type: primaryType,
                      size: 180,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: SizedBox.square(
                        dimension: 160,
                        child: Image.network(
                          pokemon.sprites.frontDefault,
                          width: 160,
                          height: 160,
                          fit: BoxFit.fill,
                          errorBuilder: (context, error, stackTrace) {
                            return Icon(
                              Icons.catching_pokemon,
                              size: 100,
                              color: Colors.white.withValues(alpha: 0.7),
                            );
                          },
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) return child;

                            return SizedBox(
                              width: 160,
                              height: 160,
                              child: Center(
                                child: CircularProgressIndicator(
                                  value: loadingProgress.expectedTotalBytes !=
                                          null
                                      ? loadingProgress.cumulativeBytesLoaded /
                                          loadingProgress.expectedTotalBytes!
                                      : null,
                                  color: Colors.white.withValues(alpha: 0.7),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              // Name and number
              DraggableScrollableSheet(
                initialChildSize: 0.7,
                minChildSize: 0.7,
                maxChildSize: (screenSize.height - 48) / screenSize.height,
                controller: _draggableScrollableController,
                builder: (context, scrollController) {
                  return Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: context.colors.surfaceDefault,
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(24),
                      ),
                      boxShadow: [
                        if (_showShadow)
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.1),
                            blurRadius: 10,
                            offset: const Offset(0, -5),
                          ),
                      ],
                    ),
                    child: CustomScrollView(
                      controller: scrollController,
                      slivers: [
                        SliverToBoxAdapter(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            spacing: 8,
                            children: [
                              Text(
                                pokemon.name.toUpperCase(),
                                style: context.fonts.displayLarge,
                              ),
                              Text(
                                'N°${pokemon.id.toString().padLeft(3, '0')}',
                                style: context.fonts.headlineSmall,
                              ),
                            ],
                          ),
                        ),
                        const SliverToBoxAdapter(child: SizedBox(height: 16)),

                        // Types
                        SliverToBoxAdapter(
                          child: Row(
                            children: pokemon.types
                                .map((type) => Padding(
                                      padding:
                                          const EdgeInsets.only(right: 8.0),
                                      child: PokemonTypeBadge(type: type),
                                    ))
                                .toList(),
                          ),
                        ),
                        const SliverToBoxAdapter(child: SizedBox(height: 24)),

                        // Description section - From species data
                        _SpeciesDataSection(
                          pokemonId: pokemon.id,
                          pokemon: pokemon,
                        ),

                        const SliverToBoxAdapter(child: SizedBox(height: 24)),

                        // Weaknesses section - Calculated from types
                        _WeaknessesSection(types: pokemon.types),

                        const SliverToBoxAdapter(child: SizedBox(height: 24)),

                        // Stats section
                        SliverToBoxAdapter(
                          child: Text(
                            context.l10n.stats,
                            style: context.fonts.headlineMedium?.copyWith(
                              color: context.colors.textPrimary,
                            ),
                          ),
                        ),
                        const SliverToBoxAdapter(child: SizedBox(height: 16)),
                        SliverList.list(
                          children: [
                            PokemonStatBar(
                              label: context.l10n.hp,
                              value: pokemon.stats.hp,
                            ),
                            PokemonStatBar(
                              label: context.l10n.attack,
                              value: pokemon.stats.attack,
                            ),
                            PokemonStatBar(
                              label: context.l10n.defense,
                              value: pokemon.stats.defense,
                            ),
                            PokemonStatBar(
                              label: context.l10n.specialAttack,
                              value: pokemon.stats.specialAttack,
                            ),
                            PokemonStatBar(
                              label: context.l10n.specialDefense,
                              value: pokemon.stats.specialDefense,
                            ),
                            PokemonStatBar(
                              label: context.l10n.speed,
                              value: pokemon.stats.speed,
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Widget para mostrar la información de especies (descripción y género)
class _SpeciesDataSection extends ConsumerWidget {
  final int pokemonId;
  final Pokemon pokemon;

  const _SpeciesDataSection({
    required this.pokemonId,
    required this.pokemon,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final speciesAsync = ref.watch(pokemonSpeciesProvider(pokemonId));

    return speciesAsync.when(
      data: (species) {
        return SliverList.list(
          children: [
            Text(
              species.description,
              style: context.fonts.labelLarge?.copyWith(
                height: 1.5,
                color: context.colors.textSecondary,
              ),
            ),
            const SizedBox(height: 16),
            Divider(color: context.colors.borderDefault),
            const SizedBox(height: 16),
            ..._buildMoreInfo(context),
            const SizedBox(height: 16),

            // Gender ratio
            Text(
              context.l10n.gender.toUpperCase(),
              style: context.fonts.labelMedium?.copyWith(
                fontWeight: FontWeight.w600,
                letterSpacing: 1.2,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            PokemonGenderRatio(
              species: species,
              textStyle: context.fonts.bodySmall?.copyWith(
                color: context.colors.textSecondary,
              ),
            ),
          ],
        );
      },
      loading: () => SliverList.list(
        children: [
          const Center(child: CircularProgressIndicator()),
          const SizedBox(height: 24),
          ..._buildMoreInfo(context),
          const SizedBox(height: 24),
          const Center(child: CircularProgressIndicator()),
        ],
      ),
      error: (_, __) => SliverList.list(
        children: _buildMoreInfo(context),
      ),
    );
  }

  List<Widget> _buildMoreInfo(BuildContext context) {
    return [
      Row(
        children: [
          Expanded(
            child: _InfoCard(
              svgIconAssetString: context.assets.weightIcon,
              label: context.l10n.weight,
              value: '${(pokemon.weight / 10).toStringAsFixed(1)} kg',
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: _InfoCard(
              svgIconAssetString: context.assets.heightIcon,
              label: context.l10n.height,
              value: '${(pokemon.height / 10).toStringAsFixed(1)} m',
            ),
          ),
        ],
      ),
      const SizedBox(height: 24),
      Row(
        children: [
          Expanded(
            child: _InfoCard(
              svgIconAssetString: context.assets.categoryIcon,
              label: context.l10n.category,
              value: pokemon.types.isNotEmpty
                  ? pokemon.types.first.toUpperCase()
                  : 'NORMAL',
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: _InfoCard(
              svgIconAssetString: context.assets.abilityIcon,
              label: context.l10n.ability,
              value: pokemon.abilities.isNotEmpty
                  ? pokemon.abilities.first.toUpperCase()
                  : '-',
            ),
          ),
        ],
      ),
    ];
  }
}

/// Widget para mostrar las debilidades del Pokémon
class _WeaknessesSection extends StatelessWidget {
  final List<String> types;

  const _WeaknessesSection({
    required this.types,
  });

  @override
  Widget build(BuildContext context) {
    // Calcula debilidades basándose en los tipos del Pokémon
    // Considera tipos dobles (ej: Fire/Flying es 4× débil a Rock)
    final weaknesses = PokemonTypeEffectiveness.getWeaknesses(types);

    if (weaknesses.isEmpty) {
      return const SliverToBoxAdapter(child: SizedBox.shrink());
    }

    return SliverList.list(
      children: [
        Text(
          context.l10n.weaknesses.toUpperCase(),
          style: context.fonts.headlineMedium?.copyWith(
            color: context.colors.textPrimary,
          ),
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children:
              weaknesses.map((type) => PokemonTypeBadge(type: type)).toList(),
        ),
      ],
    );
  }
}

class _InfoCard extends StatelessWidget {
  final String svgIconAssetString;
  final String label;
  final String value;

  const _InfoCard({
    required this.svgIconAssetString,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 4,
      children: [
        Row(
          spacing: 6,
          children: [
            SvgPicture.asset(
              svgIconAssetString,
              height: 16,
              width: 16,
            ),
            Text(
              label.toUpperCase(),
              style: context.fonts.labelSmall?.copyWith(
                color: context.colors.textSecondary,
                letterSpacing: 0.5,
              ),
            ),
          ],
        ),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: context.colors.surfaceDefault,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: context.colors.borderDefault),
          ),
          width: double.infinity,
          child: Column(
            children: [
              const SizedBox(height: 4),
              Text(
                value,
                style: context.fonts.titleMedium?.copyWith(
                  color: context.colors.textPrimary,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
