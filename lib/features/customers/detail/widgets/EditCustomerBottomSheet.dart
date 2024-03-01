import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class EditCustomerBottomSheet extends StatelessWidget {
  const EditCustomerBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Customer'),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.save),
          ),
        ],
      ),
      body: Center(
          child: Column(
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'First Name', hintText: 'First Name'),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'First Name', hintText: 'First Name'),
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
                  TextFormField(
                     readOnly: true,

                    decoration: InputDecoration(
                        labelText: 'Email', hintText: '...', prefix: Icon(Icons.block)),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Phone number', hintText: '  '),
                  ),
                ],
              ),
            ),
          ),
          // TODO: Implement meta data
        ],
      )),
    );
  }
}
