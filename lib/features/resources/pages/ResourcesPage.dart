
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:medusa_js_admin/routes/app_router.dart';

@RoutePage()
class ResourcesPage extends StatelessWidget {
  const ResourcesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resources'),
      ),
      body: ListView.builder(
        itemCount: resources.length,
        itemBuilder: (context, index) {
          return ResourceListTile(
            icon: resources[index].icon,
            title: resources[index].title,
            subtitle: resources[index].subtitle ?? '',
            onTap: () => context.router.push(resources[index].route),
          );
        },
      ),
    );
  }
}

List<ResourceListData> resources = [
  ResourceListData(icon: Icons.people, title: 'Orders', route: OrdersRoute()),
  ResourceListData(icon: Icons.people, title: 'Products', route: ProductsRoute()),
  ResourceListData(icon: Icons.people, title: 'Customers', route: CustomersRoute()),
  ResourceListData(icon: Icons.people, title: 'Discounts', route: DiscountsRoute()),
  ResourceListData(icon: Icons.people, title: 'Gift cards', route: GiftCardsRoute()),
  ResourceListData(icon: Icons.people, title: 'Pricing', route: PricingRoute()),
];

class ResourceListData {
  final IconData icon;
  final String title;
  final String? subtitle;
  final PageRouteInfo route;
  

  ResourceListData(
      {required this.icon,
      required this.title,
      this.subtitle,
      required this.route});
}

class ResourceListTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Function onTap;

  const ResourceListTile(
      {Key? key,
      required this.icon,
      required this.title,
      required this.subtitle,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.2,
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Icon(icon),
        ),
        title: Text(title),
        subtitle: Text(subtitle),
        onTap: () {
          onTap();
        },
      ),
    );
  }
}
