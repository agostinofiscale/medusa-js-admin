import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class EditOptionsBottomSheet extends StatelessWidget {
  const EditOptionsBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Options'),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.save),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Card(
                child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Option Name',
                        hintText: 'Size...',
                      ),
                    ),
                  ),
                  IconButton(onPressed: () {}, icon: Icon(Icons.remove_circle))
                ],
              ),
            )),
            Card(
                child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Option Name',
                        hintText: 'Size...',
                      ),
                    ),
                  ),
                  IconButton(onPressed: () {}, icon: Icon(Icons.remove_circle))
                ],
              ),
            )),
            Card(
                child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Option Name',
                        hintText: 'Size...',
                      ),
                    ),
                  ),
                  IconButton(onPressed: () {}, icon: Icon(Icons.remove_circle))
                ],
              ),
            )),
            Card(
                child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Option Name',
                        hintText: 'Size...',
                      ),
                    ),
                  ),
                  IconButton(onPressed: () {}, icon: Icon(Icons.remove_circle))
                ],
              ),
            )),
            ElevatedButton(onPressed: () {}, child: Text('Add Option'))
          ],
        ),
      ),
    );
  }
}
