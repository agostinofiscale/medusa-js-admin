part of 'theme_bloc.dart';

@JsonSerializable()
class ThemeState extends Equatable {
  const ThemeState({this.themeMode = ThemeMode.light});

  final ThemeMode themeMode;

  @override
  List<Object> get props => [
        themeMode,
      ];

  factory ThemeState.fromJson(Map<String, dynamic> json) =>
      _$ThemeStateFromJson(json);

  Map<String, dynamic> toJson() => _$ThemeStateToJson(this);

  ThemeState copyWith({
    ThemeMode? themeMode,
  }) {
    return ThemeState(
      themeMode: themeMode ?? this.themeMode,
    );
  }
}
