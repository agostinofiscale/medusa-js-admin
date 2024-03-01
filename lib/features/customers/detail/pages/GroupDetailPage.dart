import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class GroupDetailPage extends StatelessWidget {
  const GroupDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Group Detail')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            
          },
          child: const Text('Group Detail Page'),
        ),
      ),
    );
  }
}