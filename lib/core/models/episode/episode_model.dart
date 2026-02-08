import 'package:json_annotation/json_annotation.dart';
import 'package:rick_characters/core/models/episode/resulte_episode.dart';
import 'package:rick_characters/core/models/info/info_model.dart';

part 'episode_model.g.dart';

@JsonSerializable(explicitToJson: true)
class EpisodeModel {
  final InfoModel? info;
  @JsonKey(name: 'results')
  final List<ResulteEpisode>? results;
  EpisodeModel(this.info, this.results);
  factory EpisodeModel.fromJson(Map<String, dynamic> json) =>
      _$EpisodeModelFromJson(json);
  Map<String, dynamic> toJson() => _$EpisodeModelToJson(this);
}
