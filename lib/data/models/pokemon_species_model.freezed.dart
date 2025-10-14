// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pokemon_species_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PokemonSpeciesModel _$PokemonSpeciesModelFromJson(Map<String, dynamic> json) {
  return _PokemonSpeciesModel.fromJson(json);
}

/// @nodoc
mixin _$PokemonSpeciesModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'gender_rate')
  int get genderRate => throw _privateConstructorUsedError;
  @JsonKey(name: 'flavor_text_entries')
  List<FlavorTextEntry> get flavorTextEntries =>
      throw _privateConstructorUsedError;
  SpeciesHabitat? get habitat => throw _privateConstructorUsedError;
  @JsonKey(name: 'capture_rate')
  int get captureRate => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_legendary')
  bool get isLegendary => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_mythical')
  bool get isMythical => throw _privateConstructorUsedError;

  /// Serializes this PokemonSpeciesModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PokemonSpeciesModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PokemonSpeciesModelCopyWith<PokemonSpeciesModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PokemonSpeciesModelCopyWith<$Res> {
  factory $PokemonSpeciesModelCopyWith(
          PokemonSpeciesModel value, $Res Function(PokemonSpeciesModel) then) =
      _$PokemonSpeciesModelCopyWithImpl<$Res, PokemonSpeciesModel>;
  @useResult
  $Res call(
      {int id,
      String name,
      @JsonKey(name: 'gender_rate') int genderRate,
      @JsonKey(name: 'flavor_text_entries')
      List<FlavorTextEntry> flavorTextEntries,
      SpeciesHabitat? habitat,
      @JsonKey(name: 'capture_rate') int captureRate,
      @JsonKey(name: 'is_legendary') bool isLegendary,
      @JsonKey(name: 'is_mythical') bool isMythical});

  $SpeciesHabitatCopyWith<$Res>? get habitat;
}

