import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:medusa_js_admin/features/customers/detail/widgets/EditCustomerBottomSheet.dart';
import 'package:medusa_js_admin/routes/app_router.dart';

@RoutePage()
class CustomerDetailPage extends StatelessWidget {
  const CustomerDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Customer Detail'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Overview'),
              Tab(text: 'Orders'),
            ],
          ),
        ),
        body: TabBarView(
          children: [Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Card(
                  child: Column(
                    children: [
                      ListTile(
                        leading: const CircleAvatar(
                          child: Icon(Icons.person),
                        ),
                        title: Text('John Doe'),
                        subtitle: Text('jonh@doe.com'),
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
                                  return const EditCustomerBottomSheet();
                                });
                          }
                        ),
                      ),
                      ListTile(
                        title: Text('First visit'),
                        subtitle: Text('2021-01-01'),
                      ),
                      ListTile(
                        title: Text('Phone'),
                        subtitle: Text('+1234567890'),
                      ),
                      ListTile(
                        title: Text('User'),
                        subtitle: Text('Registered'),
                      ),
                    ],
                  ),
                ),
               
              ],
            ),
          ),
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
          ),]
        )
      ),
    );
  }
}