import 'package:flutter/material.dart';
import 'dart:js' as js;
import 'package:intl/intl.dart';

import 'package:getwidget/getwidget.dart';

class SocialCard extends StatelessWidget {
  SocialCard({
    required this.url,
    required this.asset,
    required this.label,
    required this.description,
    this.date,
  });

  final String url;
  final String asset;
  final String label;
  final String description;
  final DateTime? date;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => js.context.callMethod('open', [url]),
      child: GFCard(
        boxFit: BoxFit.cover,
        imageOverlay: AssetImage(asset),
        image: Image.asset(asset),
        showImage: true,
        title: GFListTile(
          title: Column(
            children: [
              Text(
                label,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              if (date != null) Text(DateFormat.yMMMd().format(date!)),
            ],
          ),
        ),
        content: Text(description),
      ),
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0), side: BorderSide(color: Colors.black26))),
        backgroundColor: MaterialStateProperty.all(Colors.white),
        foregroundColor: MaterialStateProperty.all(Color(0xFF000028)),
      ),
    );
  }
}