import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:medusa_js_admin/routes/app_router.dart';
import 'package:medusa_js_dart/medusa_js_dart.dart' show PricedProduct;

class ProductListItem extends StatelessWidget {
  final PricedProduct product;

  const ProductListItem(this.product, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading:
          product.thumbnail != null ? Image.network(product.thumbnail!) : null,
      title: Text(product.title),
      subtitle: Text(product.status),
      onTap: () => AutoRouter.of(context)
          .push(ProductDetailRoute(productId: product.id)),
    );
  }
}
