// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Source.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Source _$SourceFromJson(Map<String, dynamic> json) => Source(
      id: json['id'] as String?,
      name: json['name'] as String,
      url: json['url'] as String,
      authenticationType:
          $enumDecode(_$AuthenticationTypeEnumMap, json['authenticationType']),
    );

Map<String, dynamic> _$SourceToJson(Source instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'url': instance.url,
      'authenticationType':
          _$AuthenticationTypeEnumMap[instance.authenticationType]!,
    };

const _$AuthenticationTypeEnumMap = {
  AuthenticationType.apiKey: 'apiKey',
  AuthenticationType.jwt: 'jwt',
  AuthenticationType.cookie: 'cookie',
};
