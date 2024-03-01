import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class PricingDetailPage extends StatelessWidget {
  const PricingDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(title: Text('Pricing'), bottom: TabBar(tabs: [
            Tab(
              text: 'Overview',
            ),
            Tab(
              text: 'Prices',
            )
          ],),),
          body: TabBarView(children: [
            Column(
              children: [
                Card(
                    child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text('Pricing Detail Page'),
                      ElevatedButton(
                        onPressed: () {
                          AutoRouter.of(context).pop();
                        },
                        child: Text('Back'),
                      )
                    ],
                  ),
                ))
              ],
            ),
            ListView.builder(
        itemCount: 100,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Product $index'),
            
          );
        },
      ),
          ],)),
    );
  }
}
