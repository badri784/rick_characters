// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'characters.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Characters _$CharactersFromJson(Map<String, dynamic> json) => Characters(
  info: json['info'] == null
      ? null
      : InfoModel.fromJson(json['info'] as Map<String, dynamic>),
  characters: (json['results'] as List<dynamic>?)
      ?.map((e) => Results.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$CharactersToJson(Characters instance) =>
    <String, dynamic>{
      'info': instance.info?.toJson(),
      'results': instance.characters?.map((e) => e.toJson()).toList(),
    };
