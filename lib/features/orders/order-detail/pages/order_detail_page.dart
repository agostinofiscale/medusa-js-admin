import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:medusa_js_admin/features/orders/order-detail/widgets/CustomerMoreActionBottomSheet.dart';
import 'package:medusa_js_admin/features/orders/order-detail/widgets/EditOrderBottomSheet.dart';
import 'package:medusa_js_admin/features/orders/order-detail/widgets/HistoryBottomSheet.dart';

@RoutePage()
class OrderDetailPage extends StatelessWidget {
  const OrderDetailPage({Key? key, required this.orderId}) : super(key: key);

  final String orderId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Order Detail'),
          actions: [
            IconButton(
              icon: const Icon(Icons.history),
              onPressed: () => showModalBottomSheet(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                  ),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  context: context,
                  builder: (context) {
                    return HistoryBottomSheet();
                  }),
            )
          ],
        ),
        body: Column(
          children: [
            Card(
              child: Column(
                children: [
                  ListTile(
                    title: const Text('Order ID'),
                    subtitle: const Text('123456'),
                  ),
                  ListTile(
                    title: const Text('Order Date'),
                    subtitle: const Text('2021-10-10'),
                  ),
                  ListTile(
                    title: const Text('Customer'),
                    subtitle: const Text('John Doe'),
                  ),
                  ListTile(
                    title: const Text('Total'),
                    subtitle: const Text('100.00'),
                  ),
                ],
              ),
            ),
            Card(
              child: Column(
                children: [
                  ListTile(
                    title: Text('Summary'),
                    trailing: IconButton(
                      icon: Icon(Icons.edit),
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
                              return const EditOrderBottomSheet();
                            });
                      },
                    ),
                  )
                ],
              ),
            ),
            Card(
              child: Column(
                children: [
                  ListTile(
                    title: Text('Payment'),
                    trailing: IconButton(
                      icon: Icon(Icons.edit),
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
                              return const EditOrderBottomSheet();
                            });
                      },
                    ),
                  )
                ],
              ),
            ),
            Card(
              child: Column(
                children: [
                  ListTile(
                    title: Text('Shipping'),
                  )
                ],
              ),
            ),
            Card(
              child: Column(
                children: [
                  ListTile(
                    title: Text('Customer'),
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
                            return const CustomerMoreActionsBottomSheet();
                          }),
                    ),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
