import 'package:json_annotation/json_annotation.dart';

part 'breeds_detail.g.dart';

// @JsonSerializable(genericArgumentFactories: true)
// class BreedsDetail {
//   @JsonKey(defaultValue: "")
//   final List<String>? message;
//   @JsonKey()
//   final String? status;
//
//   BreedsDetail({
//     this.message = const [],
//     this.status = '',
//   });
//
//   factory BreedsDetail.fromJson(Map<String, dynamic> json) =>
//       _$BreedsDetailFromJson(json);
//   Map<String, dynamic> toJson() => _$BreedsDetailToJson(this);
// }

@JsonSerializable(explicitToJson: true)
class BreedsDetail {
  @JsonKey(defaultValue: "")
  final List<String>? message;
  @JsonKey()
  final String? status;

  BreedsDetail({this.message = const [], this.status});

  factory BreedsDetail.fromJson(Map<String, dynamic> json) =>
      _$BreedsDetailFromJson(json);
  Map<String, dynamic> toJson() => _$BreedsDetailToJson(this);
}
