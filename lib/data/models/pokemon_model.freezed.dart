// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pokemon_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PokemonModel _$PokemonModelFromJson(Map<String, dynamic> json) {
  return _PokemonModel.fromJson(json);
}

/// @nodoc
mixin _$PokemonModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get height => throw _privateConstructorUsedError;
  int get weight => throw _privateConstructorUsedError;
  @JsonKey(name: 'base_experience')
  int get baseExperience => throw _privateConstructorUsedError;
  List<PokemonTypeSlot> get types => throw _privateConstructorUsedError;
  List<PokemonAbilitySlot> get abilities => throw _privateConstructorUsedError;
  List<PokemonStatModel> get stats => throw _privateConstructorUsedError;
  PokemonSpritesModel get sprites => throw _privateConstructorUsedError;

  /// Serializes this PokemonModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PokemonModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PokemonModelCopyWith<PokemonModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PokemonModelCopyWith<$Res> {
  factory $PokemonModelCopyWith(
          PokemonModel value, $Res Function(PokemonModel) then) =
      _$PokemonModelCopyWithImpl<$Res, PokemonModel>;
  @useResult
  $Res call(
      {int id,
      String name,
      int height,
      int weight,
      @JsonKey(name: 'base_experience') int baseExperience,
      List<PokemonTypeSlot> types,
      List<PokemonAbilitySlot> abilities,
      List<PokemonStatModel> stats,
      PokemonSpritesModel sprites});

  $PokemonSpritesModelCopyWith<$Res> get sprites;
}

/// @nodoc
class _$PokemonModelCopyWithImpl<$Res, $Val extends PokemonModel>
    implements $PokemonModelCopyWith<$Res> {
  _$PokemonModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PokemonModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? height = null,
    Object? weight = null,
    Object? baseExperience = null,
    Object? types = null,
    Object? abilities = null,
    Object? stats = null,
    Object? sprites = null,
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
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int,
      weight: null == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as int,
      baseExperience: null == baseExperience
          ? _value.baseExperience
          : baseExperience // ignore: cast_nullable_to_non_nullable
              as int,
      types: null == types
          ? _value.types
          : types // ignore: cast_nullable_to_non_nullable
              as List<PokemonTypeSlot>,
      abilities: null == abilities
          ? _value.abilities
          : abilities // ignore: cast_nullable_to_non_nullable
              as List<PokemonAbilitySlot>,
      stats: null == stats
          ? _value.stats
          : stats // ignore: cast_nullable_to_non_nullable
              as List<PokemonStatModel>,
      sprites: null == sprites
          ? _value.sprites
          : sprites // ignore: cast_nullable_to_non_nullable
              as PokemonSpritesModel,
    ) as $Val);
  }

  /// Create a copy of PokemonModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PokemonSpritesModelCopyWith<$Res> get sprites {
    return $PokemonSpritesModelCopyWith<$Res>(_value.sprites, (value) {
      return _then(_value.copyWith(sprites: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PokemonModelImplCopyWith<$Res>
    implements $PokemonModelCopyWith<$Res> {
  factory _$$PokemonModelImplCopyWith(
          _$PokemonModelImpl value, $Res Function(_$PokemonModelImpl) then) =
      __$$PokemonModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      int height,
      int weight,
      @JsonKey(name: 'base_experience') int baseExperience,
      List<PokemonTypeSlot> types,
      List<PokemonAbilitySlot> abilities,
      List<PokemonStatModel> stats,
      PokemonSpritesModel sprites});

  @override
  $PokemonSpritesModelCopyWith<$Res> get sprites;
}

/// @nodoc
class __$$PokemonModelImplCopyWithImpl<$Res>
    extends _$PokemonModelCopyWithImpl<$Res, _$PokemonModelImpl>
    implements _$$PokemonModelImplCopyWith<$Res> {
  __$$PokemonModelImplCopyWithImpl(
      _$PokemonModelImpl _value, $Res Function(_$PokemonModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of PokemonModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? height = null,
    Object? weight = null,
    Object? baseExperience = null,
    Object? types = null,
    Object? abilities = null,
    Object? stats = null,
    Object? sprites = null,
  }) {
    return _then(_$PokemonModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int,
      weight: null == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as int,
      baseExperience: null == baseExperience
          ? _value.baseExperience
          : baseExperience // ignore: cast_nullable_to_non_nullable
              as int,
      types: null == types
          ? _value._types
          : types // ignore: cast_nullable_to_non_nullable
              as List<PokemonTypeSlot>,
      abilities: null == abilities
          ? _value._abilities
          : abilities // ignore: cast_nullable_to_non_nullable
              as List<PokemonAbilitySlot>,
      stats: null == stats
          ? _value._stats
          : stats // ignore: cast_nullable_to_non_nullable
              as List<PokemonStatModel>,
      sprites: null == sprites
          ? _value.sprites
          : sprites // ignore: cast_nullable_to_non_nullable
              as PokemonSpritesModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PokemonModelImpl extends _PokemonModel {
  const _$PokemonModelImpl(
      {required this.id,
      required this.name,
      required this.height,
      required this.weight,
      @JsonKey(name: 'base_experience') required this.baseExperience,
      required final List<PokemonTypeSlot> types,
      required final List<PokemonAbilitySlot> abilities,
      required final List<PokemonStatModel> stats,
      required this.sprites})
      : _types = types,
        _abilities = abilities,
        _stats = stats,
        super._();

  factory _$PokemonModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PokemonModelImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final int height;
  @override
  final int weight;
  @override
  @JsonKey(name: 'base_experience')
  final int baseExperience;
  final List<PokemonTypeSlot> _types;
  @override
  List<PokemonTypeSlot> get types {
    if (_types is EqualUnmodifiableListView) return _types;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_types);
  }

  final List<PokemonAbilitySlot> _abilities;
  @override
  List<PokemonAbilitySlot> get abilities {
    if (_abilities is EqualUnmodifiableListView) return _abilities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_abilities);
  }

  final List<PokemonStatModel> _stats;
  @override
  List<PokemonStatModel> get stats {
    if (_stats is EqualUnmodifiableListView) return _stats;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_stats);
  }

  @override
  final PokemonSpritesModel sprites;

  @override
  String toString() {
    return 'PokemonModel(id: $id, name: $name, height: $height, weight: $weight, baseExperience: $baseExperience, types: $types, abilities: $abilities, stats: $stats, sprites: $sprites)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PokemonModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.weight, weight) || other.weight == weight) &&
            (identical(other.baseExperience, baseExperience) ||
                other.baseExperience == baseExperience) &&
            const DeepCollectionEquality().equals(other._types, _types) &&
            const DeepCollectionEquality()
                .equals(other._abilities, _abilities) &&
            const DeepCollectionEquality().equals(other._stats, _stats) &&
            (identical(other.sprites, sprites) || other.sprites == sprites));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      height,
      weight,
      baseExperience,
      const DeepCollectionEquality().hash(_types),
      const DeepCollectionEquality().hash(_abilities),
      const DeepCollectionEquality().hash(_stats),
      sprites);

  /// Create a copy of PokemonModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PokemonModelImplCopyWith<_$PokemonModelImpl> get copyWith =>
      __$$PokemonModelImplCopyWithImpl<_$PokemonModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PokemonModelImplToJson(
      this,
    );
  }
}

