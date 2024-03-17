part of 'sources_bloc.dart';

@JsonSerializable()
class SourcesState extends Equatable {
  const SourcesState({
    this.sources = const [],
  });

  final List<Source> sources;

  @override
  List<Object?> get props => [sources];

  factory SourcesState.fromJson(Map<String, dynamic> json) =>
      _$SourcesStateFromJson(json);

  Map<String, dynamic> toJson() => _$SourcesStateToJson(this);
}
