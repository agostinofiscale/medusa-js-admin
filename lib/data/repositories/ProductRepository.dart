import 'package:flutter_bloc_patterns/details.dart';
import 'package:flutter_bloc_patterns/paged_list.dart';
import 'package:get_it/get_it.dart';
import 'package:medusa_js_dart/medusa_js_dart.dart';

class ProductsRepository
    implements
        PagedListRepository<PricedProduct>,
        DetailsRepository<PricedProduct, String> {
  final Medusa medusa = GetIt.I.get<Medusa>();

  @override
  Future<PricedProduct?> getById(String id) async {
    final AdminProductsRes res = await medusa.admin.products.retrieve(id);

    PricedProduct product = res.product;

    /// This is a workaround for the fact that the API does not return the
    /// options values in the product details.
    /// Same workaround is used in the webapp.
    final AdminProductsListRes optionsRes = await medusa.admin.products.list(
      query: AdminGetProductsParams(
        id: product.id,
        expand: 'options,options.values',
      ),
    );

    product.options = optionsRes.products.first.options;

    return product;
  }

  @override
  Future<List<PricedProduct>> getAll(Page page) {
    return getProducts(page);
  }

  Future<List<PricedProduct>> getProducts(Page page) async {
    final AdminProductsListRes res = await medusa.admin.products.list(
      query: AdminGetProductsParams(
        limit: page.size,
        offset: page.number * page.size,
      ),
    );

    return res.products;
  }
}
