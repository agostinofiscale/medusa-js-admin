import 'package:flutter/material.dart';
import 'package:medusa_js_admin/features/products/product-detail/widgets/bottom-sheets/product_details_form_bottom_sheet.dart';
import 'package:medusa_js_dart/medusa_js_dart.dart' show PricedProduct;

class ProductDetailsCard extends StatelessWidget {
  const ProductDetailsCard({
    super.key,
    required this.product,
    required this.onProductDetailsUpdated,
  });

  final PricedProduct product;

  final Function onProductDetailsUpdated;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
            title: Text(product.title, style: const TextStyle(fontSize: 32)),
            trailing: IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () => {showEditProductDetailBottomSheet(context)},
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(product.description ?? 'No description'),
          ),
          ListTile(
            title: Text(
              'Subtitle',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(product.subtitle ?? 'No subtitle'),
          ),
          ListTile(
            title: Text('Handle',
                style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text(product.handle ?? 'No subtitle'),
          ),
          ListTile(
            title: Text('Type',
                style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text(product.type?.value ?? 'No type'),
          ),
          ListTile(
            title: Text('Collection',
                style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text(product.collection?.title ?? 'No collection'),
          ),
          ListTile(
            title: Text('Discountable',
                style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text(product.discountable.toString()),
          ),
          ListTile(
            title: Text('Metadata',
                style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle:
                Text(product.metadata?.length.toString() ?? 'No metadata'),
          )
        ],
      ),
    );
  }

  Future<dynamic> showEditProductDetailBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      useSafeArea: true,
      isScrollControlled: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      context: context,
      showDragHandle: true,
      builder: (context) {
        return EditProductBottomSheet(
          product: product,
          onProductDetailsUpdated: onProductDetailsUpdated,
        );
      },
    );
  }
}
