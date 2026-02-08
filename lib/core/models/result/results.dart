import 'package:json_annotation/json_annotation.dart';
import 'package:rick_characters/core/models/location/location_model.dart';
import 'package:rick_characters/core/models/orgine/orgine_model.dart';

part 'results.g.dart';

@JsonSerializable()
class Results {
  final int? id;
  final String? name;
  final String? status;
  final String? species;
  final String? type;
  final String? gender;
  final OrgineModel? origin;
  final LocationModel? location;
  final String? image;
  final List<String>? episode;
  final String? url;
  final String? created;
  Results({
    this.id,
    this.name,
    this.status,
    this.species,
    this.type,
    this.gender,
    this.image,
    this.episode,
    this.url,
    this.created,
    this.origin,
    this.location,
  });
  factory Results.fromJson(Map<String, dynamic> json) =>
      _$ResultsFromJson(json);
  Map<String, dynamic> toJson() => _$ResultsToJson(this);
}
