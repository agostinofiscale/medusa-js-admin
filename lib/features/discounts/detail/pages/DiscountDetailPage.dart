import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class DiscountDetailPage extends StatelessWidget {
  const DiscountDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Discount Detail')),
      body: const Text('Discount Detail Page'),
    );
  }
}