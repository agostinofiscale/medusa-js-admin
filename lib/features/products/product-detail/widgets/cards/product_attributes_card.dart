import 'package:flutter/material.dart';
import 'package:medusa_js_admin/features/products/product-detail/widgets/bottom-sheets/attributes_form_bottom_sheet.dart';
import 'package:medusa_js_dart/medusa_js_dart.dart' show PricedProduct;

class ProductAttributesCard extends StatelessWidget {
  const ProductAttributesCard({
    super.key,
    required this.product,
    required this.onProductAttributesUpdated,
  });

  final PricedProduct product;

  final Function onProductAttributesUpdated;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
            title: const Text('Attribute', style: TextStyle(fontSize: 32)),
            trailing: IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () => {
                showModalBottomSheet(
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
                      return EditAttributeBottomSheet(
                        product: product,
                        onProductAttributesUpdated: onProductAttributesUpdated,
                      );
                    })
              },
            ),
          ),
          ListTile(
            title: Text(
              'Height',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              product.height?.toString() ?? 'No height',
            ),
          ),
          ListTile(
            title: Text(
              'Width',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(product.width?.toString() ?? 'No width'),
          ),
          ListTile(
            title: Text(
              'Length',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(product.length?.toString() ?? 'No length'),
          ),
          ListTile(
            title: Text(
              'Weight',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(product.weight?.toString() ?? 'No weight'),
          ),
          ListTile(
            title: Text(
              'MID code',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(product.midCode?.toString() ?? 'No width'),
          ),
          ListTile(
            title: Text(
              'HS code',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(product.hsCode?.toString() ?? 'No hs code'),
          ),
          ListTile(
            title: Text(
              'Country of origin',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
                product.originCountry?.toString() ?? 'No country of origin'),
          )
        ],
      ),
    );
  }
}