/// @nodoc
class _$PokemonSpeciesModelCopyWithImpl<$Res, $Val extends PokemonSpeciesModel>
    implements $PokemonSpeciesModelCopyWith<$Res> {
  _$PokemonSpeciesModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PokemonSpeciesModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? genderRate = null,
    Object? flavorTextEntries = null,
    Object? habitat = freezed,
    Object? captureRate = null,
    Object? isLegendary = null,
    Object? isMythical = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      genderRate: null == genderRate
          ? _value.genderRate
          : genderRate // ignore: cast_nullable_to_non_nullable
              as int,
      flavorTextEntries: null == flavorTextEntries
          ? _value.flavorTextEntries
          : flavorTextEntries // ignore: cast_nullable_to_non_nullable
              as List<FlavorTextEntry>,
      habitat: freezed == habitat
          ? _value.habitat
          : habitat // ignore: cast_nullable_to_non_nullable
              as SpeciesHabitat?,
      captureRate: null == captureRate
          ? _value.captureRate
          : captureRate // ignore: cast_nullable_to_non_nullable
              as int,
      isLegendary: null == isLegendary
          ? _value.isLegendary
          : isLegendary // ignore: cast_nullable_to_non_nullable
              as bool,
      isMythical: null == isMythical
          ? _value.isMythical
          : isMythical // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  /// Create a copy of PokemonSpeciesModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SpeciesHabitatCopyWith<$Res>? get habitat {
    if (_value.habitat == null) {
      return null;
    }

    return $SpeciesHabitatCopyWith<$Res>(_value.habitat!, (value) {
      return _then(_value.copyWith(habitat: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PokemonSpeciesModelImplCopyWith<$Res>
    implements $PokemonSpeciesModelCopyWith<$Res> {
  factory _$$PokemonSpeciesModelImplCopyWith(_$PokemonSpeciesModelImpl value,
          $Res Function(_$PokemonSpeciesModelImpl) then) =
      __$$PokemonSpeciesModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      @JsonKey(name: 'gender_rate') int genderRate,
      @JsonKey(name: 'flavor_text_entries')
      List<FlavorTextEntry> flavorTextEntries,
      SpeciesHabitat? habitat,
      @JsonKey(name: 'capture_rate') int captureRate,
      @JsonKey(name: 'is_legendary') bool isLegendary,
      @JsonKey(name: 'is_mythical') bool isMythical});

  @override
  $SpeciesHabitatCopyWith<$Res>? get habitat;
}

/// @nodoc
class __$$PokemonSpeciesModelImplCopyWithImpl<$Res>
    extends _$PokemonSpeciesModelCopyWithImpl<$Res, _$PokemonSpeciesModelImpl>
    implements _$$PokemonSpeciesModelImplCopyWith<$Res> {
  __$$PokemonSpeciesModelImplCopyWithImpl(_$PokemonSpeciesModelImpl _value,
      $Res Function(_$PokemonSpeciesModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of PokemonSpeciesModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? genderRate = null,
    Object? flavorTextEntries = null,
    Object? habitat = freezed,
    Object? captureRate = null,
    Object? isLegendary = null,
    Object? isMythical = null,
  }) {
    return _then(_$PokemonSpeciesModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      genderRate: null == genderRate
          ? _value.genderRate
          : genderRate // ignore: cast_nullable_to_non_nullable
              as int,
      flavorTextEntries: null == flavorTextEntries
          ? _value._flavorTextEntries
          : flavorTextEntries // ignore: cast_nullable_to_non_nullable
              as List<FlavorTextEntry>,
      habitat: freezed == habitat
          ? _value.habitat
          : habitat // ignore: cast_nullable_to_non_nullable
              as SpeciesHabitat?,
      captureRate: null == captureRate
          ? _value.captureRate
          : captureRate // ignore: cast_nullable_to_non_nullable
              as int,
      isLegendary: null == isLegendary
          ? _value.isLegendary
          : isLegendary // ignore: cast_nullable_to_non_nullable
              as bool,
      isMythical: null == isMythical
          ? _value.isMythical
          : isMythical // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PokemonSpeciesModelImpl extends _PokemonSpeciesModel {
  const _$PokemonSpeciesModelImpl(
      {required this.id,
      required this.name,
      @JsonKey(name: 'gender_rate') required this.genderRate,
      @JsonKey(name: 'flavor_text_entries')
      required final List<FlavorTextEntry> flavorTextEntries,
      required this.habitat,
      @JsonKey(name: 'capture_rate') required this.captureRate,
      @JsonKey(name: 'is_legendary') required this.isLegendary,
      @JsonKey(name: 'is_mythical') required this.isMythical})
      : _flavorTextEntries = flavorTextEntries,
        super._();

  factory _$PokemonSpeciesModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PokemonSpeciesModelImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  @JsonKey(name: 'gender_rate')
  final int genderRate;
  final List<FlavorTextEntry> _flavorTextEntries;
  @override
  @JsonKey(name: 'flavor_text_entries')
  List<FlavorTextEntry> get flavorTextEntries {
    if (_flavorTextEntries is EqualUnmodifiableListView)
      return _flavorTextEntries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_flavorTextEntries);
  }

  @override
  final SpeciesHabitat? habitat;
  @override
  @JsonKey(name: 'capture_rate')
  final int captureRate;
  @override
  @JsonKey(name: 'is_legendary')
  final bool isLegendary;
  @override
  @JsonKey(name: 'is_mythical')
  final bool isMythical;

  @override
  String toString() {
    return 'PokemonSpeciesModel(id: $id, name: $name, genderRate: $genderRate, flavorTextEntries: $flavorTextEntries, habitat: $habitat, captureRate: $captureRate, isLegendary: $isLegendary, isMythical: $isMythical)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PokemonSpeciesModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.genderRate, genderRate) ||
                other.genderRate == genderRate) &&
            const DeepCollectionEquality()
                .equals(other._flavorTextEntries, _flavorTextEntries) &&
            (identical(other.habitat, habitat) || other.habitat == habitat) &&
            (identical(other.captureRate, captureRate) ||
                other.captureRate == captureRate) &&
            (identical(other.isLegendary, isLegendary) ||
                other.isLegendary == isLegendary) &&
            (identical(other.isMythical, isMythical) ||
                other.isMythical == isMythical));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      genderRate,
      const DeepCollectionEquality().hash(_flavorTextEntries),
      habitat,
      captureRate,
      isLegendary,
      isMythical);

  /// Create a copy of PokemonSpeciesModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PokemonSpeciesModelImplCopyWith<_$PokemonSpeciesModelImpl> get copyWith =>
      __$$PokemonSpeciesModelImplCopyWithImpl<_$PokemonSpeciesModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PokemonSpeciesModelImplToJson(
      this,
    );
  }
}

abstract class _PokemonSpeciesModel extends PokemonSpeciesModel {
  const factory _PokemonSpeciesModel(
          {required final int id,
          required final String name,
          @JsonKey(name: 'gender_rate') required final int genderRate,
          @JsonKey(name: 'flavor_text_entries')
          required final List<FlavorTextEntry> flavorTextEntries,
          required final SpeciesHabitat? habitat,
          @JsonKey(name: 'capture_rate') required final int captureRate,
          @JsonKey(name: 'is_legendary') required final bool isLegendary,
          @JsonKey(name: 'is_mythical') required final bool isMythical}) =
      _$PokemonSpeciesModelImpl;
  const _PokemonSpeciesModel._() : super._();

  factory _PokemonSpeciesModel.fromJson(Map<String, dynamic> json) =
      _$PokemonSpeciesModelImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  @JsonKey(name: 'gender_rate')
  int get genderRate;
  @override
  @JsonKey(name: 'flavor_text_entries')
  List<FlavorTextEntry> get flavorTextEntries;
  @override
  SpeciesHabitat? get habitat;
  @override
  @JsonKey(name: 'capture_rate')
  int get captureRate;
  @override
  @JsonKey(name: 'is_legendary')
  bool get isLegendary;
  @override
  @JsonKey(name: 'is_mythical')
  bool get isMythical;

  /// Create a copy of PokemonSpeciesModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PokemonSpeciesModelImplCopyWith<_$PokemonSpeciesModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FlavorTextEntry _$FlavorTextEntryFromJson(Map<String, dynamic> json) {
  return _FlavorTextEntry.fromJson(json);
}

/// @nodoc
mixin _$FlavorTextEntry {
  @JsonKey(name: 'flavor_text')
  String get flavorText => throw _privateConstructorUsedError;
  NamedApiResource get language => throw _privateConstructorUsedError;
  NamedApiResource get version => throw _privateConstructorUsedError;

  /// Serializes this FlavorTextEntry to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FlavorTextEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FlavorTextEntryCopyWith<FlavorTextEntry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FlavorTextEntryCopyWith<$Res> {
  factory $FlavorTextEntryCopyWith(
          FlavorTextEntry value, $Res Function(FlavorTextEntry) then) =
      _$FlavorTextEntryCopyWithImpl<$Res, FlavorTextEntry>;
  @useResult
  $Res call(
      {@JsonKey(name: 'flavor_text') String flavorText,
      NamedApiResource language,
      NamedApiResource version});

  $NamedApiResourceCopyWith<$Res> get language;
  $NamedApiResourceCopyWith<$Res> get version;
}

/// @nodoc
class _$FlavorTextEntryCopyWithImpl<$Res, $Val extends FlavorTextEntry>
    implements $FlavorTextEntryCopyWith<$Res> {
  _$FlavorTextEntryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FlavorTextEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? flavorText = null,
    Object? language = null,
    Object? version = null,
  }) {
    return _then(_value.copyWith(
      flavorText: null == flavorText
          ? _value.flavorText
          : flavorText // ignore: cast_nullable_to_non_nullable
              as String,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as NamedApiResource,
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as NamedApiResource,
    ) as $Val);
  }

  /// Create a copy of FlavorTextEntry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NamedApiResourceCopyWith<$Res> get language {
    return $NamedApiResourceCopyWith<$Res>(_value.language, (value) {
      return _then(_value.copyWith(language: value) as $Val);
    });
  }

  /// Create a copy of FlavorTextEntry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NamedApiResourceCopyWith<$Res> get version {
    return $NamedApiResourceCopyWith<$Res>(_value.version, (value) {
      return _then(_value.copyWith(version: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FlavorTextEntryImplCopyWith<$Res>
    implements $FlavorTextEntryCopyWith<$Res> {
  factory _$$FlavorTextEntryImplCopyWith(_$FlavorTextEntryImpl value,
          $Res Function(_$FlavorTextEntryImpl) then) =
      __$$FlavorTextEntryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'flavor_text') String flavorText,
      NamedApiResource language,
      NamedApiResource version});

  @override
  $NamedApiResourceCopyWith<$Res> get language;
  @override
  $NamedApiResourceCopyWith<$Res> get version;
}

/// @nodoc
class __$$FlavorTextEntryImplCopyWithImpl<$Res>
    extends _$FlavorTextEntryCopyWithImpl<$Res, _$FlavorTextEntryImpl>
    implements _$$FlavorTextEntryImplCopyWith<$Res> {
  __$$FlavorTextEntryImplCopyWithImpl(
      _$FlavorTextEntryImpl _value, $Res Function(_$FlavorTextEntryImpl) _then)
      : super(_value, _then);

  /// Create a copy of FlavorTextEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? flavorText = null,
    Object? language = null,
    Object? version = null,
  }) {
    return _then(_$FlavorTextEntryImpl(
      flavorText: null == flavorText
          ? _value.flavorText
          : flavorText // ignore: cast_nullable_to_non_nullable
              as String,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as NamedApiResource,
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as NamedApiResource,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FlavorTextEntryImpl implements _FlavorTextEntry {
  const _$FlavorTextEntryImpl(
      {@JsonKey(name: 'flavor_text') required this.flavorText,
      required this.language,
      required this.version});

  factory _$FlavorTextEntryImpl.fromJson(Map<String, dynamic> json) =>
      _$$FlavorTextEntryImplFromJson(json);

  @override
  @JsonKey(name: 'flavor_text')
  final String flavorText;
  @override
  final NamedApiResource language;
  @override
  final NamedApiResource version;

  @override
  String toString() {
    return 'FlavorTextEntry(flavorText: $flavorText, language: $language, version: $version)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FlavorTextEntryImpl &&
            (identical(other.flavorText, flavorText) ||
                other.flavorText == flavorText) &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.version, version) || other.version == version));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, flavorText, language, version);

  /// Create a copy of FlavorTextEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FlavorTextEntryImplCopyWith<_$FlavorTextEntryImpl> get copyWith =>
      __$$FlavorTextEntryImplCopyWithImpl<_$FlavorTextEntryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FlavorTextEntryImplToJson(
      this,
    );
  }
}

