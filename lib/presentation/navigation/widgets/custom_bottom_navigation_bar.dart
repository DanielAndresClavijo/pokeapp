import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pokeapp/core/extensions/context_extension.dart';
import 'package:pokeapp/presentation/navigation/widgets/bottom_navigation_item.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final void Function(int index) onTap;
  final int currentIndex;

  const CustomBottomNavigationBar({
    super.key,
    required this.onTap,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return DecoratedBox(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: const Color(0x0000001F).withValues(alpha: 0.12),
            offset: const Offset(0, -1),
            blurRadius: 3,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Material(
        elevation: 0,
        color: context.colors.surfaceDefault,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Flexible(
                  child: InkWell(
                    borderRadius: BorderRadius.circular(16),
                    onTap: () => onTap(0),
                    child: BottomNavigationItem(
                      isSelected: currentIndex == 0,
                      icon: SvgPicture.asset(
                        context.assets.bottomNavigationHomeItem,
                        colorFilter: ColorFilter.mode(
                          currentIndex == 0
                              ? context.theme.bottomNavigationBarTheme.selectedItemColor!
                              : context.theme.bottomNavigationBarTheme.unselectedItemColor!,
                          BlendMode.srcIn,
                        ),
                      ),
                      label: l10n.home,
                    ),
                  ),
                ),
                Flexible(
                  child: InkWell(
                    borderRadius: BorderRadius.circular(16),
                    onTap: () => onTap(1),
                    child: BottomNavigationItem(
                      isSelected: currentIndex == 1,
                      icon: SvgPicture.asset(
                        context.assets.bottomNavigationRegionsItem,
                        colorFilter: ColorFilter.mode(
                          currentIndex == 1
                              ? context.theme.bottomNavigationBarTheme.selectedItemColor!
                              : context.theme.bottomNavigationBarTheme.unselectedItemColor!,
                          BlendMode.srcIn,
                        ),
                      ),
                      label: l10n.regions,
                    ),
                  ),
                ),
                Flexible(
                  child: InkWell(
                    borderRadius: BorderRadius.circular(16),
                    onTap: () => onTap(2),
                    child: BottomNavigationItem(
                      isSelected: currentIndex == 2,
                      icon: SvgPicture.asset(
                        context.assets.bottomNavigationFavoritesItem,
                        colorFilter: ColorFilter.mode(
                          currentIndex == 2
                              ? context.theme.bottomNavigationBarTheme.selectedItemColor!
                              : context.theme.bottomNavigationBarTheme.unselectedItemColor!,
                          BlendMode.srcIn,
                        ),
                      ),
                      label: l10n.favorites,
                    ),
                  ),
                ),
                Flexible(
                  child: InkWell(
                    borderRadius: BorderRadius.circular(16),
                    onTap: () => onTap(3),
                    child: BottomNavigationItem(
                      isSelected: currentIndex == 3,
                      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16,),
                      icon: SvgPicture.asset(
                        context.assets.bottomNavigationProfileItem,
                        colorFilter: ColorFilter.mode(
                          currentIndex == 3
                              ? context.theme.bottomNavigationBarTheme.selectedItemColor!
                              : context.theme.bottomNavigationBarTheme.unselectedItemColor!,
                          BlendMode.srcIn,
                        ),
                      ),
                      label: l10n.profile,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}