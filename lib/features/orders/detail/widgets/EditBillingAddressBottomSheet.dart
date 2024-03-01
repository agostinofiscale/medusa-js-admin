import 'package:flutter/material.dart';

class EditBillingAddressBottomSheet extends StatelessWidget {
  
  EditBillingAddressBottomSheet();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            'Change customer',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}