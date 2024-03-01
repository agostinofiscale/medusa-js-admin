import 'package:flutter/material.dart';

class AddVariantBottomSheet extends StatelessWidget {
  const AddVariantBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Variant'), automaticallyImplyLeading: false,),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8, 8, 8, 32),
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
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Custom title',
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
                      const ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Text(
                          'Stock & Inventory',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle:
                            Text('Configure the pricing for this variant.'),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Stock keeping unit (SKU)',
                          hintText: 'SUN-G, JK1234...',
                        ),
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Quantity in stock',
                          hintText: '100',
                        ),
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'EAN (Barcode)',
                          hintText: '123456789102...',
                        ),
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'UPC (Barcode)',
                          hintText: '023456789104...',
                        ),
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Barcode',
                          hintText: '123456789104...',
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      ListTile(
                          contentPadding: EdgeInsets.zero,
                          title: const Text(
                            'Manage inventory',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: const Text(
                              'When checked Medusa will regulate the inventory when orders and returns are made.'),
                          trailing: Switch(
                            value: true,
                            onChanged: (value) {},
                          )),
                      ListTile(
                          contentPadding: EdgeInsets.zero,
                          title: const Text(
                            'Allow backorders',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: const Text(
                              'When checked the product will be available for purchase despite the product being sold out'),
                          trailing: Switch(
                            value: true,
                            onChanged: (value) {},
                          ))
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
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Width',
                          hintText: '100...',
                        ),
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Length',
                          hintText: '100...',
                        ),
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Height',
                          hintText: '100...',
                        ),
                      ),
                      TextFormField(
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
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'MID Code',
                          hintText: 'XDSKLAD9999..."',
                        ),
                      ),
                      TextFormField(
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
                        items: <String>['One', 'Two', 'Free', 'Four']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        hint: const Text('Country of Origin'),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}