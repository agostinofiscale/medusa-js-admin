import 'package:flutter/material.dart';
import 'package:medusa_js_admin/features/orders/detail/widgets/ChangeCustomerBottomSheet.dart';
import 'package:medusa_js_admin/features/orders/detail/widgets/EditBillingAddressBottomSheet.dart';
import 'package:medusa_js_admin/features/orders/detail/widgets/EditEmailBottomSheet.dart';
import 'package:medusa_js_admin/features/orders/detail/widgets/EditShippingAddressBottomSheet.dart';

class CustomerMoreActionsBottomSheet extends StatelessWidget {
  const CustomerMoreActionsBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        ListTile(
          leading: const Icon(Icons.add),
          title: const Text('Go to customer page'),
          onTap: () {
            Navigator.pop(context);

            // TODO: Navigate to customer page
          },
        ),
        ListTile(
          leading: const Icon(Icons.edit),
          title: const Text('Change customer'),
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
                  return ChangeCustomerBottomSheet();
                });
          },
        ),
        ListTile(
          leading: const Icon(Icons.edit),
          title: const Text('Edit shipping address'),
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
                  return EditShippingAddressBottomSheet();
                });
          },
        ),
        ListTile(
          leading: const Icon(Icons.edit),
          title: const Text('Edit billing address'),
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
                  return EditBillingAddressBottomSheet();
                });
          },
        ),
         ListTile(
          leading: const Icon(Icons.edit),
          title: const Text('Edit email address'),
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
                  return EditEmailBottomSheet();
                });
          },
        ),
      ],
    );
  }
}