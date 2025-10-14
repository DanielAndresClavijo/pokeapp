import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokeapp/domain/entities/pokemon.dart';

part 'pokemon_model.freezed.dart';
part 'pokemon_model.g.dart';

/// Pokemon model for API responses
@freezed
class PokemonModel with _$PokemonModel {
  const PokemonModel._();

  const factory PokemonModel({
    required int id,
    required String name,
    required int height,
    required int weight,
    @JsonKey(name: 'base_experience') required int baseExperience,
    required List<PokemonTypeSlot> types,
    required List<PokemonAbilitySlot> abilities,
    required List<PokemonStatModel> stats,
    required PokemonSpritesModel sprites,
  }) = _PokemonModel;

  factory PokemonModel.fromJson(Map<String, dynamic> json) =>
      _$PokemonModelFromJson(json);

  /// Convert to entity
  Pokemon toEntity() {
    return Pokemon(
      id: id,
      name: name,
      height: height,
      weight: weight,
      baseExperience: baseExperience,
      types: types.map((e) => e.type.name).toList(),
      abilities: abilities.map((e) => e.ability.name).toList(),
      stats: PokemonStats(
        hp: _getStatValue('hp'),
        attack: _getStatValue('attack'),
        defense: _getStatValue('defense'),
        specialAttack: _getStatValue('special-attack'),
        specialDefense: _getStatValue('special-defense'),
        speed: _getStatValue('speed'),
      ),
      sprites: PokemonSprites(
        frontDefault: sprites.frontDefault,
        frontShiny: sprites.frontShiny,
        backDefault: sprites.backDefault,
        backShiny: sprites.backShiny,
        officialArtwork: sprites.other?.officialArtwork?.frontDefault,
      ),
    );
  }

  int _getStatValue(String statName) {
    final stat = stats.firstWhere(
      (s) => s.stat.name == statName,
      orElse: () => const PokemonStatModel(
        baseStat: 0,
        effort: 0,
        stat: PokemonStatInfo(name: '', url: ''),
      ),
    );
    return stat.baseStat;
  }
}

/// Pokemon type slot
@freezed
class PokemonTypeSlot with _$PokemonTypeSlot {
  const factory PokemonTypeSlot({
    required int slot,
    required PokemonTypeInfo type,
  }) = _PokemonTypeSlot;

  factory PokemonTypeSlot.fromJson(Map<String, dynamic> json) =>
      _$PokemonTypeSlotFromJson(json);
}

/// Pokemon type info
@freezed
class PokemonTypeInfo with _$PokemonTypeInfo {
  const factory PokemonTypeInfo({
    required String name,
    required String url,
  }) = _PokemonTypeInfo;

  factory PokemonTypeInfo.fromJson(Map<String, dynamic> json) =>
      _$PokemonTypeInfoFromJson(json);
}

/// Pokemon ability slot
@freezed
class PokemonAbilitySlot with _$PokemonAbilitySlot {
  const factory PokemonAbilitySlot({
    required int slot,
    @JsonKey(name: 'is_hidden') required bool isHidden,
    required PokemonAbilityInfo ability,
  }) = _PokemonAbilitySlot;

  factory PokemonAbilitySlot.fromJson(Map<String, dynamic> json) =>
      _$PokemonAbilitySlotFromJson(json);
}

/// Pokemon ability info
@freezed
class PokemonAbilityInfo with _$PokemonAbilityInfo {
  const factory PokemonAbilityInfo({
    required String name,
    required String url,
  }) = _PokemonAbilityInfo;

  factory PokemonAbilityInfo.fromJson(Map<String, dynamic> json) =>
      _$PokemonAbilityInfoFromJson(json);
}

/// Pokemon stat model
@freezed
class PokemonStatModel with _$PokemonStatModel {
  const factory PokemonStatModel({
    @JsonKey(name: 'base_stat') required int baseStat,
    required int effort,
    required PokemonStatInfo stat,
  }) = _PokemonStatModel;

  factory PokemonStatModel.fromJson(Map<String, dynamic> json) =>
      _$PokemonStatModelFromJson(json);
}

/// Pokemon stat info
@freezed
class PokemonStatInfo with _$PokemonStatInfo {
  const factory PokemonStatInfo({
    required String name,
    required String url,
  }) = _PokemonStatInfo;

  factory PokemonStatInfo.fromJson(Map<String, dynamic> json) =>
      _$PokemonStatInfoFromJson(json);
}

/// Pokemon sprites model
@freezed
class PokemonSpritesModel with _$PokemonSpritesModel {
  const factory PokemonSpritesModel({
    @JsonKey(name: 'front_default') required String frontDefault,
    @JsonKey(name: 'front_shiny') String? frontShiny,
    @JsonKey(name: 'back_default') String? backDefault,
    @JsonKey(name: 'back_shiny') String? backShiny,
    PokemonOtherSprites? other,
  }) = _PokemonSpritesModel;

  factory PokemonSpritesModel.fromJson(Map<String, dynamic> json) =>
      _$PokemonSpritesModelFromJson(json);
}

/// Pokemon other sprites
@freezed
class PokemonOtherSprites with _$PokemonOtherSprites {
  const factory PokemonOtherSprites({
    @JsonKey(name: 'official-artwork') OfficialArtwork? officialArtwork,
  }) = _PokemonOtherSprites;

  factory PokemonOtherSprites.fromJson(Map<String, dynamic> json) =>
      _$PokemonOtherSpritesFromJson(json);
}

/// Official artwork
@freezed
class OfficialArtwork with _$OfficialArtwork {
  const factory OfficialArtwork({
    @JsonKey(name: 'front_default') String? frontDefault,
  }) = _OfficialArtwork;

  factory OfficialArtwork.fromJson(Map<String, dynamic> json) =>
      _$OfficialArtworkFromJson(json);
}
