import 'package:flutter/material.dart';
import 'package:medusa_js_admin/features/products/detail/widgets/AddVariantBottomSheet.dart';
import 'package:medusa_js_admin/features/products/detail/widgets/EditOptionsBottomSheet.dart';
import 'package:medusa_js_admin/features/products/detail/widgets/EditPricesBottomSheet.dart';
import 'package:medusa_js_admin/features/products/detail/widgets/EditVariantsBottomSheet.dart';

class VariantsMoreActionsBottomSheet extends StatelessWidget {
  const VariantsMoreActionsBottomSheet({Key? key}) : super(key: key);

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
                  return const AddVariantBottomSheet();
                });
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