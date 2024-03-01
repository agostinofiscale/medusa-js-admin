import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ProductCategoriesPage extends StatelessWidget {
  const ProductCategoriesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Categories'),
      ),
      body: Center(
        child: Text('Product Categories Page'),
      ),
    );
  }
}