abstract class _FlavorTextEntry implements FlavorTextEntry {
  const factory _FlavorTextEntry(
      {@JsonKey(name: 'flavor_text') required final String flavorText,
      required final NamedApiResource language,
      required final NamedApiResource version}) = _$FlavorTextEntryImpl;

  factory _FlavorTextEntry.fromJson(Map<String, dynamic> json) =
      _$FlavorTextEntryImpl.fromJson;

  @override
  @JsonKey(name: 'flavor_text')
  String get flavorText;
  @override
  NamedApiResource get language;
  @override
  NamedApiResource get version;

  /// Create a copy of FlavorTextEntry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FlavorTextEntryImplCopyWith<_$FlavorTextEntryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SpeciesHabitat _$SpeciesHabitatFromJson(Map<String, dynamic> json) {
  return _SpeciesHabitat.fromJson(json);
}

/// @nodoc
mixin _$SpeciesHabitat {
  String get name => throw _privateConstructorUsedError;

  /// Serializes this SpeciesHabitat to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SpeciesHabitat
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SpeciesHabitatCopyWith<SpeciesHabitat> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SpeciesHabitatCopyWith<$Res> {
  factory $SpeciesHabitatCopyWith(
          SpeciesHabitat value, $Res Function(SpeciesHabitat) then) =
      _$SpeciesHabitatCopyWithImpl<$Res, SpeciesHabitat>;
  @useResult
  $Res call({String name});
}

/// @nodoc
class _$SpeciesHabitatCopyWithImpl<$Res, $Val extends SpeciesHabitat>
    implements $SpeciesHabitatCopyWith<$Res> {
  _$SpeciesHabitatCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SpeciesHabitat
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SpeciesHabitatImplCopyWith<$Res>
    implements $SpeciesHabitatCopyWith<$Res> {
  factory _$$SpeciesHabitatImplCopyWith(_$SpeciesHabitatImpl value,
          $Res Function(_$SpeciesHabitatImpl) then) =
      __$$SpeciesHabitatImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name});
}

