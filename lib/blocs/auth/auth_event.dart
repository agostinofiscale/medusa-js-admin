part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

final class AuthLoadCurrentSourceEvent extends AuthEvent {}

final class AuthLoginRequestedEvent extends AuthEvent {
  final AuthenticationType authenticationType;

  final String sourceId;

  final String? apiKey;

  final String? email;

  final String? password;

  const AuthLoginRequestedEvent(
    this.sourceId,
    this.authenticationType, {
    this.apiKey,
    this.email,
    this.password,
  });

  @override
  List<Object> get props => [
        authenticationType,
        apiKey ?? 'no_api_key',
        email ?? 'no_email',
        password ?? 'no_password',
      ];
}

final class AuthLoginSuccessedEvent extends AuthEvent {}

final class AuthLoginFailedEvent extends AuthEvent {}

final class AuthLogoutRequestedEvent extends AuthEvent {}

final class AuthSourceChangedEvent extends AuthEvent {
  final Source source;

  const AuthSourceChangedEvent(this.source);

  @override
  List<Object> get props => [source];
}
