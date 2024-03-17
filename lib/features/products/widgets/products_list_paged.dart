import 'package:flutter/material.dart';
import 'package:flutter_bloc_patterns/paged_list.dart';
import 'package:medusa_js_admin/features/products/widgets/product_list_item.dart';
import 'package:medusa_js_admin/widgets/InfiniteListView.dart';
import 'package:medusa_js_dart/medusa_js_dart.dart';

class ProductsListPaged extends StatelessWidget {
  final PagedList<PricedProduct> page;
  final VoidCallback onLoadNextPage;

  const ProductsListPaged(
    this.page, {
    super.key,
    required this.onLoadNextPage,
  });

  @override
  Widget build(BuildContext context) {
    return InfiniteListView(
      itemBuilder: (context, index) => ProductListItem(page.items[index]),
      itemCount: page.items.length,
      hasNext: page.hasMoreItems,
      nextData: onLoadNextPage,
      loadingWidget: const CircularProgressIndicator(),
    );
  }
}
