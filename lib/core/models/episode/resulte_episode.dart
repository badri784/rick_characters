import 'package:json_annotation/json_annotation.dart';

part 'resulte_episode.g.dart';

@JsonSerializable()
class ResulteEpisode {
  final int? id;
  final String? name;
  @JsonKey(name: 'air_date')
  final String? airdate;
  final String? episode;

  ResulteEpisode(this.id, this.name, this.airdate, this.episode);
  factory ResulteEpisode.fromJson(Map<String, dynamic> json) =>
      _$ResulteEpisodeFromJson(json);
  Map<String, dynamic> toJson() => _$ResulteEpisodeToJson(this);
}
