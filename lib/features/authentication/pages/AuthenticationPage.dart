import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:medusa_js_admin/blocs/auth/auth_bloc.dart';
import 'package:medusa_js_admin/data/models/Source.dart';
import 'package:medusa_js_admin/features/authentication/blocs/LoginWithEmailAndPasswordBloc.dart';
import 'package:medusa_js_admin/routes/app_router.dart';
import 'package:medusa_js_dart/medusa_js_dart.dart' show AuthenticationType;

@RoutePage()
class AuthenticationPage extends StatelessWidget {
  const AuthenticationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
        bloc: context.read<AuthBloc>()..add(AuthLoadCurrentSourceEvent()),
        listener: (context, AuthState state) {
          print(state);
          if (state.isAuthenticated) {
            AutoRouter.of(context).popAndPush(
              const HomeRoute(),
            );
          }
        },
        builder: (content, AuthState state) {
          return Scaffold(
            body: SafeArea(
              child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: Column(
                      children: [
                        if (state.source?.authenticationType ==
                            AuthenticationType.apiKey)
                          LoginWithApiKey(state.source!),
                        if (state.source?.authenticationType ==
                                AuthenticationType.jwt ||
                            state.source?.authenticationType ==
                                AuthenticationType.cookie)
                          LoginWithEmailAndPassword(state.source!),
                      ],
                    ),
                  ),
                  Flexible(
                    child: Column(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            AutoRouter.of(context).popAndPush(
                              const SourcesRoute(),
                            );
                          },
                          child: Text('Switch source'),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
            ),
          );
        });
  }
}

class LoginWithEmailAndPassword extends StatelessWidget {
  const LoginWithEmailAndPassword(this.source, {Key? key}) : super(key: key);

  final Source source;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginWithEmailAndPasswordBloc(source),
      child: Builder(builder: (context) {
        final loginWithEmailAndPasswordBloc =
            BlocProvider.of<LoginWithEmailAndPasswordBloc>(context);

        final authBloc = context.read<AuthBloc>();

        return FormBlocListener<LoginWithEmailAndPasswordBloc,
            AuthLoginRequestedEvent, String>(
          onSubmitting: (context, state) => {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Submitting...'),
              ),
            ),
          },
          onSuccess: (context, state) => {authBloc.add(state.successResponse!)},
          child: Card(
            child: Column(
              children: [
                ListTile(
                  title: Text('Login'),
                  subtitle: Column(
                    children: [
                      TextFieldBlocBuilder(
                        textFieldBloc: loginWithEmailAndPasswordBloc.email,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          hintText: 'Enter your email',
                        ),
                      ),
                      TextFieldBlocBuilder(
                        textFieldBloc: loginWithEmailAndPasswordBloc.password,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          hintText: 'Enter your password',
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () => {
                          loginWithEmailAndPasswordBloc.submit(),
                        },
                        child: Text('Login'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}

class LoginWithApiKey extends StatelessWidget {
  const LoginWithApiKey(this.source, {Key? key}) : super(key: key);

  final Source source;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
            title: Text('Login with API Key'),
            subtitle: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'API Key',
                    hintText: 'Enter your API Key',
                  ),
                ),
                ElevatedButton(
                  onPressed: () => {},
                  child: Text('Login'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
