import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:medusa_js_admin/features/products/product-detail/blocs/product_attribute_form_bloc.dart';
import 'package:medusa_js_admin/features/products/product-detail/blocs/product_detail_bloc.dart';
import 'package:medusa_js_dart/medusa_js_dart.dart';

class EditAttributeBottomSheet extends StatelessWidget {
  const EditAttributeBottomSheet(
      {Key? key,
      required this.product,
      required this.onProductAttributesUpdated})
      : super(key: key);

  final PricedProduct product;
  final Function onProductAttributesUpdated;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Attribute')),
      body: SingleChildScrollView(
        child: BlocProvider(
          create: (context) =>
              ProductAttributeFormBloc(GetIt.I.get<Medusa>(), product),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8, 8, 8, 32),
            child: Builder(builder: (BuildContext context) {
              ProductAttributeFormBloc formBloc =
                  context.read<ProductAttributeFormBloc>();
              return Column(
                children: [
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: FormBlocListener<ProductAttributeFormBloc,
                          ProductAttributesUpdatedEvent, String>(
                        onSuccess: (BuildContext context, state) {
                          onProductAttributesUpdated();

                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Product attributes updated'),
                            ),
                          );

                          Navigator.of(context).pop();
                        },
                        child: Column(
                          children: [
                            const ListTile(
                              contentPadding: EdgeInsets.zero,
                              title: Text(
                                'Size',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                  'Configura per calcolare le tariffe di spedizione più accurate'),
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
                          ],
                        ),
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
                              'Dogana',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                                'Configura per calcolare le tariffe di spedizione più accurate'),
                          ),
                          TextFieldBlocBuilder(
                            textFieldBloc: formBloc.hsCode,
                            decoration: const InputDecoration(
                              labelText: 'MID Code',
                              hintText: 'XDSKLAD9999..."',
                            ),
                          ),
                          TextFieldBlocBuilder(
                            textFieldBloc: formBloc.midCode,
                            decoration: const InputDecoration(
                              labelText: 'HS Code',
                              hintText: 'BDJSK39277W...',
                            ),
                          ),
                          DropdownButton(
                            value: 'One',
                            onChanged: (String? newValue) {
                              print('ok');
                            },
                            items: <String>['One', 'Two', 'Free', 'Four']
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            hint: const Text('Country of Origin'),
                          ),
                          ElevatedButton(
                            onPressed: () => formBloc.submit(),
                            child: const Text('Save'),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
