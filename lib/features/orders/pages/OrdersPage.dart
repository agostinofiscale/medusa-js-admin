import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:medusa_js_admin/routes/app_router.dart';

@RoutePage()
class OrdersPage extends StatelessWidget {
  const OrdersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
            title: const Text('Orders'),
            bottom: TabBar(
              tabs: [
                Tab(
                  text: 'Orders',
                ),
                Tab(
                  text: 'Drafts',
                ),
              ],
            )),
        body: TabBarView(children: [
          ListView.builder(
            itemCount: 100,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text('Order $index'),
                onTap: () {
                  context.router.push(
                    OrderDetailRoute(),
                  );
                },
              );
            },
          ),
          ListView.builder(
            itemCount: 100,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text('Order draft $index'),
                onTap: () {
                  context.router.push(
                    OrderDetailRoute(),
                  );
                },
              );
            },
          ),
        ]),
      ),
    );
  }
}
