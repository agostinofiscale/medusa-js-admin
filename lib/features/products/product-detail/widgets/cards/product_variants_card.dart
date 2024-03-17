import 'package:flutter/material.dart';
import 'package:medusa_js_admin/features/products/product-detail/widgets/bottom-sheets/variants_more_actions_bottom_sheet.dart';
import 'package:medusa_js_dart/medusa_js_dart.dart' show PricedProduct;

class ProductVariantsCard extends StatelessWidget {
  const ProductVariantsCard({
    super.key,
    required this.product,
    required this.onProductVariantCreated,
  });

  final PricedProduct product;

  final Function onProductVariantCreated;

  @override
  Widget build(BuildContext context) {
    final int variantsCount = product.variants?.length ?? 0;

    return Card(
      margin: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: Text(
              "Variants ($variantsCount)",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            trailing: IconButton(
              icon: const Icon(Icons.more),
              onPressed: () => showModalBottomSheet(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                  ),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  context: context,
                  builder: (context) {
                    return VariantsMoreActionsBottomSheet(
                      product: product,
                      onProductVariantCreated: onProductVariantCreated,
                    );
                  }),
            ),
          ),
          ...product.options
                  ?.map((option) => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListTile(
                              title: Text(option.title,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold))),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Wrap(
                              spacing: 8,
                              children: option.values
                                      ?.map((e) => e.value)
                                      .toSet()
                                      .toList()
                                      .map((e) => Chip(label: Text(e)))
                                      .toList() ??
                                  [],
                            ),
                          )
                        ],
                      ))
                  .toList() ??
              [],
          ListTile(
            title: const Text('Variants',
                style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(product.variants![index].title),
                trailing: IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () => {},
                ),
              );
            },
            itemCount: product.variants?.length ?? 0,
            shrinkWrap: true,
          ),
        ],
      ),
    );
  }
}
