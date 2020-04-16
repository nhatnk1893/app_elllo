import 'package:json_annotation/json_annotation.dart';
part 'category.g.dart';

@JsonSerializable(nullable: false)
class Category {
  @JsonKey(name: 'category_id')
  final String id;
  @JsonKey(name: 'category_code')
  final String code;
  @JsonKey(name: 'category_name')
  final String name;
  @JsonKey(name: 'category_image')
  final String image;

  Category(this.id, this.code, this.name, this.image);
  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}
