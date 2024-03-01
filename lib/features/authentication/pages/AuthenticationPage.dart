import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:medusa_js_admin/routes/app_router.dart';

@RoutePage()
class AuthenticationPage extends StatelessWidget {
  const AuthenticationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(onPressed: () => context.pushRoute(CategoriesRoute()), child: Text('Authentication Page'))
      ),
    );
  }
}
