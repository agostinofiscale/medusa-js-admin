import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:medusa_js_admin/data/models/Source.dart';
import 'package:medusa_js_admin/features/sources/blocs/SourceFormBloc.dart';

class AddEditSourceBottomSheet extends StatelessWidget {
  final Source? source;

  final Function(Source)? onDelete;

  final Function(Source) onSave;

  const AddEditSourceBottomSheet({
    Key? key,
    this.source,
    required this.onSave,
    this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SourceFormBloc(source: source),
      child: Builder(builder: (context) {
        SourceFormBloc formBloc = context.read<SourceFormBloc>();
        return Scaffold(
          appBar: AppBar(
            title: Text('${source?.id == null ? 'Add' : 'Edit'} Source'),
            actions: (source?.id != null)
                ? [
                    IconButton(
                        onPressed: () => onDelete!(source!),
                        icon: Icon(Icons.delete))
                  ]
                : [],
            automaticallyImplyLeading: false,
          ),
          body: Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: AddEditSourceForm(
                formBloc: formBloc,
                source: source,
                onSave: onSave,
              ),
            ),
          ),
        );
      }),
    );
  }
}

class AddEditSourceForm extends StatelessWidget {
  const AddEditSourceForm({
    super.key,
    required this.formBloc,
    required this.source,
    required this.onSave,
  });

  final SourceFormBloc formBloc;

  final Source? source;

  final Function(Source) onSave;

  @override
  Widget build(BuildContext context) {
    return FormBlocListener<SourceFormBloc, Source, String>(
      onSuccess: (context, state) => onSave(state.successResponse!),
      child: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          children: [
            TextFieldBlocBuilder(
              textFieldBloc: formBloc.name,
              decoration: const InputDecoration(labelText: 'Name'),
              textInputAction: TextInputAction.next,
            ),
            TextFieldBlocBuilder(
              textFieldBloc: formBloc.url,
              keyboardType: TextInputType.url,
              decoration: const InputDecoration(labelText: 'URL'),
              textInputAction: TextInputAction.done,
            ),
            DropdownFieldBlocBuilder(
              selectFieldBloc: formBloc.authenticationType,
              itemBuilder: (context, value) => FieldItem(
                child: Text(value.name),
              ),
            ),
            ElevatedButton(
                onPressed: () => formBloc.submit(),
                child: Text(source?.id == null ? 'Add' : 'Save'))
          ],
        ),
      ),
    );
  }
}
