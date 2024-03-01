import 'package:flutter/material.dart';

class AddDiscountBottomSheet extends StatelessWidget {
  const AddDiscountBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Discount'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Card(
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(children: [
                    ListTile(
                      title: Text('Discount type'),
                    ),
                    Card(
                      child: RadioListTile(
                        title: Text('Percentage'),
                        subtitle: Text('Discount applied in %'),
                        value: false,
                        groupValue: null,
                        onChanged: (value) {},
                      ),
                    ),
                    Card(
                      child: RadioListTile(
                        title: Text('Fixed amount'),
                        subtitle: Text('Discount applied in fixed amount'),
                        value: false,
                        groupValue: null,
                        onChanged: (value) {},
                      ),
                    ),
                    Card(
                      child: RadioListTile(
                        title: Text('Free shipping'),
                        subtitle: Text('Free shipping on all products'),
                        value: false,
                        groupValue: null,
                        onChanged: (value) {},
                      ),
                    ),
                    ListTile(
                      title: Text('Allocation (For fixed amount discount)'),
                    ),
                    Card(
                      child: RadioListTile(
                        title: Text('Total amount'),
                        subtitle: Text('Apply discount on total amount'),
                        value: false,
                        groupValue: null,
                        onChanged: (value) {},
                      ),
                    ),
                    Card(
                      child: RadioListTile(
                        title: Text('Item specific'),
                        subtitle: Text('Apply discount on specific items'),
                        value: false,
                        groupValue: null,
                        onChanged: (value) {},
                      ),
                    ),
                  ]),
                ),
              ),
              Card(
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    children: [
                      DropdownButton(
                        items: [],
                        onChanged: (value) {},
                      ),
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Discount value',
                          hintText: 'Enter discount value',
                        ),
                      ),
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Discount value',
                          hintText: 'Enter discount value',
                        ),
                      ),
                      Text('The code your customers will enter during checkout. This will appear on your customer’s invoice. Uppercase letters and numbers only.'),
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Discount value',
                          hintText: 'Enter discount value',
                        ),
                      ),
                      CheckboxListTile(
                        value: false,
                        onChanged: (b) {}, 
                        title: Text('')
                      ),
                    ],
                  ),
                ),
              ),
              Card(),
              Card(),
              // TODO: Add meta data card
            ],
          ),
        ),
      ),
    );
  }
}
