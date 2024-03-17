import 'package:flutter/material.dart';
import 'package:medusa_js_dart/medusa_js_dart.dart' show PricedProduct;

class ProductMediaCard extends StatelessWidget {
  const ProductMediaCard({
    super.key,
    required this.pricedProduct,
  });

  final PricedProduct pricedProduct;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: Text('Thumbnail'),
            subtitle: Text('Product Description'),
            trailing: IconButton(
              icon: const Icon(Icons.add_a_photo_outlined),
              onPressed: () => {},
            ),
          ),
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            padding: const EdgeInsets.all(8),
            physics: const NeverScrollableScrollPhysics(),
            children: [
              ...pricedProduct.images
                      ?.map((e) => ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(e.url,
                              height: 150, width: 150, fit: BoxFit.cover)))
                      .toList() ??
                  []
            ],
          )
        ],
      ),
    );
  }
}
