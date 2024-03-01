import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class OauthPage extends StatelessWidget {
  const OauthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Oauth'),),
      body: Center(
        child: Text('Oauth Page'),
      ),
    );
  }
}