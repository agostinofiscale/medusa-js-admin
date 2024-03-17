import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:medusa_js_admin/blocs/auth/auth_bloc.dart';
import 'package:medusa_js_admin/data/models/Source.dart';
import 'package:medusa_js_dart/medusa_js_dart.dart';

class LoginWithEmailAndPasswordBloc
    extends FormBloc<AuthLoginRequestedEvent, String> {
  final Medusa medusa = GetIt.I.get<Medusa>();

  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  final Source source;

  final email = TextFieldBloc(
    name: 'email',
    validators: [
      FieldBlocValidators.required,
    ],
  );

  final password = TextFieldBloc(
    name: 'password',
    validators: [
      FieldBlocValidators.required,
    ],
  );

  LoginWithEmailAndPasswordBloc(this.source) {
    addFieldBlocs(
      fieldBlocs: [email, password],
    );
  }

  @override
  void onSubmitting() async {
    final emailValue = email.value;
    final passwordValue = password.value;

    emitSuccess(
      successResponse: AuthLoginRequestedEvent(
        source.id!,
        source.authenticationType,
        email: emailValue,
        password: passwordValue,
      ),
    );
  }
}
