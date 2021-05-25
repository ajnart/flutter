import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialButton extends StatelessWidget {
  const SocialButton({
    Key key,
    this.url,
    this.icon,
    this.iconColor,
    this.label,
  }) : super(key: key);

  final String url;
  final IconData icon;
  final Color iconColor;
  final String label;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => _launchURL(url),
      child: Wrap(
        children: [
          Column(
            children: [
              Icon(
                icon,
                color: iconColor,
                size: 40,
              ),
              Text(
                label,
              ),
            ],
          ),
        ],
      ),
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(3),
        minimumSize: MaterialStateProperty.all(Size(200, 80)),
        overlayColor: MaterialStateProperty.all(Colors.grey[100]),
        backgroundColor: MaterialStateProperty.all(Colors.white),
        foregroundColor: MaterialStateProperty.all(Color(0xFF000028)),
        padding: MaterialStateProperty.all(
            EdgeInsets.symmetric(vertical: 15, horizontal: 50)),
        textStyle: MaterialStateProperty.all(TextStyle(fontSize: 22)),
      ),
    );
  }

  void _launchURL(url) async =>
      await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';
}
