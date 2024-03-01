import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:medusa_js_admin/features/discounts/widgets/AddDiscountBottomSheet.dart';
import 'package:medusa_js_admin/routes/app_router.dart';

@RoutePage()
class DiscountsPage extends StatelessWidget {
  const DiscountsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Discounts'),
        actions: [
          IconButton(
            onPressed: () {
              showModalBottomSheet(context: context, builder: (context) {
                return AddDiscountBottomSheet();
              });
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 100,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Discount $index'),
            onTap: () {
              context.router.push(
                DiscountDetailRoute(),
              );
            },
          );
        },
      ),
    );
  }
}