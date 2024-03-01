import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:medusa_js_admin/features/gift-cards/widgets/AddGiftCardBottomSheet.dart';
import 'package:medusa_js_admin/routes/app_router.dart';

@RoutePage()
class GiftCardsPage extends StatelessWidget {
  const GiftCardsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gift cards'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
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
                    return const AddGiftCardBottomSheet();
                  });
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 100,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Gift card $index'),
            onTap: () {
              context.router.push(
                GiftCardDetailRoute(),
              );
            },
          );
        },
      ),
    );
  }
}
