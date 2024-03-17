import 'dart:async';

import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:medusa_js_admin/features/products/product-detail/blocs/product_detail_bloc.dart';
import 'package:medusa_js_dart/medusa_js_dart.dart';

/// TODO: Support for type and collection, types and collections
/// can be created inline in the web app.
class ProductDetailsFormBloc
    extends FormBloc<ProductDetailsUpdatedEvent, String> {
  final PricedProduct product;

  final Medusa medusa;

  ProductDetailsFormBloc(
    this.medusa,
    this.product,
  ) : super(isEditing: true) {
    setFirstValues(product);

    addFieldBlocs(
      fieldBlocs: [
        title,
        subtitle,
        handle,
        material,
        description,
        type,
        collection,
        tags,
        discountable,
      ],
    );
  }

  final title = TextFieldBloc(
    name: 'title',
    validators: [
      FieldBlocValidators.required,
    ],
  );

  final subtitle = TextFieldBloc(name: 'subtitle');
  final handle = TextFieldBloc(
    name: 'handle',
    validators: [
      FieldBlocValidators.required,
    ],
  );
  final material = TextFieldBloc(
    name: 'material',
  );
  final description = TextFieldBloc(name: 'description');
  final discountable = BooleanFieldBloc(
    name: 'discountable',
  );
  final type = SelectFieldBloc(name: 'type', items: ['Option 1', 'Option 2']);
  final collection = SelectFieldBloc(
    name: 'collection',
    items: ['Option 1', 'Option 2'],
  );
  final tags = TextFieldBloc(
    name: 'tags',
  );

  void setFirstValues(PricedProduct product) {
    title.updateInitialValue(product.title);
    subtitle.updateInitialValue(product.subtitle ?? '');
    handle.updateInitialValue(product.handle ?? '');
    material.updateInitialValue(product.material ?? '');
    description.updateInitialValue(product.description ?? '');
    discountable.updateInitialValue(product.discountable);
    /* type.updateInitialValue(product.type?.id ?? '');
    collection.updateInitialValue(product.collection?.id ?? ''); */
    tags.updateInitialValue(product.tags?.join(', ') ?? '');
  }

  @override
  FutureOr<dynamic> onSubmitting() async {
    try {
      await medusa.admin.products.update(
        product.id,
        AdminPostProductsProductReq(
          title: title.value,
          subtitle: subtitle.value,
          handle: handle.value,
          material: material.value,
          description: description.value,
          discountable: discountable.value,
        ),
      );

      emitSuccess();
    } catch (e) {
      emitFailure(failureResponse: e.toString());
    }
  }
}
