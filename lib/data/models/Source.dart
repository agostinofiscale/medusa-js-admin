import 'package:json_annotation/json_annotation.dart';
import 'package:medusa_js_dart/medusa_js_dart.dart';

part 'Source.g.dart';

@JsonSerializable()
class Source {
  final String? id;

  final String name;

  final String url;

  final AuthenticationType authenticationType;

  Source(
      {this.id,
      required this.name,
      required this.url,
      required this.authenticationType});

  factory Source.fromJson(Map<String, dynamic> json) => _$SourceFromJson(json);

  Map<String, dynamic> toJson() => _$SourceToJson(this);
}
