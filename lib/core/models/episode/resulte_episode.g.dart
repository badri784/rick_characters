// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resulte_episode.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResulteEpisode _$ResulteEpisodeFromJson(Map<String, dynamic> json) =>
    ResulteEpisode(
      (json['id'] as num?)?.toInt(),
      json['name'] as String?,
      json['air_date'] as String?,
      json['episode'] as String?,
    );

Map<String, dynamic> _$ResulteEpisodeToJson(ResulteEpisode instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'air_date': instance.airdate,
      'episode': instance.episode,
    };
