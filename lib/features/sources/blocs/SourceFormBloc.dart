import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:medusa_js_admin/data/models/Source.dart';
import 'package:medusa_js_dart/medusa_js_dart.dart';

class SourceFormBloc extends FormBloc<Source, String> {
  final Source? source;

  final name = TextFieldBloc(
    name: 'name',
    validators: [
      FieldBlocValidators.required,
    ],
  );

  final url = TextFieldBloc(
    name: 'url',
    validators: [
      FieldBlocValidators.required,
    ],
  );

  final authenticationType = SelectFieldBloc<AuthenticationType, dynamic>(
    name: 'authenticationType',
    initialValue: AuthenticationType.apiKey,
    items: [
      AuthenticationType.apiKey,
      AuthenticationType.jwt,
      AuthenticationType.cookie
    ],
    validators: [
      FieldBlocValidators.required,
    ],
  );

  SourceFormBloc({this.source}) {
    if (source != null) setFirstValues(source!);

    addFieldBlocs(
      fieldBlocs: [name, url, authenticationType],
    );
  }

  @override
  void onSubmitting() {
    emitSuccess(
      successResponse: Source(
        id: source?.id,
        name: name.value,
        url: url.value,
        authenticationType: authenticationType.value!,
      ),
    );
  }

  void setFirstValues(Source source) {
    name.updateInitialValue(source.name);
    url.updateInitialValue(source.url);
    authenticationType.updateInitialValue(source.authenticationType);
  }
}
