import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:medusa_js_admin/data/models/Source.dart';
import 'package:medusa_js_admin/main.dart';
import 'package:medusa_js_dart/medusa_js_dart.dart';
import 'package:json_annotation/json_annotation.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.g.dart';

class AuthBloc extends HydratedBloc<AuthEvent, AuthState> {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  final Medusa medusa = GetIt.I.get<Medusa>();

  AuthBloc() : super(const AuthState.initial()) {
    on<AuthLoadCurrentSourceEvent>(onAuthLoadCurrentSource);
    on<AuthLogoutRequestedEvent>(onAuthLogoutRequested);
    on<AuthSourceChangedEvent>(onAuthSourceChanged);
    on<AuthLoginSuccessedEvent>(onAuthLoginSuccessed);
    on<AuthLoginFailedEvent>(onAuthLoginFailed);
    on<AuthLoginRequestedEvent>(onAuthLoginRequested);
  }

  @override
  AuthState? fromJson(Map<String, dynamic> json) {
    return AuthState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(AuthState state) {
    return state.toJson();
  }

  FutureOr<void> onAuthLoadCurrentSource(
      AuthLoadCurrentSourceEvent event, Emitter<AuthState> emit) async {
    if (state.source == null) {
      emit(const AuthState.initial());

      return null;
    }

    late AuthLoginRequestedEvent authLoginRequestedEvent;

    switch (state.source!.authenticationType) {
      case AuthenticationType.jwt:
        authLoginRequestedEvent = AuthLoginRequestedEvent(
          state.source!.id!,
          state.source!.authenticationType,
          email: await _storage.read(
            key: 'email',
            iOptions: IOSOptions(
              accessibility: KeychainAccessibility.first_unlock_this_device,
            ),
          ),
          password: await _storage.read(
            key: 'password',
            iOptions: IOSOptions(
              accessibility: KeychainAccessibility.first_unlock_this_device,
            ),
          ),
        );
        break;
      case AuthenticationType.cookie:
        authLoginRequestedEvent = AuthLoginRequestedEvent(
          state.source!.id!,
          state.source!.authenticationType,
          email: await _storage.read(
            key: '${state.source!.id}_cookie_email',
            iOptions: IOSOptions(
              accessibility: KeychainAccessibility.first_unlock_this_device,
            ),
          ),
          password: await _storage.read(
            key: '${state.source!.id}_cookie_pswd',
            iOptions: IOSOptions(
              accessibility: KeychainAccessibility.first_unlock_this_device,
            ),
          ),
        );
        break;
      case AuthenticationType.apiKey:
    }

    add(authLoginRequestedEvent);
  }

  FutureOr<void> onAuthLogoutRequested(
      AuthLogoutRequestedEvent event, Emitter<AuthState> emit) {
    throw UnimplementedError();
  }

  FutureOr<void> onAuthSourceChanged(
      AuthSourceChangedEvent event, Emitter<AuthState> emit) {
    locator.registerSingleton<Medusa>(Medusa(
        Configuration(baseUrl: event.source.url, maxRetries: 3, debug: true)));

    emit(AuthState.selected(event.source));
  }

  FutureOr<void> onAuthLoginSuccessed(
      AuthLoginSuccessedEvent event, Emitter<AuthState> emit) {
    emit(AuthState.authenticated(state.source!));
  }

  FutureOr<void> onAuthLoginFailed(
      AuthLoginFailedEvent event, Emitter<AuthState> emit) {
    emit(AuthState.unauthenticated(state.source!));
  }

  FutureOr<void> onAuthLoginRequested(
      AuthLoginRequestedEvent event, Emitter<AuthState> emit) {
    try {
      switch (event.authenticationType) {
        case AuthenticationType.jwt:
          _loginWithJwt(event, emit);
        case AuthenticationType.cookie:
          _loginWithCookie(event, emit);
        case AuthenticationType.apiKey:
          _loginWithApiKey(event, emit);
      }

      emit(AuthState.authenticated(state.source!));
    } catch (e) {
      emit(AuthState.unauthenticated(state.source!));
    }
  }

  /// Login with JWT
  void _loginWithJwt(AuthLoginRequestedEvent event, Emitter<AuthState> emit) {
    medusa.admin.auth.getToken(
      AdminPostAuthReq(
        event.email!,
        event.password!,
      ),
    );

    _storage.write(
      key: '${event.sourceId}_jwt_email',
      value: event.email!,
      iOptions: IOSOptions(
        accessibility: KeychainAccessibility.first_unlock_this_device,
      ),
    );
    _storage.write(
      key: '${event.sourceId}_jwt_pswd',
      value: event.password!,
      iOptions: IOSOptions(
        accessibility: KeychainAccessibility.first_unlock_this_device,
      ),
    );
  }

  /// Login with Cookie
  void _loginWithCookie(
      AuthLoginRequestedEvent event, Emitter<AuthState> emit) {
    medusa.admin.auth.createSession(
      AdminPostAuthReq(
        event.email!,
        event.password!,
      ),
    );

    _storage.write(
      key: '${event.sourceId}_cookie_email',
      value: event.email!,
      iOptions: IOSOptions(
        accessibility: KeychainAccessibility.first_unlock_this_device,
      ),
    );

    _storage.write(
      key: '${event.sourceId}_cookie_pswd',
      value: event.password!,
      iOptions: IOSOptions(
        accessibility: KeychainAccessibility.first_unlock_this_device,
      ),
    );
  }

  /// Login with API key
  void _loginWithApiKey(
      AuthLoginRequestedEvent event, Emitter<AuthState> emit) {
    // TODO: Implement the login with API key
  }
}
