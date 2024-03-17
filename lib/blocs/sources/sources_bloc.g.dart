// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sources_bloc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SourcesState _$SourcesStateFromJson(Map<String, dynamic> json) => SourcesState(
      sources: (json['sources'] as List<dynamic>?)
              ?.map((e) => Source.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$SourcesStateToJson(SourcesState instance) =>
    <String, dynamic>{
      'sources': instance.sources,
    };
