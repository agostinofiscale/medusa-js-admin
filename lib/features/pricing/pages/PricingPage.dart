import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:medusa_js_admin/routes/app_router.dart';

@RoutePage()
class PricingPage extends StatelessWidget {
  const PricingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(title: const Text('Pricing')),
      body: ListView.builder(
        itemCount: 100,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Pricing $index'),
            onTap: () {
              context.router.push(
                PricingDetailRoute(),
              );
            },
          );
        },
      ),
    );
  }
}