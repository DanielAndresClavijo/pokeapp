import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokeapp/domain/entities/pokemon_list_item.dart';

part 'pokemon_list_response_model.freezed.dart';
part 'pokemon_list_response_model.g.dart';

/// Pokemon list response from API
@freezed
class PokemonListResponseModel with _$PokemonListResponseModel {
  const factory PokemonListResponseModel({
    required int count,
    String? next,
    String? previous,
    required List<PokemonListItemModel> results,
  }) = _PokemonListResponseModel;

  factory PokemonListResponseModel.fromJson(Map<String, dynamic> json) =>
      _$PokemonListResponseModelFromJson(json);
}

/// Pokemon list item model
@freezed
class PokemonListItemModel with _$PokemonListItemModel {
  const PokemonListItemModel._();

  const factory PokemonListItemModel({
    required String name,
    required String url,
  }) = _PokemonListItemModel;

  factory PokemonListItemModel.fromJson(Map<String, dynamic> json) =>
      _$PokemonListItemModelFromJson(json);

  /// Convert to entity
  PokemonListItem toEntity() {
    final id = PokemonListItem.extractIdFromUrl(url);
    return PokemonListItem(
      id: id,
      name: name,
      url: url,
    );
  }
}
