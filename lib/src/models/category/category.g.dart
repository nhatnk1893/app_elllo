// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Category _$CategoryFromJson(Map<String, dynamic> json) {
  return Category(
    json['category_id'] as String,
    json['category_code'] as String,
    json['category_name'] as String,
    json['category_image'] as String,
  );
}

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      'category_id': instance.id,
      'category_code': instance.code,
      'category_name': instance.name,
      'category_image': instance.image,
    };
