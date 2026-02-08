import 'package:json_annotation/json_annotation.dart';

import 'info/info_model.dart';
import 'result/results.dart';

part 'characters.g.dart';

@JsonSerializable(explicitToJson: true)
class Characters {
  InfoModel? info;
  @JsonKey(name: 'results')
  List<Results>? characters;
  Characters({this.info, this.characters});
  factory Characters.fromJson(Map<String, dynamic> json) =>
      _$CharactersFromJson(json);
  Map<String, dynamic> toJson() => _$CharactersToJson(this);
}
