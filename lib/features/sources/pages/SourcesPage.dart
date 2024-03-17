import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medusa_js_admin/blocs/auth/auth_bloc.dart';
import 'package:medusa_js_admin/blocs/sources/sources_bloc.dart';
import 'package:medusa_js_admin/data/models/Source.dart';
import 'package:medusa_js_admin/features/sources/widgets/add_edit_source_bottom_sheet.dart';
import 'package:medusa_js_admin/features/sources/widgets/delete_source_bottom_sheet.dart';
import 'package:medusa_js_admin/features/sources/widgets/source_card.dart';
import 'package:medusa_js_admin/routes/app_router.dart';

@RoutePage()
class SourcesPage extends StatelessWidget {
  const SourcesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Sources'),
          actions: [
            IconButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return AddEditSourceBottomSheet(
                        onSave: (Source source) {
                          context
                              .read<SourcesBloc>()
                              .add(SourcesSourceAddedEvent(source));

                          AutoRouter.of(context).pop();
                        },
                      );
                    });
              },
              icon: Icon(Icons.add),
            )
          ],
        ),
        body: BlocBuilder(
          bloc: context.read<SourcesBloc>(),
          builder: (BuildContext context, SourcesState state) => Column(
              children: state.sources
                  .map<Widget>((Source source) => SourceCard(
                        source: source,
                        onSelect: (Source source) {
                          context
                              .read<AuthBloc>()
                              .add(AuthSourceChangedEvent(source));

                          AutoRouter.of(context)
                              .popAndPush(const AuthenticationRoute());
                        },
                        onEdit: (Source source) {
                          showModalBottomSheet(
                              context: context,
                              builder: (BuildContext context) {
                                return AddEditSourceBottomSheet(
                                  source: source,
                                  onDelete: (Source source) {
                                    showModalBottomSheet(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return DeleteSourceBottomSheet(
                                            source: source,
                                            onDelete: (Source source) {
                                              context.read<SourcesBloc>().add(
                                                  SourcesSourceDeletedEvent(
                                                      source));

                                              AutoRouter.of(context).popUntil(
                                                  (route) =>
                                                      route.settings.name ==
                                                      SourcesRoute.name);

                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(SnackBar(
                                                content: Text(
                                                    'Source ${source.name} deleted'),
                                              ));
                                            },
                                          );
                                        });
                                  },
                                  onSave: (Source source) {
                                    context
                                        .read<SourcesBloc>()
                                        .add(SourcesSourceUpdatedEvent(source));

                                    AutoRouter.of(context).pop();
                                  },
                                );
                              });
                        },
                      ))
                  .toList()),
        ));
  }
}
