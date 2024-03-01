import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:medusa_js_admin/routes/app_router.dart';

@RoutePage()
class CustomersPage extends StatelessWidget {
  const CustomersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(title: const Text('Customers'),
          bottom: const TabBar(
            tabs: [
              Tab( text: 'Customers'),
              Tab( text: 'Groups'),
            ],
          ),),
        body: TabBarView(children:[ListView.builder(
          itemCount: 100,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('Customer $index'),
              onTap: () {
                context.router.push(
                  CustomerDetailRoute(),
                );
              },
            );
          },
        ),
        ListView.builder(
          itemCount: 100,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('Group $index'),
              onTap: () {
                context.router.push(
                  GroupDetailRoute(),
                );
              },
            );
          },
        ),])
      ),
    );
  }
}