import 'package:json_annotation/json_annotation.dart';

part 'orgine_model.g.dart';

@JsonSerializable()
class OrgineModel {
  final String name;
  final String url;
  OrgineModel(this.name, this.url);
  factory OrgineModel.fromJson(Map<String, dynamic> json) =>
      _$OrgineModelFromJson(json);
  Map<String, dynamic> toJson() => _$OrgineModelToJson(this);
}
