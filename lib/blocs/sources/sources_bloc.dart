import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:medusa_js_admin/data/models/Source.dart';
import 'package:uuid/uuid.dart';

part 'sources_event.dart';
part 'sources_state.dart';
part 'sources_bloc.g.dart';

class SourcesBloc extends HydratedBloc<SourcesEvent, SourcesState> {
  SourcesBloc() : super(SourcesState()) {
    on<SourcesSourceAddedEvent>(onSourceAddedEvent);
    on<SourcesSourceDeletedEvent>(onSourceDeletedEvent);
    on<SourcesSourceUpdatedEvent>(onSourceUpdatedEvent);
  }

  @override
  SourcesState? fromJson(
    Map<String, dynamic> json,
  ) {
    return SourcesState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(
    SourcesState state,
  ) {
    return state.toJson();
  }

  FutureOr<void> onSourceAddedEvent(
    SourcesSourceAddedEvent event,
    Emitter<SourcesState> emit,
  ) {
    Source source = Source(
      id: const Uuid().v4(),
      name: event.source.name,
      url: event.source.url,
      authenticationType: event.source.authenticationType,
    );

    emit(SourcesState(
      sources: List.from(state.sources)..add(source),
    ));
  }

  FutureOr<void> onSourceDeletedEvent(
    SourcesSourceDeletedEvent event,
    Emitter<SourcesState> emit,
  ) {
    emit(
      SourcesState(
        sources: List.from(state.sources)
          ..removeWhere(
            (Source source) => source.id! == event.source.id,
          ),
      ),
    );
  }

  FutureOr<void> onSourceUpdatedEvent(
    SourcesSourceUpdatedEvent event,
    Emitter<SourcesState> emit,
  ) {
    List<Source> sources = List.from(state.sources);

    int index = sources.indexWhere(
      (Source source) => source.id! == event.source.id,
    );

    sources[index] = event.source;

    emit(SourcesState(sources: sources));
  }
}
