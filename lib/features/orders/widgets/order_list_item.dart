import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:medusa_js_admin/routes/app_router.dart';
import 'package:medusa_js_dart/medusa_js_dart.dart' show Order;

class OrderListItem extends StatelessWidget {
  final Order order;

  const OrderListItem(this.order, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(order.id),
      subtitle: Text('${order.customer.firstName} ${order.customer.lastName}'),
      onTap: () =>
          AutoRouter.of(context).push(OrderDetailRoute(orderId: order.id)),
    );
  }
}
