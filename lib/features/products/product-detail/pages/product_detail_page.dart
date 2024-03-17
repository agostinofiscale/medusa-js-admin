import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_patterns/details.dart';
import 'package:flutter_bloc_patterns/view.dart';
import 'package:medusa_js_admin/data/repositories/ProductRepository.dart';
import 'package:medusa_js_admin/features/products/product-detail/blocs/product_detail_bloc.dart';

import 'package:medusa_js_admin/features/products/product-detail/widgets/cards/product_attributes_card.dart';
import 'package:medusa_js_admin/features/products/product-detail/widgets/cards/product_details_card.dart';
import 'package:medusa_js_admin/features/products/product-detail/widgets/cards/product_media_card.dart';
import 'package:medusa_js_admin/features/products/product-detail/widgets/cards/product_thumbnail_card.dart';
import 'package:medusa_js_admin/features/products/product-detail/widgets/cards/product_variants_card.dart';
import 'package:medusa_js_dart/medusa_js_dart.dart';

@RoutePage()
class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({Key? key, required this.productId})
      : super(key: key);

  final String productId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Product Detail')),
      body: BlocProvider<ProductDetailBloc>(
        create: (_) => ProductDetailBloc(
          ProductsRepository(),
        )..loadItem(productId),
        child: ViewStateListener<PricedProduct, ProductDetailBloc>(
          onEmpty: (context) => const Center(
            child: Text('No product found'),
          ),
          onError: (context, error) => {throw error},
          child: ViewStateBuilder<PricedProduct, ProductDetailBloc>(
            error: (context, error) => ProductDetailPageError(
              error: error,
            ),
            loading: (context) => const ProductDetailPageLoading(),
            data: (context, PricedProduct state) =>
                ProductDetailPageData(state),
          ),
        ),
      ),
    );
  }
}

class ProductDetailPageError extends StatelessWidget {
  const ProductDetailPageError({
    super.key,
    required this.error,
  });

  final Object error;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Error: $error'),
    );
  }
}

class ProductDetailPageLoading extends StatelessWidget {
  const ProductDetailPageLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

class ProductDetailPageData extends StatelessWidget {
  const ProductDetailPageData(
    this.state, {
    super.key,
  });

  final PricedProduct state;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ProductDetailsCard(
              product: state,
              onProductDetailsUpdated: () =>
                  context.read<ProductDetailBloc>().add(
                        LoadDetails(state.id),
                      )),
          ProductVariantsCard(
              product: state,
              onProductVariantCreated: () =>
                  context.read<ProductDetailBloc>().add(
                        LoadDetails(state.id),
                      )),
          ProductThumbnailCard(
            pricedProduct: state,
          ),
          ProductMediaCard(
            pricedProduct: state,
          ),
          ProductAttributesCard(
            product: state,
            onProductAttributesUpdated: () =>
                context.read<ProductDetailBloc>().add(
                      LoadDetails(state.id),
                    ),
          ),
        ],
      ),
    );
  }
}
