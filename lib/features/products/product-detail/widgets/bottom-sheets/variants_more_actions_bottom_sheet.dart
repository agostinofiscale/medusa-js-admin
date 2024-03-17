import 'package:flutter/material.dart';
import 'package:medusa_js_admin/features/products/product-detail/widgets/bottom-sheets/variant_form_bottom_sheet.dart';
import 'package:medusa_js_admin/features/products/product-detail/widgets/bottom-sheets/options_form_bottom_sheet.dart';
import 'package:medusa_js_admin/features/products/product-detail/widgets/bottom-sheets/prices_form_bottom_sheet.dart';
import 'package:medusa_js_admin/features/products/product-detail/widgets/bottom-sheets/variants_form_bottom_sheet.dart';
import 'package:medusa_js_dart/medusa_js_dart.dart';

class VariantsMoreActionsBottomSheet extends StatelessWidget {
  const VariantsMoreActionsBottomSheet({
    Key? key,
    required this.product,
    required this.onProductVariantCreated,
  }) : super(key: key);

  final PricedProduct product;

  final Function onProductVariantCreated;

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        ListTile(
          leading: const Icon(Icons.add),
          title: const Text('Add Variant'),
          onTap: () {
            Navigator.pop(context);

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
                return AddVariantBottomSheet(
                  product: product,
                  onProductVariantCreated: onProductVariantCreated,
                );
              },
            );
          },
        ),
        ListTile(
          leading: const Icon(Icons.edit),
          title: const Text('Edit prices'),
          onTap: () {
            Navigator.pop(context);

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
                  return const EditPricesBottomSheet();
                });
          },
        ),
        ListTile(
          leading: const Icon(Icons.edit),
          title: const Text('Edit variants'),
          onTap: () {
            Navigator.pop(context);

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
                  return const EditVariantsBottomSheet();
                });
          },
        ),
        ListTile(
          leading: const Icon(Icons.edit),
          title: const Text('Edit options'),
          onTap: () {
            Navigator.pop(context);

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
                  return const EditOptionsBottomSheet();
                });
          },
        ),
      ],
    );
  }
}
