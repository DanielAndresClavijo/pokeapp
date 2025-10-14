// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_detail_viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$pokemonDetailViewModelHash() =>
    r'daffca283a09b097e895b40a691c925c45c0f132';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$PokemonDetailViewModel
    extends BuildlessAutoDisposeAsyncNotifier<PokemonDetailState> {
  late final int pokemonId;

  FutureOr<PokemonDetailState> build(
    int pokemonId,
  );
}

/// ViewModel para la pantalla de detalles del Pokémon
///
/// Maneja:
/// - Carga de datos del Pokémon
/// - Estado de favorito
/// - Toggle de favorito
///
/// Copied from [PokemonDetailViewModel].
@ProviderFor(PokemonDetailViewModel)
const pokemonDetailViewModelProvider = PokemonDetailViewModelFamily();

/// ViewModel para la pantalla de detalles del Pokémon
///
/// Maneja:
/// - Carga de datos del Pokémon
/// - Estado de favorito
/// - Toggle de favorito
///
/// Copied from [PokemonDetailViewModel].
class PokemonDetailViewModelFamily
    extends Family<AsyncValue<PokemonDetailState>> {
  /// ViewModel para la pantalla de detalles del Pokémon
  ///
  /// Maneja:
  /// - Carga de datos del Pokémon
  /// - Estado de favorito
  /// - Toggle de favorito
  ///
  /// Copied from [PokemonDetailViewModel].
  const PokemonDetailViewModelFamily();

  /// ViewModel para la pantalla de detalles del Pokémon
  ///
  /// Maneja:
  /// - Carga de datos del Pokémon
  /// - Estado de favorito
  /// - Toggle de favorito
  ///
  /// Copied from [PokemonDetailViewModel].
  PokemonDetailViewModelProvider call(
    int pokemonId,
  ) {
    return PokemonDetailViewModelProvider(
      pokemonId,
    );
  }

  @override
  PokemonDetailViewModelProvider getProviderOverride(
    covariant PokemonDetailViewModelProvider provider,
  ) {
    return call(
      provider.pokemonId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'pokemonDetailViewModelProvider';
}

/// ViewModel para la pantalla de detalles del Pokémon
///
/// Maneja:
/// - Carga de datos del Pokémon
/// - Estado de favorito
/// - Toggle de favorito
///
/// Copied from [PokemonDetailViewModel].
class PokemonDetailViewModelProvider
    extends AutoDisposeAsyncNotifierProviderImpl<PokemonDetailViewModel,
        PokemonDetailState> {
  /// ViewModel para la pantalla de detalles del Pokémon
  ///
  /// Maneja:
  /// - Carga de datos del Pokémon
  /// - Estado de favorito
  /// - Toggle de favorito
  ///
  /// Copied from [PokemonDetailViewModel].
  PokemonDetailViewModelProvider(
    int pokemonId,
  ) : this._internal(
          () => PokemonDetailViewModel()..pokemonId = pokemonId,
          from: pokemonDetailViewModelProvider,
          name: r'pokemonDetailViewModelProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$pokemonDetailViewModelHash,
          dependencies: PokemonDetailViewModelFamily._dependencies,
          allTransitiveDependencies:
              PokemonDetailViewModelFamily._allTransitiveDependencies,
          pokemonId: pokemonId,
        );

  PokemonDetailViewModelProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.pokemonId,
  }) : super.internal();

  final int pokemonId;

  @override
  FutureOr<PokemonDetailState> runNotifierBuild(
    covariant PokemonDetailViewModel notifier,
  ) {
    return notifier.build(
      pokemonId,
    );
  }

  @override
  Override overrideWith(PokemonDetailViewModel Function() create) {
    return ProviderOverride(
      origin: this,
      override: PokemonDetailViewModelProvider._internal(
        () => create()..pokemonId = pokemonId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        pokemonId: pokemonId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<PokemonDetailViewModel,
      PokemonDetailState> createElement() {
    return _PokemonDetailViewModelProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PokemonDetailViewModelProvider &&
        other.pokemonId == pokemonId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, pokemonId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin PokemonDetailViewModelRef
    on AutoDisposeAsyncNotifierProviderRef<PokemonDetailState> {
  /// The parameter `pokemonId` of this provider.
  int get pokemonId;
}

class _PokemonDetailViewModelProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<PokemonDetailViewModel,
        PokemonDetailState> with PokemonDetailViewModelRef {
  _PokemonDetailViewModelProviderElement(super.provider);

  @override
  int get pokemonId => (origin as PokemonDetailViewModelProvider).pokemonId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
