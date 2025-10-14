// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PokemonModelImpl _$$PokemonModelImplFromJson(Map<String, dynamic> json) =>
    _$PokemonModelImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      height: (json['height'] as num).toInt(),
      weight: (json['weight'] as num).toInt(),
      baseExperience: (json['base_experience'] as num).toInt(),
      types: (json['types'] as List<dynamic>)
          .map((e) => PokemonTypeSlot.fromJson(e as Map<String, dynamic>))
          .toList(),
      abilities: (json['abilities'] as List<dynamic>)
          .map((e) => PokemonAbilitySlot.fromJson(e as Map<String, dynamic>))
          .toList(),
      stats: (json['stats'] as List<dynamic>)
          .map((e) => PokemonStatModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      sprites:
          PokemonSpritesModel.fromJson(json['sprites'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PokemonModelImplToJson(_$PokemonModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'height': instance.height,
      'weight': instance.weight,
      'base_experience': instance.baseExperience,
      'types': instance.types,
      'abilities': instance.abilities,
      'stats': instance.stats,
      'sprites': instance.sprites,
    };

_$PokemonTypeSlotImpl _$$PokemonTypeSlotImplFromJson(
        Map<String, dynamic> json) =>
    _$PokemonTypeSlotImpl(
      slot: (json['slot'] as num).toInt(),
      type: PokemonTypeInfo.fromJson(json['type'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PokemonTypeSlotImplToJson(
        _$PokemonTypeSlotImpl instance) =>
    <String, dynamic>{
      'slot': instance.slot,
      'type': instance.type,
    };

_$PokemonTypeInfoImpl _$$PokemonTypeInfoImplFromJson(
        Map<String, dynamic> json) =>
    _$PokemonTypeInfoImpl(
      name: json['name'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$$PokemonTypeInfoImplToJson(
        _$PokemonTypeInfoImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };

_$PokemonAbilitySlotImpl _$$PokemonAbilitySlotImplFromJson(
        Map<String, dynamic> json) =>
    _$PokemonAbilitySlotImpl(
      slot: (json['slot'] as num).toInt(),
      isHidden: json['is_hidden'] as bool,
      ability:
          PokemonAbilityInfo.fromJson(json['ability'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PokemonAbilitySlotImplToJson(
        _$PokemonAbilitySlotImpl instance) =>
    <String, dynamic>{
      'slot': instance.slot,
      'is_hidden': instance.isHidden,
      'ability': instance.ability,
    };

_$PokemonAbilityInfoImpl _$$PokemonAbilityInfoImplFromJson(
        Map<String, dynamic> json) =>
    _$PokemonAbilityInfoImpl(
      name: json['name'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$$PokemonAbilityInfoImplToJson(
        _$PokemonAbilityInfoImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };

_$PokemonStatModelImpl _$$PokemonStatModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PokemonStatModelImpl(
      baseStat: (json['base_stat'] as num).toInt(),
      effort: (json['effort'] as num).toInt(),
      stat: PokemonStatInfo.fromJson(json['stat'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PokemonStatModelImplToJson(
        _$PokemonStatModelImpl instance) =>
    <String, dynamic>{
      'base_stat': instance.baseStat,
      'effort': instance.effort,
      'stat': instance.stat,
    };

_$PokemonStatInfoImpl _$$PokemonStatInfoImplFromJson(
        Map<String, dynamic> json) =>
    _$PokemonStatInfoImpl(
      name: json['name'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$$PokemonStatInfoImplToJson(
        _$PokemonStatInfoImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };

_$PokemonSpritesModelImpl _$$PokemonSpritesModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PokemonSpritesModelImpl(
      frontDefault: json['front_default'] as String,
      frontShiny: json['front_shiny'] as String?,
      backDefault: json['back_default'] as String?,
      backShiny: json['back_shiny'] as String?,
      other: json['other'] == null
          ? null
          : PokemonOtherSprites.fromJson(json['other'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PokemonSpritesModelImplToJson(
        _$PokemonSpritesModelImpl instance) =>
    <String, dynamic>{
      'front_default': instance.frontDefault,
      'front_shiny': instance.frontShiny,
      'back_default': instance.backDefault,
      'back_shiny': instance.backShiny,
      'other': instance.other,
    };

_$PokemonOtherSpritesImpl _$$PokemonOtherSpritesImplFromJson(
        Map<String, dynamic> json) =>
    _$PokemonOtherSpritesImpl(
      officialArtwork: json['official-artwork'] == null
          ? null
          : OfficialArtwork.fromJson(
              json['official-artwork'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PokemonOtherSpritesImplToJson(
        _$PokemonOtherSpritesImpl instance) =>
    <String, dynamic>{
      'official-artwork': instance.officialArtwork,
    };

_$OfficialArtworkImpl _$$OfficialArtworkImplFromJson(
        Map<String, dynamic> json) =>
    _$OfficialArtworkImpl(
      frontDefault: json['front_default'] as String?,
    );

Map<String, dynamic> _$$OfficialArtworkImplToJson(
        _$OfficialArtworkImpl instance) =>
    <String, dynamic>{
      'front_default': instance.frontDefault,
    };
