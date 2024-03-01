import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class EditVariantsBottomSheet extends StatelessWidget {
  const EditVariantsBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Variants'),
        automaticallyImplyLeading: false,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.save))],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ReorderableListView(
          children: [
            Card(
              key: ValueKey('1'),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text('S / Black'),
                      subtitle: Text('SKU: 1234567890'),
                      trailing: Icon(Icons.drag_handle),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Quantity',
                        hintText: '100...',
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Card(
              key: ValueKey('2'),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text('S / Black'),
                      subtitle: Text('SKU: 1234567890'),
                      trailing: Icon(Icons.drag_handle),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Quantity',
                        hintText: '100...',
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Card(
              key: ValueKey('3'),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text('S / Black'),
                      subtitle: Text('SKU: 1234567890'),
                      trailing: Icon(Icons.drag_handle),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Quantity',
                        hintText: '100...',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
          onReorder: (int oldIndex, int newIndex) {},
        ),
      ),
    );
  }
}
