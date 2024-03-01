// TODO: Implement meta data
import 'package:flutter/material.dart';

class EditProductBottomSheet extends StatelessWidget {
  const EditProductBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Edit Product'),
          automaticallyImplyLeading: false,
          forceMaterialTransparency: true,
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(8, 8, 8, 32),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Title',
                            hintText: 'Medusa T-Shirt',
                          ),
                        ),
                        TextFormField(
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
                      ],
                    ),
                  ),
                ),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Handle',
                            hintText: 't-shirt',
                            prefix: Padding(
                              padding:
                                  EdgeInsets.symmetric(horizontal: 6.0),
                              child: Text('/'),
                            ),
                          ),
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Material',
                            hintText: '100% Cotton',
                          ),
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Description',
                            hintText:
                                'Reimagine the feeling of a classic T-shirt. With our cotton T-shirts, everyday essentials no longer have to be ordinary.',
                          ),
                          maxLines: 3,
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
                      DropdownButtonFormField<String>(
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
                        decoration: const InputDecoration(
                          labelText: 'Type',
                        ),
                      ),
                      DropdownButtonFormField<String>(
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
                        decoration: const InputDecoration(
                          labelText: 'Collection',
                        ),
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Tags (comma separated)',
                          hintText: 'example,example2',
                        ),
                      ),
                    ]),
                  ),
                ),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        ListTile(
                            contentPadding: EdgeInsets.zero,
                            title: const Text(
                              'Discountable',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: const Text(
                                'When unchecked discounts will not be applied to this product.'),
                            trailing: Switch(
                              value: true,
                              onChanged: (value) {},
                            ))
                      ],
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Save'),
                ),
              ],
            ),
          ),
        ));
  }
}
