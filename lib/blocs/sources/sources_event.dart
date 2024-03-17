part of 'sources_bloc.dart';

sealed class SourcesEvent extends Equatable {
  const SourcesEvent(this.source);

  final Source source;

  @override
  List<Object> get props => [];
}

final class SourcesSourceAddedEvent extends SourcesEvent {
  const SourcesSourceAddedEvent(super.source);

  @override
  List<Object> get props => [source];
}

final class SourcesSourceDeletedEvent extends SourcesEvent {
  const SourcesSourceDeletedEvent(super.source);

  @override
  List<Object> get props => [source];
}

final class SourcesSourceUpdatedEvent extends SourcesEvent {
  const SourcesSourceUpdatedEvent(super.source);

  @override
  List<Object> get props => [source];
}
