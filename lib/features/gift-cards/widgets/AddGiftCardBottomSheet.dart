import 'package:flutter/material.dart';

class AddGiftCardBottomSheet extends StatelessWidget {
  const AddGiftCardBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Gift Card'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
          child: Column(
        children: [
          Flexible(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Card(
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          ListTile(
                            contentPadding: EdgeInsets.zero,
                            title: const Text(
                              'Details',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          TextField(
                            decoration: InputDecoration(labelText: 'Region'),
                          ),
                          TextField(
                            decoration: InputDecoration(labelText: 'Amount'),
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
                          ListTile(
                              contentPadding: EdgeInsets.zero,
                              title: const Text(
                                'Gift Card has an expiry date?',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              subtitle: const Text(
                                  'Schedule the Gift Card to deactivate in the future.'),
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
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          ListTile(
                            contentPadding: EdgeInsets.zero,
                            title: const Text(
                              'Recipient',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          TextField(
                            decoration: InputDecoration(labelText: 'Email'),
                          ),
                          TextField(
                            maxLines: 5,
                            decoration:
                                InputDecoration(labelText: 'Personal message'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: ElevatedButton(
                  onPressed: () {}, child: Text('Create Gift Card')),
            ),
          )
        ],
      )),
    );
  }
}
