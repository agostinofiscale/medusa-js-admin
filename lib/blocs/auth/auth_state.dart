part of 'auth_bloc.dart';

@JsonEnum()
enum AuthenticationStatus {
  unknown,
  authenticated,
  unauthenticated,
}

@JsonSerializable(constructor: '_')
class AuthState extends Equatable {
  const AuthState._({
    this.status = AuthenticationStatus.unknown,
    this.source,
  });

  const AuthState.initial() : this._();

  const AuthState.authenticated(Source source)
      : this._(
          status: AuthenticationStatus.authenticated,
          source: source,
        );

  const AuthState.unauthenticated(Source source)
      : this._(source: source, status: AuthenticationStatus.unauthenticated);

  const AuthState.loading(Source source)
      : this._(
          source: source,
          status: AuthenticationStatus.unknown,
        );

  const AuthState.selected(Source source)
      : this._(
          status: AuthenticationStatus.unauthenticated,
          source: source,
        );

  @JsonKey(includeFromJson: false, includeToJson: false)
  final AuthenticationStatus status;

  final Source? source;

  bool get isAuthenticated => status == AuthenticationStatus.authenticated;

  @override
  List<Object> get props => [status, source ?? 'no_source'];

  factory AuthState.fromJson(Map<String, dynamic> json) =>
      _$AuthStateFromJson(json);

  Map<String, dynamic> toJson() => _$AuthStateToJson(this);
}
