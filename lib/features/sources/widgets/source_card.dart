import 'package:flutter/material.dart';
import 'package:medusa_js_admin/data/models/Source.dart';

class SourceCard extends StatelessWidget {
  final Source source;

  final Function onSelect;

  final Function onEdit;

  const SourceCard(
      {Key? key,
      required this.source,
      required this.onSelect,
      required this.onEdit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
              leading: const Icon(Icons.link),
              title: Text('Name: ${source.name}'),
              subtitle: Text('URL: ${source.url}'),
              trailing: IconButton(
                onPressed: () => onEdit(source),
                icon: const Icon(Icons.edit),
              )),
          Text(source.id != null ? source.id! : 'NO'),
          ElevatedButton(
            onPressed: () => onSelect(source),
            child: const Text('Select source'),
          )
        ],
      ),
    );
  }
}
