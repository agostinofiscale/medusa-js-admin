import 'package:flutter/material.dart';

class EditAttributeBottomSheet extends StatelessWidget {
  const EditAttributeBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Attribute')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8, 8, 8, 32),
          child: Column(
            children: [
              Column(
                children: [
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          const ListTile(
                            contentPadding: EdgeInsets.zero,
                            title: Text(
                              'Dimensioni',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                                'Configura per calcolare le tariffe di spedizione più accurate'),
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
              ElevatedButton(
                onPressed: () {},
                child: const Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
