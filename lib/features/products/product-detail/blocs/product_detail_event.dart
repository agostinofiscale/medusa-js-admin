part of 'product_detail_bloc.dart';

final class ProductDetailsUpdatedEvent extends DetailsEvent {
  const ProductDetailsUpdatedEvent({
    required this.id,
    this.title,
    this.subtitle,
    this.description,
    this.discountable,
    this.handle,
    this.material,
  });

  final String id;
  final String? title;
  final String? subtitle;
  final String? description;
  final bool? discountable;
  final String? handle;
  final String? material;

  @override
  List<Object> get props => [];
}

final class ProductAttributesUpdatedEvent extends DetailsEvent {
  const ProductAttributesUpdatedEvent(
    this.id, {
    this.weight,
    this.length,
    this.height,
    this.width,
    this.hsCode,
    this.originCountry,
    this.midCode,
  });

  final String id;
  final num? weight;
  final num? length;
  final num? height;
  final num? width;
  final String? hsCode;
  final String? originCountry;
  final String? midCode;

  @override
  List<Object> get props => [
        weight ?? '',
        length ?? '',
        height ?? '',
        width ?? '',
        hsCode ?? '',
        originCountry ?? '',
        midCode ?? '',
      ];
}

class ProductVariantCreatedEvent extends DetailsEvent {
  const ProductVariantCreatedEvent(
    this.id, {
    required this.title,
    this.sku,
    this.ean,
    this.upc,
    this.barcode,
    this.hsCode,
    this.inventoryQuantity,
    this.allowBackorder,
    this.manageInventory,
    this.weight,
    this.length,
    this.height,
    this.width,
    this.originCountry,
    this.midCode,
    this.material,
    this.metadata,
    this.prices,
    required this.options,
  });

  final String id;
  final String title;
  final String? sku;
  final String? ean;
  final String? upc;
  final String? barcode;
  final String? hsCode;
  final int? inventoryQuantity;
  final bool? allowBackorder;
  final bool? manageInventory;
  final int? weight;
  final int? length;
  final int? height;
  final int? width;
  final String? originCountry;
  final String? midCode;
  final String? material;
  final Map<String, dynamic>? metadata;
  final List<VariantPricePayload>? prices;
  final List<ProductOptionValuePayload> options;

  @override
  List<Object> get props => [id];
}
