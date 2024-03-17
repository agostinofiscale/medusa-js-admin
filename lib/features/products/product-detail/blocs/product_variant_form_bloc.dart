import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:medusa_js_admin/features/products/product-detail/blocs/product_detail_bloc.dart';
import 'package:medusa_js_dart/medusa_js_dart.dart';

/// TODO: Support both adding and editing product variants
class ProductVariantFormBloc
    extends FormBloc<ProductVariantCreatedEvent, String> {
  final Medusa medusa;
  final PricedProduct product;

  final title = TextFieldBloc();
  final subtitle = TextFieldBloc();
  final material = TextFieldBloc();
  final midCode = TextFieldBloc();
  final hsCode = TextFieldBloc();
  final originCountry = TextFieldBloc();
  final sku = TextFieldBloc();
  final ean = TextFieldBloc();
  final upc = TextFieldBloc();
  final barcode = TextFieldBloc();
  final inventoryQuantity = TextFieldBloc();
  final manageInventory = BooleanFieldBloc();
  final allowBackorder = BooleanFieldBloc();
  final weight = TextFieldBloc();
  final width = TextFieldBloc();
  final height = TextFieldBloc();
  final length = TextFieldBloc();
  final options =
      ListFieldBloc<ProductVariantOptionBloc, dynamic>(name: 'options');

  ProductVariantFormBloc(this.medusa, this.product) {
    options.addFieldBlocs(
      product.options
              ?.map(
                (option) => ProductVariantOptionBloc(
                  optionName: option.title,
                  optionId: TextFieldBloc(
                    name: 'option_id',
                    initialValue: option.id,
                    validators: [FieldBlocValidators.required],
                  ),
                  optionValue: TextFieldBloc(
                    name: 'value',
                    validators: [FieldBlocValidators.required],
                  ),
                ),
              )
              .toList() ??
          [],
    );

    addFieldBlocs(
      fieldBlocs: [
        title,
        subtitle,
        material,
        midCode,
        hsCode,
        originCountry,
        sku,
        ean,
        upc,
        barcode,
        inventoryQuantity,
        manageInventory,
        allowBackorder,
        weight,
        width,
        height,
        length,
        options,
      ],
    );
  }

  @override
  void onSubmitting() async {
    try {
      await medusa.admin.products.createVariant(
        product.id,
        AdminPostProductsProductVariantsReq(
          title: title.value != ''
              ? title.value
              : _getDefaultTitleByOptions(options.value),
          material: material.value != '' ? material.value : null,
          midCode: midCode.value != '' ? midCode.value : null,
          hsCode: hsCode.value != '' ? hsCode.value : null,
          originCountry: originCountry.value != '' ? originCountry.value : null,
          sku: sku.value != '' ? sku.value : null,
          ean: ean.value != '' ? ean.value : null,
          upc: upc.value != '' ? upc.value : null,
          barcode: barcode.value != '' ? barcode.value : null,
          inventoryQuantity: int.tryParse(inventoryQuantity.value) ?? 0,
          manageInventory: manageInventory.value,
          allowBackorder: allowBackorder.value,
          weight: null,
          width: null,
          height: null,
          length: null,
          prices: [],
          metadata: null,
          options: options.value
              .map((e) => ProductOptionValuePayload(
                  optionId: e.optionId.value, value: e.optionValue.value))
              .toList(),
        ),
      );

      emitSuccess();
    } on MedusaException catch (e, _) {
      emitFailure();
    }
  }

  String _getDefaultTitleByOptions(List<ProductVariantOptionBloc> options) {
    return options.map((e) => e.optionValue.value).join(' / ');
  }
}

class ProductVariantOptionBloc extends GroupFieldBloc {
  final String optionName;
  final TextFieldBloc optionId;
  final TextFieldBloc optionValue;

  ProductVariantOptionBloc({
    required this.optionName,
    required this.optionId,
    required this.optionValue,
  }) : super(fieldBlocs: [optionId, optionValue]);
}
