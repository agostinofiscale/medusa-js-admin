import 'package:flutter/material.dart';
import 'package:medusa_js_admin/features/gift-cards/detail/widgets/EditGiftCardBottomSheet.dart';
import 'package:medusa_js_admin/features/gift-cards/detail/widgets/UpdateAmountBottomSheet.dart';

class GiftCardMoreActionsBottomSheet extends StatelessWidget {
  const GiftCardMoreActionsBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        ListTile(
          leading: const Icon(Icons.add),
          title: const Text('Edit gift card'),
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
                  return const EditGiftCardBottomSheet();
                });
          },
        ),
        ListTile(
          leading: const Icon(Icons.edit),
          title: const Text('Update amount'),
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
                  return const UpdateAmountBottomSheet();
                });
          },
        ),
      ],
    );
  }
}