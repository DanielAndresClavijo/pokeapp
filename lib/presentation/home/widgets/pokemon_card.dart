import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokeapp/core/extensions/context_extension.dart';
import 'package:pokeapp/core/utils/pokemon_type_helper.dart';
import 'package:pokeapp/core/widgets/favorite_icon_button.dart';
import 'package:pokeapp/core/widgets/pokemon_image_with_type_background.dart';
import 'package:pokeapp/core/widgets/pokemon_type_badge.dart';
import 'package:pokeapp/domain/entities/pokemon.dart';
import 'package:pokeapp/domain/entities/pokemon_list_item.dart';
import 'package:pokeapp/presentation/home/providers/pokemon_detail_provider.dart';

/// Pokemon card widget for list
class PokemonCard extends ConsumerWidget {
  final PokemonListItem pokemon;
  final VoidCallback onTap;
  final bool isFavorite;
  final VoidCallback? onFavoriteToggle;

  const PokemonCard({
    super.key,
    required this.pokemon,
    required this.onTap,
    this.isFavorite = false,
    this.onFavoriteToggle,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Load pokemon detail to get types and image
    final pokemonDetailAsync = ref.watch(pokemonDetailProvider(pokemon.id));

    return pokemonDetailAsync.when(
      data: (pokemonData) => _buildCard(context, pokemonData),
      loading: () => _buildLoadingCard(context),
      error: (_, __) => _buildLoadingCard(context), // Fallback to loading state on error
    );
  }

  Widget _buildCard(BuildContext context, Pokemon pokemonData) {
    // Use best quality sprite available from API
    final imageUrl = pokemonData.sprites.bestQuality;
    final pokemonColors = context.pokemonColors;
    final primaryType = pokemonData.types.isNotEmpty ? pokemonData.types.first : 'normal';
    final backgroundColor = PokemonTypeHelper.getTypeColor(primaryType, pokemonColors);

    return Material(
      color: backgroundColor.withValues(alpha: 0.5),
      borderRadius: BorderRadius.circular(16),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          children: [
            
            // Content
            Row(
              children: [
                // Left side - Pokemon info
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 12, 8, 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // ID
                        Text(
                          pokemon.formattedId,
                          style: context.fonts.labelMedium?.copyWith(
                            color: Colors.black.withValues(alpha: 0.6),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 4),
                                
                        // Name
                        Text(
                          pokemon.capitalizedName,
                          style: context.fonts.displaySmall,
                        ),
                        const SizedBox(height: 8),
                                
                        // Type badges
                        Wrap(
                          spacing: 4,
                          runSpacing: 4,
                          children: pokemonData.types
                              .map((type) => PokemonTypeBadge(type: type))
                              .toList(),
                        ),
                      ],
                    ),
                  ),
                ),
            
                // Right side - Pokemon image
                PokemonImageWithTypeBackground(
                  imageUrl: imageUrl,
                  backgroundColor: backgroundColor,
                  primaryType: pokemonData.types.isNotEmpty ? pokemonData.types.first : null,
                  overlay: onFavoriteToggle != null
                      ? Positioned(
                          top: 8,
                          right: 8,
                          child: FavoriteIconButton(
                            isFavorite: isFavorite,
                            onTap: onFavoriteToggle,
                            size: 16,
                          ),
                        )
                      : null,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLoadingCard(BuildContext context) {
    const backgroundColor = Color(0xFF8BC34A); // Default grass color

    return Container(
      height: 120,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16),
          child: Stack(
            children: [
              // Decorative circles
              Positioned(
                right: -20,
                top: -20,
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.1),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              Positioned(
                right: 60,
                bottom: -30,
                child: Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.1),
                    shape: BoxShape.circle,
                  ),
                ),
              ),

              // Content
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    // Left side - Pokemon info
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            pokemon.formattedId,
                            style: context.fonts.labelMedium?.copyWith(
                              color: Colors.black.withValues(alpha: 0.6),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            pokemon.capitalizedName,
                            style: context.fonts.headlineSmall?.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          // Loading indicator for types
                          SizedBox(
                            width: 16,
                            height: 16,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                Colors.white.withValues(alpha: 0.7),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Right side - Pokemon image placeholder
                    SizedBox(
                      width: 110,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            width: 90,
                            height: 90,
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.3),
                              shape: BoxShape.circle,
                            ),
                          ),
                          // Pokemon icon placeholder while loading
                          Icon(
                            Icons.catching_pokemon,
                            size: 50,
                            color: Colors.white.withValues(alpha: 0.7),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // Favorite button
              if (onFavoriteToggle != null)
                Positioned(
                  top: 8,
                  right: 8,
                  child: FavoriteIconButton(
                    isFavorite: isFavorite,
                    onTap: onFavoriteToggle,
                    size: 20,
                    backgroundColor: Colors.white,
                    normalColor: Colors.grey[600],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
