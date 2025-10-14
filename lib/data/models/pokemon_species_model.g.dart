// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_species_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PokemonSpeciesModelImpl _$$PokemonSpeciesModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PokemonSpeciesModelImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      genderRate: (json['gender_rate'] as num).toInt(),
      flavorTextEntries: (json['flavor_text_entries'] as List<dynamic>)
          .map((e) => FlavorTextEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
      habitat: json['habitat'] == null
          ? null
          : SpeciesHabitat.fromJson(json['habitat'] as Map<String, dynamic>),
      captureRate: (json['capture_rate'] as num).toInt(),
      isLegendary: json['is_legendary'] as bool,
      isMythical: json['is_mythical'] as bool,
    );

Map<String, dynamic> _$$PokemonSpeciesModelImplToJson(
        _$PokemonSpeciesModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'gender_rate': instance.genderRate,
      'flavor_text_entries': instance.flavorTextEntries,
      'habitat': instance.habitat,
      'capture_rate': instance.captureRate,
      'is_legendary': instance.isLegendary,
      'is_mythical': instance.isMythical,
    };

_$FlavorTextEntryImpl _$$FlavorTextEntryImplFromJson(
        Map<String, dynamic> json) =>
    _$FlavorTextEntryImpl(
      flavorText: json['flavor_text'] as String,
      language:
          NamedApiResource.fromJson(json['language'] as Map<String, dynamic>),
      version:
          NamedApiResource.fromJson(json['version'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$FlavorTextEntryImplToJson(
        _$FlavorTextEntryImpl instance) =>
    <String, dynamic>{
      'flavor_text': instance.flavorText,
      'language': instance.language,
      'version': instance.version,
    };

_$SpeciesHabitatImpl _$$SpeciesHabitatImplFromJson(Map<String, dynamic> json) =>
    _$SpeciesHabitatImpl(
      name: json['name'] as String,
    );

Map<String, dynamic> _$$SpeciesHabitatImplToJson(
        _$SpeciesHabitatImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
    };

_$NamedApiResourceImpl _$$NamedApiResourceImplFromJson(
        Map<String, dynamic> json) =>
    _$NamedApiResourceImpl(
      name: json['name'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$$NamedApiResourceImplToJson(
        _$NamedApiResourceImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };
