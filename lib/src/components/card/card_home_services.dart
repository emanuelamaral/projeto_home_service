import 'package:flutter/material.dart';

class CardHomeServicesComponent extends StatelessWidget {
  const CardHomeServicesComponent(
      {super.key, required this.icon, required this.bottomTitle});

  final Icon icon;
  final String bottomTitle;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16.0),
      child: Column(
        children: [
          Icon(Icons.format_paint_outlined),
          ListTile(
            subtitle: Text('Pintura'),
          ),
        ],
      ),
    );
  }
}