/// @nodoc
class __$$SpeciesHabitatImplCopyWithImpl<$Res>
    extends _$SpeciesHabitatCopyWithImpl<$Res, _$SpeciesHabitatImpl>
    implements _$$SpeciesHabitatImplCopyWith<$Res> {
  __$$SpeciesHabitatImplCopyWithImpl(
      _$SpeciesHabitatImpl _value, $Res Function(_$SpeciesHabitatImpl) _then)
      : super(_value, _then);

  /// Create a copy of SpeciesHabitat
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
  }) {
    return _then(_$SpeciesHabitatImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SpeciesHabitatImpl implements _SpeciesHabitat {
  const _$SpeciesHabitatImpl({required this.name});

  factory _$SpeciesHabitatImpl.fromJson(Map<String, dynamic> json) =>
      _$$SpeciesHabitatImplFromJson(json);

  @override
  final String name;

  @override
  String toString() {
    return 'SpeciesHabitat(name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SpeciesHabitatImpl &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name);

  /// Create a copy of SpeciesHabitat
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SpeciesHabitatImplCopyWith<_$SpeciesHabitatImpl> get copyWith =>
      __$$SpeciesHabitatImplCopyWithImpl<_$SpeciesHabitatImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SpeciesHabitatImplToJson(
      this,
    );
  }
}

abstract class _SpeciesHabitat implements SpeciesHabitat {
  const factory _SpeciesHabitat({required final String name}) =
      _$SpeciesHabitatImpl;

  factory _SpeciesHabitat.fromJson(Map<String, dynamic> json) =
      _$SpeciesHabitatImpl.fromJson;

  @override
  String get name;

  /// Create a copy of SpeciesHabitat
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SpeciesHabitatImplCopyWith<_$SpeciesHabitatImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

NamedApiResource _$NamedApiResourceFromJson(Map<String, dynamic> json) {
  return _NamedApiResource.fromJson(json);
}

/// @nodoc
mixin _$NamedApiResource {
  String get name => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;

  /// Serializes this NamedApiResource to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NamedApiResource
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NamedApiResourceCopyWith<NamedApiResource> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NamedApiResourceCopyWith<$Res> {
  factory $NamedApiResourceCopyWith(
          NamedApiResource value, $Res Function(NamedApiResource) then) =
      _$NamedApiResourceCopyWithImpl<$Res, NamedApiResource>;
  @useResult
  $Res call({String name, String url});
}

/// @nodoc
class _$NamedApiResourceCopyWithImpl<$Res, $Val extends NamedApiResource>
    implements $NamedApiResourceCopyWith<$Res> {
  _$NamedApiResourceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NamedApiResource
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? url = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NamedApiResourceImplCopyWith<$Res>
    implements $NamedApiResourceCopyWith<$Res> {
  factory _$$NamedApiResourceImplCopyWith(_$NamedApiResourceImpl value,
          $Res Function(_$NamedApiResourceImpl) then) =
      __$$NamedApiResourceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String url});
}

/// @nodoc
class __$$NamedApiResourceImplCopyWithImpl<$Res>
    extends _$NamedApiResourceCopyWithImpl<$Res, _$NamedApiResourceImpl>
    implements _$$NamedApiResourceImplCopyWith<$Res> {
  __$$NamedApiResourceImplCopyWithImpl(_$NamedApiResourceImpl _value,
      $Res Function(_$NamedApiResourceImpl) _then)
      : super(_value, _then);

  /// Create a copy of NamedApiResource
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? url = null,
  }) {
    return _then(_$NamedApiResourceImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NamedApiResourceImpl implements _NamedApiResource {
  const _$NamedApiResourceImpl({required this.name, required this.url});

  factory _$NamedApiResourceImpl.fromJson(Map<String, dynamic> json) =>
      _$$NamedApiResourceImplFromJson(json);

  @override
  final String name;
  @override
  final String url;

  @override
  String toString() {
    return 'NamedApiResource(name: $name, url: $url)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NamedApiResourceImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, url);

  /// Create a copy of NamedApiResource
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NamedApiResourceImplCopyWith<_$NamedApiResourceImpl> get copyWith =>
      __$$NamedApiResourceImplCopyWithImpl<_$NamedApiResourceImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NamedApiResourceImplToJson(
      this,
    );
  }
}

abstract class _NamedApiResource implements NamedApiResource {
  const factory _NamedApiResource(
      {required final String name,
      required final String url}) = _$NamedApiResourceImpl;

  factory _NamedApiResource.fromJson(Map<String, dynamic> json) =
      _$NamedApiResourceImpl.fromJson;

  @override
  String get name;
  @override
  String get url;

  /// Create a copy of NamedApiResource
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NamedApiResourceImplCopyWith<_$NamedApiResourceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
