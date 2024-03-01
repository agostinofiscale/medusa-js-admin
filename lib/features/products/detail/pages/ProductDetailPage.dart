import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:medusa_js_admin/features/products/detail/widgets/EditAttributeBottomSheet.dart';
import 'package:medusa_js_admin/features/products/detail/widgets/EditProductBottomSheet.dart';
import 'package:medusa_js_admin/features/products/detail/widgets/VariantsMoreActionsBottomSheet.dart';

@RoutePage()
class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Product Detail')),
        body: Column(
          children: [
            Card(
              child: Column(
                children: [
                  ListTile(
                    title: const Text('Product Name',
                        style: TextStyle(fontSize: 32)),
                    trailing: IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () => {
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
                              return const EditProductBottomSheet();
                            })
                      },
                    ),
                  ),
                ],
              ),
            ),
            Card(
              child: Column(
                children: [
                  ListTile(
                    title: const Text('Variants'),
                    subtitle: const Text('Product Description'),
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
                            return const VariantsMoreActionsBottomSheet();
                          }),
                    ),
                  ),
                ],
              ),
            ),
            const Card(
              child: Column(
                children: [
                  ListTile(
                    title: Text('Thumbnail'),
                    subtitle: Text('Product Description'),
                  ),
                ],
              ),
            ),
            const Card(
                child: Column(
              children: [
                ListTile(
                  title: Text('Media'),
                  subtitle: Text('Product Description'),
                ),
              ],
            )),
            Card(
              child: Column(
                children: [
                  ListTile(
                    title:
                        const Text('Attribute', style: TextStyle(fontSize: 32)),
                    trailing: IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () => {
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
                              return const EditAttributeBottomSheet();
                            })
                      },
                    ),
                  )
                ],
              ),
            ),
            const Card(
              child: Column(
                children: [
                  ListTile(
                    title: Text('Prodotto grezzo'),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
