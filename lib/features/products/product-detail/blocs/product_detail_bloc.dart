import 'package:flutter_bloc_patterns/details.dart';
import 'package:medusa_js_dart/medusa_js_dart.dart';

part 'product_detail_event.dart';

class ProductDetailBloc extends DetailsBloc<PricedProduct, String> {
  ProductDetailBloc(DetailsRepository<PricedProduct, String> repository)
      : super(repository);
}
