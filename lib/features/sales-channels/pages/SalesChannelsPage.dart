import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SalesChannelsPage extends StatelessWidget {
  const SalesChannelsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Sales Channels Page'),
      ),
    );
  }
}