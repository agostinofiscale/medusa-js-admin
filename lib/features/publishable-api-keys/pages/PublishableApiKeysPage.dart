import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class PublishableApiKeysPage extends StatelessWidget {
  const PublishableApiKeysPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Publishable Api Keys Page'),
      ),
    );
  }
}