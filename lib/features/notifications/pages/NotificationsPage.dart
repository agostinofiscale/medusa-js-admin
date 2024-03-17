import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:medusa_js_admin/blocs/sources/sources_bloc.dart';
import 'package:medusa_js_admin/data/models/Source.dart';
import 'package:medusa_js_admin/routes/app_router.dart';
import 'package:medusa_js_dart/medusa_js_dart.dart' show AuthenticationType;
import 'package:uuid/uuid.dart';

@RoutePage()
class NotificationsPage extends StatelessWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
      ),
      body: Center(
          child: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              print(context.read<SourcesBloc>().state);
            },
            child: Text('Notifications Page'),
          ),
          ElevatedButton(
            onPressed: () {
              AutoRouter.of(context).push(SourcesRoute());
            },
            child: Text('Notifications Page'),
          ),
          ElevatedButton(
            onPressed: () async {
              await HydratedBloc.storage.clear();
              print('cleared');
            },
            child: Text('Notifications Page'),
          ),
          ElevatedButton(
            onPressed: () async {
              AutoRouter.of(context).push(AuthenticationRoute());
            },
            child: Text('Notifications Page'),
          ),
        ],
      )),
    );
  }
}
