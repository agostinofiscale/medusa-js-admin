import 'dart:async';

import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:medusa_js_admin/features/products/product-detail/blocs/product_detail_bloc.dart';
import 'package:medusa_js_dart/medusa_js_dart.dart';

class ProductAttributeFormBloc
    extends FormBloc<ProductAttributesUpdatedEvent, String> {
  final Medusa medusa;

  final PricedProduct product;

  final width = TextFieldBloc(
    name: 'width',
  );

  final length = TextFieldBloc(
    name: 'length',
  );

  final height = TextFieldBloc(
    name: 'height',
  );

  final weight = TextFieldBloc(
    name: 'weight',
  );

  final hsCode = TextFieldBloc(
    name: 'hsCode',
  );

  final originCountry = TextFieldBloc(
    name: 'originCountry',
  );

  final midCode = TextFieldBloc(
    name: 'midCode',
  );

  ProductAttributeFormBloc(this.medusa, this.product) {
    setFirstValues(product);

    addFieldBlocs(
      fieldBlocs: [
        width,
        length,
        height,
        weight,
        hsCode,
        originCountry,
        midCode,
      ],
    );
  }

  void setFirstValues(PricedProduct product) {
    width.updateInitialValue(product.width?.toString() ?? '');
    length.updateInitialValue(product.length?.toString() ?? '');
    height.updateInitialValue(product.height?.toString() ?? '');
    weight.updateInitialValue(product.weight?.toString() ?? '');
    hsCode.updateInitialValue(product.hsCode ?? '');
    originCountry.updateInitialValue(product.originCountry ?? '');
    midCode.updateInitialValue(product.midCode ?? '');
  }

  @override
  FutureOr<void> onSubmitting() async {
    try {
      await medusa.admin.products.update(
        product.id,
        AdminPostProductsProductReq(
          weight: weight.value != '' ? weight.valueToDouble : null,
          length: length.value != '' ? length.valueToDouble : null,
          height: height.value != '' ? height.valueToDouble : null,
          width: width.value != '' ? width.valueToDouble : null,
          hsCode: hsCode.value != '' ? hsCode.value : null,
          originCountry: originCountry.value != '' ? originCountry.value : null,
          midCode: midCode.value != '' ? midCode.value : null,
        ),
      );

      emitSuccess();
    } catch (e) {
      emitFailure();
    }
  }
}
