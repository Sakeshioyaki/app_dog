import 'package:json_annotation/json_annotation.dart';

part 'breeds_list.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class BreedsList<T> {
  @JsonKey()
  final T? message;
  @JsonKey(defaultValue: "")
  final String status;

  BreedsList({this.message, this.status = ""});

  factory BreedsList.fromJson(
          Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$BreedsListFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) =>
      _$BreedsListToJson(this, toJsonT);
}
