import 'package:flutter/material.dart';
import 'package:medusa_js_dart/medusa_js_dart.dart' show PricedProduct;

class ProductThumbnailCard extends StatelessWidget {
  const ProductThumbnailCard({
    super.key,
    required this.pricedProduct,
  });

  final PricedProduct pricedProduct;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
            title: Text('Thumbnail'),
            subtitle: Text('Product Description'),
          ),
          pricedProduct.thumbnail != null
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.network(pricedProduct.thumbnail!)),
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
