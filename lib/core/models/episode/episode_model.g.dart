// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'episode_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EpisodeModel _$EpisodeModelFromJson(Map<String, dynamic> json) => EpisodeModel(
  json['info'] == null
      ? null
      : InfoModel.fromJson(json['info'] as Map<String, dynamic>),
  (json['results'] as List<dynamic>?)
      ?.map((e) => ResulteEpisode.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$EpisodeModelToJson(EpisodeModel instance) =>
    <String, dynamic>{
      'info': instance.info?.toJson(),
      'results': instance.results?.map((e) => e.toJson()).toList(),
    };
