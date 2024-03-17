import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:medusa_js_admin/blocs/auth/auth_bloc.dart';
import 'package:medusa_js_admin/data/models/Source.dart';
import 'package:medusa_js_dart/medusa_js_dart.dart';

class LoginWithApiKey extends FormBloc<AuthLoginRequestedEvent, String> {
  final Medusa medusa = GetIt.I.get<Medusa>();

  final Source source;

  final apiKey = TextFieldBloc(
    name: 'apiKey',
    validators: [
      FieldBlocValidators.required,
    ],
  );

  LoginWithApiKey(this.source) {
    addFieldBlocs(
      fieldBlocs: [apiKey],
    );
  }

  @override
  void onSubmitting() async {
    final apiKeyValue = apiKey.value;

    emitSuccess(
      successResponse: AuthLoginRequestedEvent(
        source.id!,
        source.authenticationType,
        apiKey: apiKeyValue,
      ),
    );
  }
}
