import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:medusa_js_admin/routes/app_router.dart';

@RoutePage()
class ProductsPage extends StatelessWidget {
  const ProductsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
      ),
      // List 100 placeholder products
      body: ListView.builder(
        itemCount: 100,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Product $index'),
            onTap: () {
              context.router.push(
                ProductDetailRoute(),
              );
            },
          );
        },
      ),
    );
  }
}