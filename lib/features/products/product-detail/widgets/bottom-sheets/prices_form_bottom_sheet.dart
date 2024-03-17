import 'package:flutter/material.dart';

class EditPricesBottomSheet extends StatelessWidget {
  const EditPricesBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Edit Prices'),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.close),
          ),
        ],
      ),
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
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text(
                        'S / BLACK',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                          'Medusa T-Shirt'),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Price in eur',
                        hintText: '100...',
                      ),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Price in usd',
                        hintText: '100...',
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text(
                        'S / BLACK',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                          'Medusa T-Shirt'),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Price in eur',
                        hintText: '100...',
                      ),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Price in usd',
                        hintText: '100...',
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text(
                        'S / BLACK',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                          'Medusa T-Shirt'),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Price in eur',
                        hintText: '100...',
                      ),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Price in usd',
                        hintText: '100...',
                      ),
                    ),
                  ],
                ),
              ),
            )
            ],
          )
          ),
      ),
    );
  }
}