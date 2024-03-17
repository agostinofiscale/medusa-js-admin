import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart' hide Page;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_patterns/view.dart';
import 'package:medusa_js_admin/data/repositories/ProductRepository.dart';
import 'package:medusa_js_admin/features/products/widgets/products_list_paged.dart';
import 'package:medusa_js_dart/medusa_js_dart.dart' show PricedProduct;

import 'package:flutter_bloc_patterns/paged_list.dart';

typedef ProductsBloc = PagedListBloc<PricedProduct>;

@RoutePage()
class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
      ),
      body: BlocProvider<ProductsBloc>(
        create: (context) =>
            ProductsBloc(ProductsRepository())..loadFirstPage(pageSize: 10),
        child: ViewStateBuilder<PagedList<PricedProduct>,
            PagedListBloc<PricedProduct>>(
          loading: (context) => const CircularProgressIndicator(),
          data: (context, page) => ProductsListPaged(
            page,
            onLoadNextPage: context.read<ProductsBloc>().loadNextPage,
          ),
          error: (context, error) => Center(
            child: Text('Error: $error'),
          ),
        ),
      ),
    );
  }
}
