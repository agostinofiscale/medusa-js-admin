// TODO: Implement meta data
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:medusa_js_admin/features/products/product-detail/blocs/product_detail_bloc.dart';
import 'package:medusa_js_admin/features/products/product-detail/blocs/product_details_form_bloc.dart';
import 'package:medusa_js_dart/medusa_js_dart.dart';

class EditProductBottomSheet extends StatelessWidget {
  const EditProductBottomSheet({
    Key? key,
    required this.product,
    required this.onProductDetailsUpdated,
  }) : super(key: key);

  final PricedProduct product;

  final Function onProductDetailsUpdated;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Product'),
        automaticallyImplyLeading: false,
        forceMaterialTransparency: true,
      ),
      body: BlocProvider<ProductDetailsFormBloc>(
        create: (context) => ProductDetailsFormBloc(
          GetIt.instance.get<Medusa>(),
          product,
        ),
        child: Builder(builder: (context) {
          ProductDetailsFormBloc formBloc =
              context.read<ProductDetailsFormBloc>();
          return FormBlocListener<ProductDetailsFormBloc,
              ProductDetailsUpdatedEvent, String>(
            onFailure: (context, state) => ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.failureResponse!))),
            onSuccess: (context, state) {
              onProductDetailsUpdated();

              Navigator.of(context).pop();

              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Product details updated'),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8, 8, 8, 32),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            TextFieldBlocBuilder(
                              decoration: const InputDecoration(
                                labelText: 'Title',
                                hintText: 'Medusa T-Shirt',
                              ),
                              textFieldBloc: formBloc.title,
                            ),
                            TextFieldBlocBuilder(
                              decoration: const InputDecoration(
                                labelText: 'Subtitle',
                                hintText: 'Warm and cozy...',
                              ),
                              textFieldBloc: formBloc.subtitle,
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            const Text(
                                'Give your product a short and clear title. 50-60 characters is the recommended length for search engines.'),
                          ],
                        ),
                      ),
                    ),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          children: [
                            TextFieldBlocBuilder(
                              decoration: const InputDecoration(
                                labelText: 'Handle',
                                hintText: 't-shirt',
                                prefix: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 6.0),
                                  child: Text('/'),
                                ),
                              ),
                              textFieldBloc: formBloc.handle,
                            ),
                            TextFieldBlocBuilder(
                              decoration: const InputDecoration(
                                labelText: 'Material',
                                hintText: '100% Cotton',
                              ),
                              textFieldBloc: formBloc.material,
                            ),
                            TextFieldBlocBuilder(
                              decoration: const InputDecoration(
                                labelText: 'Description',
                                hintText:
                                    'Reimagine the feeling of a classic T-shirt. With our cotton T-shirts, everyday essentials no longer have to be ordinary.',
                              ),
                              maxLines: 3,
                              textFieldBloc: formBloc.description,
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            const Text(
                                'Give your product a short and clear description. 120-160 characters is the recommended length for search engines.'),
                          ],
                        ),
                      ),
                    ),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(children: [
                          DropdownFieldBlocBuilder<String>(
                            selectFieldBloc: formBloc.type,
                            itemBuilder: (context, value) => FieldItem(
                              child: Text(value),
                            ),
                            decoration: const InputDecoration(
                              labelText: 'Type',
                            ),
                          ),
                          DropdownFieldBlocBuilder<String>(
                            selectFieldBloc: formBloc.collection,
                            itemBuilder: (context, value) => FieldItem(
                              child: Text(value),
                            ),
                            decoration: const InputDecoration(
                              labelText: 'Collection',
                            ),
                          ),
                          TextFieldBlocBuilder(
                            decoration: const InputDecoration(
                              labelText: 'Tags (comma separated)',
                              hintText: 'example,example2',
                            ),
                            textFieldBloc: formBloc.tags,
                          ),
                        ]),
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
                                'Discountable',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                  'When unchecked discounts will not be applied to this product.'),
                            ),
                            SwitchFieldBlocBuilder(
                              body: const Text(''),
                              booleanFieldBloc: formBloc.discountable,
                            ),
                          ],
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: formBloc.submit,
                      child: const Text('Save'),
                    ),
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
