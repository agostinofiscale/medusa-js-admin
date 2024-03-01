import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:medusa_js_admin/features/gift-cards/detail/widgets/EditGiftCardBottomSheet.dart';
import 'package:medusa_js_admin/features/gift-cards/detail/widgets/GiftCardMoreActionsBottomSheet.dart';

@RoutePage()
class GiftCardDetailPage extends StatelessWidget {
  const GiftCardDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Gift Card Detail')),
        body: Column(children: [
          Card(
            child: Column(
              children: [
                ListTile(
                  title: const Text('ABCD-1234-EFGH-5678'),
                  subtitle: const Text('Gift Card 1 description'),
                  trailing: IconButton(
                    icon: const Icon(Icons.copy),
                    onPressed: () => showModalBottomSheet(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(20),
                            ),
                          ),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          context: context,
                          builder: (context) {
                            return const GiftCardMoreActionsBottomSheet();
                          }),
                    ),
                ),
                ListTile(
                  title: const Text('Gift Card 1'),
                  subtitle: const Text('Gift Card 1 description'),
                ),
                ListTile(
                  title: const Text('Gift Card 1'),
                  subtitle: const Text('Gift Card 1 description'),
                ),
                ListTile(
                  title: const Text('Gift Card 1'),
                  subtitle: const Text('Gift Card 1 description'),
                ),
                ListTile(
                  title: const Text('Gift Card 1'),
                  subtitle: const Text('Gift Card 1 description'),
                ),
              ],
            ),
          ),
        ]));
  }
}
