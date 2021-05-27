import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialButton extends StatelessWidget {
  SocialButton({
    required this.url,
    required this.icon,
    required this.iconColor,
    required this.label,
  });

  final String url;
  final IconData icon;
  final Color iconColor;
  final String label;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => _launchURL(url),
      child: Column(
        children: [
          FittedBox(
            fit: BoxFit.cover,
            child: Icon(
              icon,
              size: 40,
              color: iconColor,
            ),
          ),
          FittedBox(
            fit: BoxFit.cover,
            child: Text(
              label,
            ),
          ),
        ],
      ),
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
                side: BorderSide(color: Colors.black26))),
        elevation: MaterialStateProperty.all(3),
        minimumSize: MaterialStateProperty.all(Size(150, 100)),
        overlayColor: MaterialStateProperty.all(Colors.grey[100]),
        backgroundColor: MaterialStateProperty.all(Colors.white),
        foregroundColor: MaterialStateProperty.all(Color(0xFF000028)),
      ),
    );
  }

  void _launchURL(url) async =>
      await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';
}
