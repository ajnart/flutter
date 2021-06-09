import 'package:flutter/material.dart';
import 'dart:js' as js;

class SocialCard extends StatelessWidget {
  SocialCard({
    required this.url,
    required this.asset,
    required this.label,
    required this.description,
  });

  final String url;
  final String asset;
  final String label;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          clipBehavior: Clip.hardEdge,
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.5,
            child: Image.asset(
              asset,
              fit: BoxFit.contain,
            ),
          ),
        ),
        Container(
          width: 600,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(label, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              ),
              Text(description),
              Divider(),
              ElevatedButton.icon(
                icon: Icon(Icons.open_in_new),
                label: Text("view deployment"),
                onPressed: () => js.context.callMethod('open', [url]),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