abstract class _PokemonModel extends PokemonModel {
  const factory _PokemonModel(
      {required final int id,
      required final String name,
      required final int height,
      required final int weight,
      @JsonKey(name: 'base_experience') required final int baseExperience,
      required final List<PokemonTypeSlot> types,
      required final List<PokemonAbilitySlot> abilities,
      required final List<PokemonStatModel> stats,
      required final PokemonSpritesModel sprites}) = _$PokemonModelImpl;
  const _PokemonModel._() : super._();

  factory _PokemonModel.fromJson(Map<String, dynamic> json) =
      _$PokemonModelImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  int get height;
  @override
  int get weight;
  @override
  @JsonKey(name: 'base_experience')
  int get baseExperience;
  @override
  List<PokemonTypeSlot> get types;
  @override
  List<PokemonAbilitySlot> get abilities;
  @override
  List<PokemonStatModel> get stats;
  @override
  PokemonSpritesModel get sprites;

  /// Create a copy of PokemonModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PokemonModelImplCopyWith<_$PokemonModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PokemonTypeSlot _$PokemonTypeSlotFromJson(Map<String, dynamic> json) {
  return _PokemonTypeSlot.fromJson(json);
}

/// @nodoc
mixin _$PokemonTypeSlot {
  int get slot => throw _privateConstructorUsedError;
  PokemonTypeInfo get type => throw _privateConstructorUsedError;

  /// Serializes this PokemonTypeSlot to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PokemonTypeSlot
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PokemonTypeSlotCopyWith<PokemonTypeSlot> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PokemonTypeSlotCopyWith<$Res> {
  factory $PokemonTypeSlotCopyWith(
          PokemonTypeSlot value, $Res Function(PokemonTypeSlot) then) =
      _$PokemonTypeSlotCopyWithImpl<$Res, PokemonTypeSlot>;
  @useResult
  $Res call({int slot, PokemonTypeInfo type});

  $PokemonTypeInfoCopyWith<$Res> get type;
}

/// @nodoc
class _$PokemonTypeSlotCopyWithImpl<$Res, $Val extends PokemonTypeSlot>
    implements $PokemonTypeSlotCopyWith<$Res> {
  _$PokemonTypeSlotCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PokemonTypeSlot
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? slot = null,
    Object? type = null,
  }) {
    return _then(_value.copyWith(
      slot: null == slot
          ? _value.slot
          : slot // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as PokemonTypeInfo,
    ) as $Val);
  }

  /// Create a copy of PokemonTypeSlot
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PokemonTypeInfoCopyWith<$Res> get type {
    return $PokemonTypeInfoCopyWith<$Res>(_value.type, (value) {
      return _then(_value.copyWith(type: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PokemonTypeSlotImplCopyWith<$Res>
    implements $PokemonTypeSlotCopyWith<$Res> {
  factory _$$PokemonTypeSlotImplCopyWith(_$PokemonTypeSlotImpl value,
          $Res Function(_$PokemonTypeSlotImpl) then) =
      __$$PokemonTypeSlotImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int slot, PokemonTypeInfo type});

  @override
  $PokemonTypeInfoCopyWith<$Res> get type;
}

/// @nodoc
class __$$PokemonTypeSlotImplCopyWithImpl<$Res>
    extends _$PokemonTypeSlotCopyWithImpl<$Res, _$PokemonTypeSlotImpl>
    implements _$$PokemonTypeSlotImplCopyWith<$Res> {
  __$$PokemonTypeSlotImplCopyWithImpl(
      _$PokemonTypeSlotImpl _value, $Res Function(_$PokemonTypeSlotImpl) _then)
      : super(_value, _then);

  /// Create a copy of PokemonTypeSlot
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? slot = null,
    Object? type = null,
  }) {
    return _then(_$PokemonTypeSlotImpl(
      slot: null == slot
          ? _value.slot
          : slot // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as PokemonTypeInfo,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PokemonTypeSlotImpl implements _PokemonTypeSlot {
  const _$PokemonTypeSlotImpl({required this.slot, required this.type});

  factory _$PokemonTypeSlotImpl.fromJson(Map<String, dynamic> json) =>
      _$$PokemonTypeSlotImplFromJson(json);

  @override
  final int slot;
  @override
  final PokemonTypeInfo type;

  @override
  String toString() {
    return 'PokemonTypeSlot(slot: $slot, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PokemonTypeSlotImpl &&
            (identical(other.slot, slot) || other.slot == slot) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, slot, type);

  /// Create a copy of PokemonTypeSlot
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PokemonTypeSlotImplCopyWith<_$PokemonTypeSlotImpl> get copyWith =>
      __$$PokemonTypeSlotImplCopyWithImpl<_$PokemonTypeSlotImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PokemonTypeSlotImplToJson(
      this,
    );
  }
}

abstract class _PokemonTypeSlot implements PokemonTypeSlot {
  const factory _PokemonTypeSlot(
      {required final int slot,
      required final PokemonTypeInfo type}) = _$PokemonTypeSlotImpl;

  factory _PokemonTypeSlot.fromJson(Map<String, dynamic> json) =
      _$PokemonTypeSlotImpl.fromJson;

  @override
  int get slot;
  @override
  PokemonTypeInfo get type;

  /// Create a copy of PokemonTypeSlot
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PokemonTypeSlotImplCopyWith<_$PokemonTypeSlotImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PokemonTypeInfo _$PokemonTypeInfoFromJson(Map<String, dynamic> json) {
  return _PokemonTypeInfo.fromJson(json);
}

/// @nodoc
mixin _$PokemonTypeInfo {
  String get name => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;

  /// Serializes this PokemonTypeInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PokemonTypeInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PokemonTypeInfoCopyWith<PokemonTypeInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PokemonTypeInfoCopyWith<$Res> {
  factory $PokemonTypeInfoCopyWith(
          PokemonTypeInfo value, $Res Function(PokemonTypeInfo) then) =
      _$PokemonTypeInfoCopyWithImpl<$Res, PokemonTypeInfo>;
  @useResult
  $Res call({String name, String url});
}

/// @nodoc
class _$PokemonTypeInfoCopyWithImpl<$Res, $Val extends PokemonTypeInfo>
    implements $PokemonTypeInfoCopyWith<$Res> {
  _$PokemonTypeInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PokemonTypeInfo
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
abstract class _$$PokemonTypeInfoImplCopyWith<$Res>
    implements $PokemonTypeInfoCopyWith<$Res> {
  factory _$$PokemonTypeInfoImplCopyWith(_$PokemonTypeInfoImpl value,
          $Res Function(_$PokemonTypeInfoImpl) then) =
      __$$PokemonTypeInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String url});
}

/// @nodoc
class __$$PokemonTypeInfoImplCopyWithImpl<$Res>
    extends _$PokemonTypeInfoCopyWithImpl<$Res, _$PokemonTypeInfoImpl>
    implements _$$PokemonTypeInfoImplCopyWith<$Res> {
  __$$PokemonTypeInfoImplCopyWithImpl(
      _$PokemonTypeInfoImpl _value, $Res Function(_$PokemonTypeInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of PokemonTypeInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? url = null,
  }) {
    return _then(_$PokemonTypeInfoImpl(
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
class _$PokemonTypeInfoImpl implements _PokemonTypeInfo {
  const _$PokemonTypeInfoImpl({required this.name, required this.url});

  factory _$PokemonTypeInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PokemonTypeInfoImplFromJson(json);

  @override
  final String name;
  @override
  final String url;

  @override
  String toString() {
    return 'PokemonTypeInfo(name: $name, url: $url)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PokemonTypeInfoImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, url);

  /// Create a copy of PokemonTypeInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PokemonTypeInfoImplCopyWith<_$PokemonTypeInfoImpl> get copyWith =>
      __$$PokemonTypeInfoImplCopyWithImpl<_$PokemonTypeInfoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PokemonTypeInfoImplToJson(
      this,
    );
  }
}

abstract class _PokemonTypeInfo implements PokemonTypeInfo {
  const factory _PokemonTypeInfo(
      {required final String name,
      required final String url}) = _$PokemonTypeInfoImpl;

  factory _PokemonTypeInfo.fromJson(Map<String, dynamic> json) =
      _$PokemonTypeInfoImpl.fromJson;

  @override
  String get name;
  @override
  String get url;

  /// Create a copy of PokemonTypeInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PokemonTypeInfoImplCopyWith<_$PokemonTypeInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PokemonAbilitySlot _$PokemonAbilitySlotFromJson(Map<String, dynamic> json) {
  return _PokemonAbilitySlot.fromJson(json);
}

/// @nodoc
mixin _$PokemonAbilitySlot {
  int get slot => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_hidden')
  bool get isHidden => throw _privateConstructorUsedError;
  PokemonAbilityInfo get ability => throw _privateConstructorUsedError;

  /// Serializes this PokemonAbilitySlot to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PokemonAbilitySlot
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PokemonAbilitySlotCopyWith<PokemonAbilitySlot> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PokemonAbilitySlotCopyWith<$Res> {
  factory $PokemonAbilitySlotCopyWith(
          PokemonAbilitySlot value, $Res Function(PokemonAbilitySlot) then) =
      _$PokemonAbilitySlotCopyWithImpl<$Res, PokemonAbilitySlot>;
  @useResult
  $Res call(
      {int slot,
      @JsonKey(name: 'is_hidden') bool isHidden,
      PokemonAbilityInfo ability});

  $PokemonAbilityInfoCopyWith<$Res> get ability;
}

/// @nodoc
class _$PokemonAbilitySlotCopyWithImpl<$Res, $Val extends PokemonAbilitySlot>
    implements $PokemonAbilitySlotCopyWith<$Res> {
  _$PokemonAbilitySlotCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PokemonAbilitySlot
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? slot = null,
    Object? isHidden = null,
    Object? ability = null,
  }) {
    return _then(_value.copyWith(
      slot: null == slot
          ? _value.slot
          : slot // ignore: cast_nullable_to_non_nullable
              as int,
      isHidden: null == isHidden
          ? _value.isHidden
          : isHidden // ignore: cast_nullable_to_non_nullable
              as bool,
      ability: null == ability
          ? _value.ability
          : ability // ignore: cast_nullable_to_non_nullable
              as PokemonAbilityInfo,
    ) as $Val);
  }

  /// Create a copy of PokemonAbilitySlot
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PokemonAbilityInfoCopyWith<$Res> get ability {
    return $PokemonAbilityInfoCopyWith<$Res>(_value.ability, (value) {
      return _then(_value.copyWith(ability: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PokemonAbilitySlotImplCopyWith<$Res>
    implements $PokemonAbilitySlotCopyWith<$Res> {
  factory _$$PokemonAbilitySlotImplCopyWith(_$PokemonAbilitySlotImpl value,
          $Res Function(_$PokemonAbilitySlotImpl) then) =
      __$$PokemonAbilitySlotImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int slot,
      @JsonKey(name: 'is_hidden') bool isHidden,
      PokemonAbilityInfo ability});

  @override
  $PokemonAbilityInfoCopyWith<$Res> get ability;
}

/// @nodoc
class __$$PokemonAbilitySlotImplCopyWithImpl<$Res>
    extends _$PokemonAbilitySlotCopyWithImpl<$Res, _$PokemonAbilitySlotImpl>
    implements _$$PokemonAbilitySlotImplCopyWith<$Res> {
  __$$PokemonAbilitySlotImplCopyWithImpl(_$PokemonAbilitySlotImpl _value,
      $Res Function(_$PokemonAbilitySlotImpl) _then)
      : super(_value, _then);

  /// Create a copy of PokemonAbilitySlot
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? slot = null,
    Object? isHidden = null,
    Object? ability = null,
  }) {
    return _then(_$PokemonAbilitySlotImpl(
      slot: null == slot
          ? _value.slot
          : slot // ignore: cast_nullable_to_non_nullable
              as int,
      isHidden: null == isHidden
          ? _value.isHidden
          : isHidden // ignore: cast_nullable_to_non_nullable
              as bool,
      ability: null == ability
          ? _value.ability
          : ability // ignore: cast_nullable_to_non_nullable
              as PokemonAbilityInfo,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PokemonAbilitySlotImpl implements _PokemonAbilitySlot {
  const _$PokemonAbilitySlotImpl(
      {required this.slot,
      @JsonKey(name: 'is_hidden') required this.isHidden,
      required this.ability});

  factory _$PokemonAbilitySlotImpl.fromJson(Map<String, dynamic> json) =>
      _$$PokemonAbilitySlotImplFromJson(json);

  @override
  final int slot;
  @override
  @JsonKey(name: 'is_hidden')
  final bool isHidden;
  @override
  final PokemonAbilityInfo ability;

  @override
  String toString() {
    return 'PokemonAbilitySlot(slot: $slot, isHidden: $isHidden, ability: $ability)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PokemonAbilitySlotImpl &&
            (identical(other.slot, slot) || other.slot == slot) &&
            (identical(other.isHidden, isHidden) ||
                other.isHidden == isHidden) &&
            (identical(other.ability, ability) || other.ability == ability));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, slot, isHidden, ability);

  /// Create a copy of PokemonAbilitySlot
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PokemonAbilitySlotImplCopyWith<_$PokemonAbilitySlotImpl> get copyWith =>
      __$$PokemonAbilitySlotImplCopyWithImpl<_$PokemonAbilitySlotImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PokemonAbilitySlotImplToJson(
      this,
    );
  }
}

abstract class _PokemonAbilitySlot implements PokemonAbilitySlot {
  const factory _PokemonAbilitySlot(
      {required final int slot,
      @JsonKey(name: 'is_hidden') required final bool isHidden,
      required final PokemonAbilityInfo ability}) = _$PokemonAbilitySlotImpl;

  factory _PokemonAbilitySlot.fromJson(Map<String, dynamic> json) =
      _$PokemonAbilitySlotImpl.fromJson;

  @override
  int get slot;
  @override
  @JsonKey(name: 'is_hidden')
  bool get isHidden;
  @override
  PokemonAbilityInfo get ability;

  /// Create a copy of PokemonAbilitySlot
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PokemonAbilitySlotImplCopyWith<_$PokemonAbilitySlotImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PokemonAbilityInfo _$PokemonAbilityInfoFromJson(Map<String, dynamic> json) {
  return _PokemonAbilityInfo.fromJson(json);
}

/// @nodoc
mixin _$PokemonAbilityInfo {
  String get name => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;

  /// Serializes this PokemonAbilityInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PokemonAbilityInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PokemonAbilityInfoCopyWith<PokemonAbilityInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PokemonAbilityInfoCopyWith<$Res> {
  factory $PokemonAbilityInfoCopyWith(
          PokemonAbilityInfo value, $Res Function(PokemonAbilityInfo) then) =
      _$PokemonAbilityInfoCopyWithImpl<$Res, PokemonAbilityInfo>;
  @useResult
  $Res call({String name, String url});
}

/// @nodoc
class _$PokemonAbilityInfoCopyWithImpl<$Res, $Val extends PokemonAbilityInfo>
    implements $PokemonAbilityInfoCopyWith<$Res> {
  _$PokemonAbilityInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PokemonAbilityInfo
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
abstract class _$$PokemonAbilityInfoImplCopyWith<$Res>
    implements $PokemonAbilityInfoCopyWith<$Res> {
  factory _$$PokemonAbilityInfoImplCopyWith(_$PokemonAbilityInfoImpl value,
          $Res Function(_$PokemonAbilityInfoImpl) then) =
      __$$PokemonAbilityInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String url});
}

/// @nodoc
class __$$PokemonAbilityInfoImplCopyWithImpl<$Res>
    extends _$PokemonAbilityInfoCopyWithImpl<$Res, _$PokemonAbilityInfoImpl>
    implements _$$PokemonAbilityInfoImplCopyWith<$Res> {
  __$$PokemonAbilityInfoImplCopyWithImpl(_$PokemonAbilityInfoImpl _value,
      $Res Function(_$PokemonAbilityInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of PokemonAbilityInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? url = null,
  }) {
    return _then(_$PokemonAbilityInfoImpl(
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
class _$PokemonAbilityInfoImpl implements _PokemonAbilityInfo {
  const _$PokemonAbilityInfoImpl({required this.name, required this.url});

  factory _$PokemonAbilityInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PokemonAbilityInfoImplFromJson(json);

  @override
  final String name;
  @override
  final String url;

  @override
  String toString() {
    return 'PokemonAbilityInfo(name: $name, url: $url)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PokemonAbilityInfoImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, url);

  /// Create a copy of PokemonAbilityInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PokemonAbilityInfoImplCopyWith<_$PokemonAbilityInfoImpl> get copyWith =>
      __$$PokemonAbilityInfoImplCopyWithImpl<_$PokemonAbilityInfoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PokemonAbilityInfoImplToJson(
      this,
    );
  }
}

abstract class _PokemonAbilityInfo implements PokemonAbilityInfo {
  const factory _PokemonAbilityInfo(
      {required final String name,
      required final String url}) = _$PokemonAbilityInfoImpl;

  factory _PokemonAbilityInfo.fromJson(Map<String, dynamic> json) =
      _$PokemonAbilityInfoImpl.fromJson;

  @override
  String get name;
  @override
  String get url;

  /// Create a copy of PokemonAbilityInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PokemonAbilityInfoImplCopyWith<_$PokemonAbilityInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PokemonStatModel _$PokemonStatModelFromJson(Map<String, dynamic> json) {
  return _PokemonStatModel.fromJson(json);
}

/// @nodoc
mixin _$PokemonStatModel {
  @JsonKey(name: 'base_stat')
  int get baseStat => throw _privateConstructorUsedError;
  int get effort => throw _privateConstructorUsedError;
  PokemonStatInfo get stat => throw _privateConstructorUsedError;

  /// Serializes this PokemonStatModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PokemonStatModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PokemonStatModelCopyWith<PokemonStatModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PokemonStatModelCopyWith<$Res> {
  factory $PokemonStatModelCopyWith(
          PokemonStatModel value, $Res Function(PokemonStatModel) then) =
      _$PokemonStatModelCopyWithImpl<$Res, PokemonStatModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'base_stat') int baseStat,
      int effort,
      PokemonStatInfo stat});

  $PokemonStatInfoCopyWith<$Res> get stat;
}

/// @nodoc
class _$PokemonStatModelCopyWithImpl<$Res, $Val extends PokemonStatModel>
    implements $PokemonStatModelCopyWith<$Res> {
  _$PokemonStatModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PokemonStatModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? baseStat = null,
    Object? effort = null,
    Object? stat = null,
  }) {
    return _then(_value.copyWith(
      baseStat: null == baseStat
          ? _value.baseStat
          : baseStat // ignore: cast_nullable_to_non_nullable
              as int,
      effort: null == effort
          ? _value.effort
          : effort // ignore: cast_nullable_to_non_nullable
              as int,
      stat: null == stat
          ? _value.stat
          : stat // ignore: cast_nullable_to_non_nullable
              as PokemonStatInfo,
    ) as $Val);
  }

  /// Create a copy of PokemonStatModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PokemonStatInfoCopyWith<$Res> get stat {
    return $PokemonStatInfoCopyWith<$Res>(_value.stat, (value) {
      return _then(_value.copyWith(stat: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PokemonStatModelImplCopyWith<$Res>
    implements $PokemonStatModelCopyWith<$Res> {
  factory _$$PokemonStatModelImplCopyWith(_$PokemonStatModelImpl value,
          $Res Function(_$PokemonStatModelImpl) then) =
      __$$PokemonStatModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'base_stat') int baseStat,
      int effort,
      PokemonStatInfo stat});

  @override
  $PokemonStatInfoCopyWith<$Res> get stat;
}

/// @nodoc
class __$$PokemonStatModelImplCopyWithImpl<$Res>
    extends _$PokemonStatModelCopyWithImpl<$Res, _$PokemonStatModelImpl>
    implements _$$PokemonStatModelImplCopyWith<$Res> {
  __$$PokemonStatModelImplCopyWithImpl(_$PokemonStatModelImpl _value,
      $Res Function(_$PokemonStatModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of PokemonStatModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? baseStat = null,
    Object? effort = null,
    Object? stat = null,
  }) {
    return _then(_$PokemonStatModelImpl(
      baseStat: null == baseStat
          ? _value.baseStat
          : baseStat // ignore: cast_nullable_to_non_nullable
              as int,
      effort: null == effort
          ? _value.effort
          : effort // ignore: cast_nullable_to_non_nullable
              as int,
      stat: null == stat
          ? _value.stat
          : stat // ignore: cast_nullable_to_non_nullable
              as PokemonStatInfo,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PokemonStatModelImpl implements _PokemonStatModel {
  const _$PokemonStatModelImpl(
      {@JsonKey(name: 'base_stat') required this.baseStat,
      required this.effort,
      required this.stat});

  factory _$PokemonStatModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PokemonStatModelImplFromJson(json);

  @override
  @JsonKey(name: 'base_stat')
  final int baseStat;
  @override
  final int effort;
  @override
  final PokemonStatInfo stat;

  @override
  String toString() {
    return 'PokemonStatModel(baseStat: $baseStat, effort: $effort, stat: $stat)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PokemonStatModelImpl &&
            (identical(other.baseStat, baseStat) ||
                other.baseStat == baseStat) &&
            (identical(other.effort, effort) || other.effort == effort) &&
            (identical(other.stat, stat) || other.stat == stat));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, baseStat, effort, stat);

  /// Create a copy of PokemonStatModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PokemonStatModelImplCopyWith<_$PokemonStatModelImpl> get copyWith =>
      __$$PokemonStatModelImplCopyWithImpl<_$PokemonStatModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PokemonStatModelImplToJson(
      this,
    );
  }
}

abstract class _PokemonStatModel implements PokemonStatModel {
  const factory _PokemonStatModel(
      {@JsonKey(name: 'base_stat') required final int baseStat,
      required final int effort,
      required final PokemonStatInfo stat}) = _$PokemonStatModelImpl;

  factory _PokemonStatModel.fromJson(Map<String, dynamic> json) =
      _$PokemonStatModelImpl.fromJson;

  @override
  @JsonKey(name: 'base_stat')
  int get baseStat;
  @override
  int get effort;
  @override
  PokemonStatInfo get stat;

  /// Create a copy of PokemonStatModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PokemonStatModelImplCopyWith<_$PokemonStatModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PokemonStatInfo _$PokemonStatInfoFromJson(Map<String, dynamic> json) {
  return _PokemonStatInfo.fromJson(json);
}

/// @nodoc
mixin _$PokemonStatInfo {
  String get name => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;

  /// Serializes this PokemonStatInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PokemonStatInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PokemonStatInfoCopyWith<PokemonStatInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PokemonStatInfoCopyWith<$Res> {
  factory $PokemonStatInfoCopyWith(
          PokemonStatInfo value, $Res Function(PokemonStatInfo) then) =
      _$PokemonStatInfoCopyWithImpl<$Res, PokemonStatInfo>;
  @useResult
  $Res call({String name, String url});
}

/// @nodoc
class _$PokemonStatInfoCopyWithImpl<$Res, $Val extends PokemonStatInfo>
    implements $PokemonStatInfoCopyWith<$Res> {
  _$PokemonStatInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PokemonStatInfo
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
abstract class _$$PokemonStatInfoImplCopyWith<$Res>
    implements $PokemonStatInfoCopyWith<$Res> {
  factory _$$PokemonStatInfoImplCopyWith(_$PokemonStatInfoImpl value,
          $Res Function(_$PokemonStatInfoImpl) then) =
      __$$PokemonStatInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String url});
}

/// @nodoc
class __$$PokemonStatInfoImplCopyWithImpl<$Res>
    extends _$PokemonStatInfoCopyWithImpl<$Res, _$PokemonStatInfoImpl>
    implements _$$PokemonStatInfoImplCopyWith<$Res> {
  __$$PokemonStatInfoImplCopyWithImpl(
      _$PokemonStatInfoImpl _value, $Res Function(_$PokemonStatInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of PokemonStatInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? url = null,
  }) {
    return _then(_$PokemonStatInfoImpl(
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
class _$PokemonStatInfoImpl implements _PokemonStatInfo {
  const _$PokemonStatInfoImpl({required this.name, required this.url});

  factory _$PokemonStatInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PokemonStatInfoImplFromJson(json);

  @override
  final String name;
  @override
  final String url;

  @override
  String toString() {
    return 'PokemonStatInfo(name: $name, url: $url)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PokemonStatInfoImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, url);

  /// Create a copy of PokemonStatInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PokemonStatInfoImplCopyWith<_$PokemonStatInfoImpl> get copyWith =>
      __$$PokemonStatInfoImplCopyWithImpl<_$PokemonStatInfoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PokemonStatInfoImplToJson(
      this,
    );
  }
}

abstract class _PokemonStatInfo implements PokemonStatInfo {
  const factory _PokemonStatInfo(
      {required final String name,
      required final String url}) = _$PokemonStatInfoImpl;

  factory _PokemonStatInfo.fromJson(Map<String, dynamic> json) =
      _$PokemonStatInfoImpl.fromJson;

  @override
  String get name;
  @override
  String get url;

  /// Create a copy of PokemonStatInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PokemonStatInfoImplCopyWith<_$PokemonStatInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PokemonSpritesModel _$PokemonSpritesModelFromJson(Map<String, dynamic> json) {
  return _PokemonSpritesModel.fromJson(json);
}

/// @nodoc
mixin _$PokemonSpritesModel {
  @JsonKey(name: 'front_default')
  String get frontDefault => throw _privateConstructorUsedError;
  @JsonKey(name: 'front_shiny')
  String? get frontShiny => throw _privateConstructorUsedError;
  @JsonKey(name: 'back_default')
  String? get backDefault => throw _privateConstructorUsedError;
  @JsonKey(name: 'back_shiny')
  String? get backShiny => throw _privateConstructorUsedError;
  PokemonOtherSprites? get other => throw _privateConstructorUsedError;

  /// Serializes this PokemonSpritesModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PokemonSpritesModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PokemonSpritesModelCopyWith<PokemonSpritesModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PokemonSpritesModelCopyWith<$Res> {
  factory $PokemonSpritesModelCopyWith(
          PokemonSpritesModel value, $Res Function(PokemonSpritesModel) then) =
      _$PokemonSpritesModelCopyWithImpl<$Res, PokemonSpritesModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'front_default') String frontDefault,
      @JsonKey(name: 'front_shiny') String? frontShiny,
      @JsonKey(name: 'back_default') String? backDefault,
      @JsonKey(name: 'back_shiny') String? backShiny,
      PokemonOtherSprites? other});

  $PokemonOtherSpritesCopyWith<$Res>? get other;
}

/// @nodoc
class _$PokemonSpritesModelCopyWithImpl<$Res, $Val extends PokemonSpritesModel>
    implements $PokemonSpritesModelCopyWith<$Res> {
  _$PokemonSpritesModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PokemonSpritesModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? frontDefault = null,
    Object? frontShiny = freezed,
    Object? backDefault = freezed,
    Object? backShiny = freezed,
    Object? other = freezed,
  }) {
    return _then(_value.copyWith(
      frontDefault: null == frontDefault
          ? _value.frontDefault
          : frontDefault // ignore: cast_nullable_to_non_nullable
              as String,
      frontShiny: freezed == frontShiny
          ? _value.frontShiny
          : frontShiny // ignore: cast_nullable_to_non_nullable
              as String?,
      backDefault: freezed == backDefault
          ? _value.backDefault
          : backDefault // ignore: cast_nullable_to_non_nullable
              as String?,
      backShiny: freezed == backShiny
          ? _value.backShiny
          : backShiny // ignore: cast_nullable_to_non_nullable
              as String?,
      other: freezed == other
          ? _value.other
          : other // ignore: cast_nullable_to_non_nullable
              as PokemonOtherSprites?,
    ) as $Val);
  }

  /// Create a copy of PokemonSpritesModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PokemonOtherSpritesCopyWith<$Res>? get other {
    if (_value.other == null) {
      return null;
    }

    return $PokemonOtherSpritesCopyWith<$Res>(_value.other!, (value) {
      return _then(_value.copyWith(other: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PokemonSpritesModelImplCopyWith<$Res>
    implements $PokemonSpritesModelCopyWith<$Res> {
  factory _$$PokemonSpritesModelImplCopyWith(_$PokemonSpritesModelImpl value,
          $Res Function(_$PokemonSpritesModelImpl) then) =
      __$$PokemonSpritesModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'front_default') String frontDefault,
      @JsonKey(name: 'front_shiny') String? frontShiny,
      @JsonKey(name: 'back_default') String? backDefault,
      @JsonKey(name: 'back_shiny') String? backShiny,
      PokemonOtherSprites? other});

  @override
  $PokemonOtherSpritesCopyWith<$Res>? get other;
}

/// @nodoc
class __$$PokemonSpritesModelImplCopyWithImpl<$Res>
    extends _$PokemonSpritesModelCopyWithImpl<$Res, _$PokemonSpritesModelImpl>
    implements _$$PokemonSpritesModelImplCopyWith<$Res> {
  __$$PokemonSpritesModelImplCopyWithImpl(_$PokemonSpritesModelImpl _value,
      $Res Function(_$PokemonSpritesModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of PokemonSpritesModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? frontDefault = null,
    Object? frontShiny = freezed,
    Object? backDefault = freezed,
    Object? backShiny = freezed,
    Object? other = freezed,
  }) {
    return _then(_$PokemonSpritesModelImpl(
      frontDefault: null == frontDefault
          ? _value.frontDefault
          : frontDefault // ignore: cast_nullable_to_non_nullable
              as String,
      frontShiny: freezed == frontShiny
          ? _value.frontShiny
          : frontShiny // ignore: cast_nullable_to_non_nullable
              as String?,
      backDefault: freezed == backDefault
          ? _value.backDefault
          : backDefault // ignore: cast_nullable_to_non_nullable
              as String?,
      backShiny: freezed == backShiny
          ? _value.backShiny
          : backShiny // ignore: cast_nullable_to_non_nullable
              as String?,
      other: freezed == other
          ? _value.other
          : other // ignore: cast_nullable_to_non_nullable
              as PokemonOtherSprites?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PokemonSpritesModelImpl implements _PokemonSpritesModel {
  const _$PokemonSpritesModelImpl(
      {@JsonKey(name: 'front_default') required this.frontDefault,
      @JsonKey(name: 'front_shiny') this.frontShiny,
      @JsonKey(name: 'back_default') this.backDefault,
      @JsonKey(name: 'back_shiny') this.backShiny,
      this.other});

  factory _$PokemonSpritesModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PokemonSpritesModelImplFromJson(json);

  @override
  @JsonKey(name: 'front_default')
  final String frontDefault;
  @override
  @JsonKey(name: 'front_shiny')
  final String? frontShiny;
  @override
  @JsonKey(name: 'back_default')
  final String? backDefault;
  @override
  @JsonKey(name: 'back_shiny')
  final String? backShiny;
  @override
  final PokemonOtherSprites? other;

  @override
  String toString() {
    return 'PokemonSpritesModel(frontDefault: $frontDefault, frontShiny: $frontShiny, backDefault: $backDefault, backShiny: $backShiny, other: $other)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PokemonSpritesModelImpl &&
            (identical(other.frontDefault, frontDefault) ||
                other.frontDefault == frontDefault) &&
            (identical(other.frontShiny, frontShiny) ||
                other.frontShiny == frontShiny) &&
            (identical(other.backDefault, backDefault) ||
                other.backDefault == backDefault) &&
            (identical(other.backShiny, backShiny) ||
                other.backShiny == backShiny) &&
            (identical(other.other, this.other) || other.other == this.other));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, frontDefault, frontShiny, backDefault, backShiny, other);

  /// Create a copy of PokemonSpritesModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PokemonSpritesModelImplCopyWith<_$PokemonSpritesModelImpl> get copyWith =>
      __$$PokemonSpritesModelImplCopyWithImpl<_$PokemonSpritesModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PokemonSpritesModelImplToJson(
      this,
    );
  }
}

abstract class _PokemonSpritesModel implements PokemonSpritesModel {
  const factory _PokemonSpritesModel(
      {@JsonKey(name: 'front_default') required final String frontDefault,
      @JsonKey(name: 'front_shiny') final String? frontShiny,
      @JsonKey(name: 'back_default') final String? backDefault,
      @JsonKey(name: 'back_shiny') final String? backShiny,
      final PokemonOtherSprites? other}) = _$PokemonSpritesModelImpl;

  factory _PokemonSpritesModel.fromJson(Map<String, dynamic> json) =
      _$PokemonSpritesModelImpl.fromJson;

  @override
  @JsonKey(name: 'front_default')
  String get frontDefault;
  @override
  @JsonKey(name: 'front_shiny')
  String? get frontShiny;
  @override
  @JsonKey(name: 'back_default')
  String? get backDefault;
  @override
  @JsonKey(name: 'back_shiny')
  String? get backShiny;
  @override
  PokemonOtherSprites? get other;

  /// Create a copy of PokemonSpritesModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PokemonSpritesModelImplCopyWith<_$PokemonSpritesModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PokemonOtherSprites _$PokemonOtherSpritesFromJson(Map<String, dynamic> json) {
  return _PokemonOtherSprites.fromJson(json);
}

/// @nodoc
mixin _$PokemonOtherSprites {
  @JsonKey(name: 'official-artwork')
  OfficialArtwork? get officialArtwork => throw _privateConstructorUsedError;

  /// Serializes this PokemonOtherSprites to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PokemonOtherSprites
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PokemonOtherSpritesCopyWith<PokemonOtherSprites> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PokemonOtherSpritesCopyWith<$Res> {
  factory $PokemonOtherSpritesCopyWith(
          PokemonOtherSprites value, $Res Function(PokemonOtherSprites) then) =
      _$PokemonOtherSpritesCopyWithImpl<$Res, PokemonOtherSprites>;
  @useResult
  $Res call(
      {@JsonKey(name: 'official-artwork') OfficialArtwork? officialArtwork});

  $OfficialArtworkCopyWith<$Res>? get officialArtwork;
}

/// @nodoc
class _$PokemonOtherSpritesCopyWithImpl<$Res, $Val extends PokemonOtherSprites>
    implements $PokemonOtherSpritesCopyWith<$Res> {
  _$PokemonOtherSpritesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PokemonOtherSprites
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? officialArtwork = freezed,
  }) {
    return _then(_value.copyWith(
      officialArtwork: freezed == officialArtwork
          ? _value.officialArtwork
          : officialArtwork // ignore: cast_nullable_to_non_nullable
              as OfficialArtwork?,
    ) as $Val);
  }

  /// Create a copy of PokemonOtherSprites
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OfficialArtworkCopyWith<$Res>? get officialArtwork {
    if (_value.officialArtwork == null) {
      return null;
    }

    return $OfficialArtworkCopyWith<$Res>(_value.officialArtwork!, (value) {
      return _then(_value.copyWith(officialArtwork: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PokemonOtherSpritesImplCopyWith<$Res>
    implements $PokemonOtherSpritesCopyWith<$Res> {
  factory _$$PokemonOtherSpritesImplCopyWith(_$PokemonOtherSpritesImpl value,
          $Res Function(_$PokemonOtherSpritesImpl) then) =
      __$$PokemonOtherSpritesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'official-artwork') OfficialArtwork? officialArtwork});

  @override
  $OfficialArtworkCopyWith<$Res>? get officialArtwork;
}

/// @nodoc
class __$$PokemonOtherSpritesImplCopyWithImpl<$Res>
    extends _$PokemonOtherSpritesCopyWithImpl<$Res, _$PokemonOtherSpritesImpl>
    implements _$$PokemonOtherSpritesImplCopyWith<$Res> {
  __$$PokemonOtherSpritesImplCopyWithImpl(_$PokemonOtherSpritesImpl _value,
      $Res Function(_$PokemonOtherSpritesImpl) _then)
      : super(_value, _then);

  /// Create a copy of PokemonOtherSprites
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? officialArtwork = freezed,
  }) {
    return _then(_$PokemonOtherSpritesImpl(
      officialArtwork: freezed == officialArtwork
          ? _value.officialArtwork
          : officialArtwork // ignore: cast_nullable_to_non_nullable
              as OfficialArtwork?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PokemonOtherSpritesImpl implements _PokemonOtherSprites {
  const _$PokemonOtherSpritesImpl(
      {@JsonKey(name: 'official-artwork') this.officialArtwork});

  factory _$PokemonOtherSpritesImpl.fromJson(Map<String, dynamic> json) =>
      _$$PokemonOtherSpritesImplFromJson(json);

  @override
  @JsonKey(name: 'official-artwork')
  final OfficialArtwork? officialArtwork;

  @override
  String toString() {
    return 'PokemonOtherSprites(officialArtwork: $officialArtwork)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PokemonOtherSpritesImpl &&
            (identical(other.officialArtwork, officialArtwork) ||
                other.officialArtwork == officialArtwork));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, officialArtwork);

  /// Create a copy of PokemonOtherSprites
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PokemonOtherSpritesImplCopyWith<_$PokemonOtherSpritesImpl> get copyWith =>
      __$$PokemonOtherSpritesImplCopyWithImpl<_$PokemonOtherSpritesImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PokemonOtherSpritesImplToJson(
      this,
    );
  }
}

abstract class _PokemonOtherSprites implements PokemonOtherSprites {
  const factory _PokemonOtherSprites(
      {@JsonKey(name: 'official-artwork')
      final OfficialArtwork? officialArtwork}) = _$PokemonOtherSpritesImpl;

  factory _PokemonOtherSprites.fromJson(Map<String, dynamic> json) =
      _$PokemonOtherSpritesImpl.fromJson;

  @override
  @JsonKey(name: 'official-artwork')
  OfficialArtwork? get officialArtwork;

  /// Create a copy of PokemonOtherSprites
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PokemonOtherSpritesImplCopyWith<_$PokemonOtherSpritesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OfficialArtwork _$OfficialArtworkFromJson(Map<String, dynamic> json) {
  return _OfficialArtwork.fromJson(json);
}

/// @nodoc
mixin _$OfficialArtwork {
  @JsonKey(name: 'front_default')
  String? get frontDefault => throw _privateConstructorUsedError;

  /// Serializes this OfficialArtwork to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OfficialArtwork
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OfficialArtworkCopyWith<OfficialArtwork> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OfficialArtworkCopyWith<$Res> {
  factory $OfficialArtworkCopyWith(
          OfficialArtwork value, $Res Function(OfficialArtwork) then) =
      _$OfficialArtworkCopyWithImpl<$Res, OfficialArtwork>;
  @useResult
  $Res call({@JsonKey(name: 'front_default') String? frontDefault});
}

/// @nodoc
class _$OfficialArtworkCopyWithImpl<$Res, $Val extends OfficialArtwork>
    implements $OfficialArtworkCopyWith<$Res> {
  _$OfficialArtworkCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OfficialArtwork
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? frontDefault = freezed,
  }) {
    return _then(_value.copyWith(
      frontDefault: freezed == frontDefault
          ? _value.frontDefault
          : frontDefault // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OfficialArtworkImplCopyWith<$Res>
    implements $OfficialArtworkCopyWith<$Res> {
  factory _$$OfficialArtworkImplCopyWith(_$OfficialArtworkImpl value,
          $Res Function(_$OfficialArtworkImpl) then) =
      __$$OfficialArtworkImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'front_default') String? frontDefault});
}

/// @nodoc
class __$$OfficialArtworkImplCopyWithImpl<$Res>
    extends _$OfficialArtworkCopyWithImpl<$Res, _$OfficialArtworkImpl>
    implements _$$OfficialArtworkImplCopyWith<$Res> {
  __$$OfficialArtworkImplCopyWithImpl(
      _$OfficialArtworkImpl _value, $Res Function(_$OfficialArtworkImpl) _then)
      : super(_value, _then);

  /// Create a copy of OfficialArtwork
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? frontDefault = freezed,
  }) {
    return _then(_$OfficialArtworkImpl(
      frontDefault: freezed == frontDefault
          ? _value.frontDefault
          : frontDefault // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OfficialArtworkImpl implements _OfficialArtwork {
  const _$OfficialArtworkImpl(
      {@JsonKey(name: 'front_default') this.frontDefault});

  factory _$OfficialArtworkImpl.fromJson(Map<String, dynamic> json) =>
      _$$OfficialArtworkImplFromJson(json);

  @override
  @JsonKey(name: 'front_default')
  final String? frontDefault;

  @override
  String toString() {
    return 'OfficialArtwork(frontDefault: $frontDefault)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OfficialArtworkImpl &&
            (identical(other.frontDefault, frontDefault) ||
                other.frontDefault == frontDefault));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, frontDefault);

  /// Create a copy of OfficialArtwork
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OfficialArtworkImplCopyWith<_$OfficialArtworkImpl> get copyWith =>
      __$$OfficialArtworkImplCopyWithImpl<_$OfficialArtworkImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OfficialArtworkImplToJson(
      this,
    );
  }
}

abstract class _OfficialArtwork implements OfficialArtwork {
  const factory _OfficialArtwork(
          {@JsonKey(name: 'front_default') final String? frontDefault}) =
      _$OfficialArtworkImpl;

  factory _OfficialArtwork.fromJson(Map<String, dynamic> json) =
      _$OfficialArtworkImpl.fromJson;

  @override
  @JsonKey(name: 'front_default')
  String? get frontDefault;

  /// Create a copy of OfficialArtwork
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OfficialArtworkImplCopyWith<_$OfficialArtworkImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
