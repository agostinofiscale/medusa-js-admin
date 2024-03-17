import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:medusa_js_admin/features/products/product-detail/blocs/product_detail_bloc.dart';
import 'package:medusa_js_admin/features/products/product-detail/blocs/product_variant_form_bloc.dart';
import 'package:medusa_js_dart/medusa_js_dart.dart';

class AddVariantBottomSheet extends StatelessWidget {
  const AddVariantBottomSheet({
    Key? key,
    required this.product,
    required this.onProductVariantCreated,
  }) : super(key: key);

  final PricedProduct product;

  final Function onProductVariantCreated;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Variant'),
        automaticallyImplyLeading: false,
      ),
      body: BlocProvider(
        create: (context) => ProductVariantFormBloc(
          GetIt.I.get<Medusa>(),
          product,
        ),
        child: Builder(builder: (context) {
          ProductVariantFormBloc formBloc =
              context.read<ProductVariantFormBloc>();

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8, 8, 8, 32),
              child: FormBlocListener<ProductVariantFormBloc,
                  ProductVariantCreatedEvent, String>(
                onFailure: (context, state) => {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.failureResponse!),
                    ),
                  )
                },
                onSuccess: (context, state) {
                  onProductVariantCreated();

                  Navigator.of(context).pop();

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Product variant created'),
                    ),
                  );
                },
                child: Column(
                  children: [
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            const ListTile(
                              contentPadding: EdgeInsets.zero,
                              title: Text(
                                'General',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                  'Configure the general information for this variant.'),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            TextFieldBlocBuilder(
                              textFieldBloc: formBloc.title,
                              decoration: const InputDecoration(
                                labelText: 'Custom title',
                                hintText: 'Medusa T-Shirt',
                              ),
                            ),
                            TextFieldBlocBuilder(
                              textFieldBloc: formBloc.subtitle,
                              decoration: const InputDecoration(
                                labelText: 'Subtitle',
                                hintText: 'Warm and cozy...',
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            const Text(
                                'Give your product a short and clear title. 50-60 characters is the recommended length for search engines.'),
                            ListTile(
                              contentPadding: EdgeInsets.zero,
                              title: Text(
                                'Options',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            ListView.builder(
                              shrinkWrap: true,
                              itemCount: formBloc.options.value.length,
                              itemBuilder: (context, index) => Column(
                                children: [
                                  TextFieldBlocBuilder(
                                    decoration: InputDecoration(
                                        labelText: formBloc
                                            .options.value[index].optionName),
                                    textFieldBloc: formBloc
                                        .options.value[index].optionValue,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          children: [
                            const ListTile(
                              contentPadding: EdgeInsets.zero,
                              title: Text(
                                'Stock & Inventory',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                  'Configure the pricing for this variant.'),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            TextFieldBlocBuilder(
                              textFieldBloc: formBloc.sku,
                              decoration: const InputDecoration(
                                labelText: 'Stock keeping unit (SKU)',
                                hintText: 'SUN-G, JK1234...',
                              ),
                            ),
                            TextFieldBlocBuilder(
                              textFieldBloc: formBloc.inventoryQuantity,
                              decoration: const InputDecoration(
                                labelText: 'Quantity in stock',
                                hintText: '100',
                              ),
                            ),
                            TextFieldBlocBuilder(
                              textFieldBloc: formBloc.ean,
                              decoration: const InputDecoration(
                                labelText: 'EAN (Barcode)',
                                hintText: '123456789102...',
                              ),
                            ),
                            TextFieldBlocBuilder(
                              textFieldBloc: formBloc.upc,
                              decoration: const InputDecoration(
                                labelText: 'UPC (Barcode)',
                                hintText: '023456789104...',
                              ),
                            ),
                            TextFieldBlocBuilder(
                              textFieldBloc: formBloc.barcode,
                              decoration: const InputDecoration(
                                labelText: 'Barcode',
                                hintText: '123456789104...',
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            /* ListTile(
                                contentPadding: EdgeInsets.zero,
                                title: const Text(
                                  'Manage inventory',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                subtitle: const Text(
                                    'When checked Medusa will regulate the inventory when orders and returns are made.'),
                                trailing: SwitchFieldBlocBuilder(
                                  booleanFieldBloc: formBloc.manageInventory,
                                  body: const Text(''),
                                )),
                            ListTile(
                              contentPadding: EdgeInsets.zero,
                              title: const Text(
                                'Allow backorders',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              subtitle: const Text(
                                  'When checked the product will be available for purchase despite the product being sold out'),
                              trailing: SwitchFieldBlocBuilder(
                                booleanFieldBloc: formBloc.allowBackorder,
                                body: const Text(''),
                              ),
                            ), */
                          ],
                        ),
                      ),
                    ),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            const ListTile(
                              contentPadding: EdgeInsets.zero,
                              title: Text(
                                'Shipping',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                  'Shipping information can be required depending on your shipping provider, and whether or not you are shipping internationally.'),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            const ListTile(
                              contentPadding: EdgeInsets.zero,
                              title: Text(
                                'Dimensions',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                  'Configure to calculate the most accurate shipping rates.'),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            TextFieldBlocBuilder(
                              textFieldBloc: formBloc.width,
                              decoration: const InputDecoration(
                                labelText: 'Width',
                                hintText: '100...',
                              ),
                            ),
                            TextFieldBlocBuilder(
                              textFieldBloc: formBloc.length,
                              decoration: const InputDecoration(
                                labelText: 'Length',
                                hintText: '100...',
                              ),
                            ),
                            TextFieldBlocBuilder(
                              textFieldBloc: formBloc.height,
                              decoration: const InputDecoration(
                                labelText: 'Height',
                                hintText: '100...',
                              ),
                            ),
                            TextFieldBlocBuilder(
                              textFieldBloc: formBloc.weight,
                              decoration: const InputDecoration(
                                labelText: 'Weight',
                                hintText: '100...',
                              ),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            const ListTile(
                              contentPadding: EdgeInsets.zero,
                              title: Text(
                                'Dogana',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                  'Configura per calcolare le tariffe di spedizione più accurate'),
                            ),
                            TextFieldBlocBuilder(
                              textFieldBloc: formBloc.midCode,
                              decoration: const InputDecoration(
                                labelText: 'MID Code',
                                hintText: 'XDSKLAD9999..."',
                              ),
                            ),
                            TextFieldBlocBuilder(
                              textFieldBloc: formBloc.hsCode,
                              decoration: const InputDecoration(
                                labelText: 'HS Code',
                                hintText: 'BDJSK39277W...',
                              ),
                            ),
                            DropdownButton(
                              isExpanded: true,
                              value: 'One',
                              onChanged: (String? newValue) {
                                print('ok');
                              },
                              items: <String>[
                                'One',
                                'Two',
                                'Free',
                                'Four'
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              hint: const Text('Country of Origin'),
                            ),
                            ElevatedButton(
                                onPressed: () => formBloc.submit(),
                                child: const Text('Save')),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
