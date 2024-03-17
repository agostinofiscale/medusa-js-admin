import 'package:flutter/material.dart';
import 'package:medusa_js_admin/data/models/Source.dart';

class DeleteSourceBottomSheet extends StatelessWidget {
  final Source source;

  final Function onDelete;

  const DeleteSourceBottomSheet({Key? key, required this.source, required this.onDelete}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text('Are you sure you want to delete this source?'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => onDelete(source), 
              child: Text('Delete'),
            ),
          ],
        )
      ),
    );
  }
}