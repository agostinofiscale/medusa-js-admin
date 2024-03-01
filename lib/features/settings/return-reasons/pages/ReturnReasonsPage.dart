import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ReturnReasonsPage extends StatelessWidget {
  const ReturnReasonsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Return Reasons Page'),
      ),
    );
  }
}