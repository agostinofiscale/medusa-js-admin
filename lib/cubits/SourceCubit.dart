import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Source {}

class SourceState extends Equatable {
  SourceState();

  final Source source = Source();

  @override
  List<Object> get props => [source];
}

class ThemeCubit extends Cubit<SourceState> {
  ThemeCubit() : super(SourceState());

  void getTheme() {
    emit(state);
  }

  void toggleTheme() {
    emit(SourceState());
  }
}
