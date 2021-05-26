import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:supercharged/supercharged.dart';

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
    return PlayAnimation<int?>(
        tween: 1.tweenTo(200),
        duration: 3.seconds, // define duration
        builder: (context, child, value) {
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
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      side: BorderSide(color: Colors.black26))),
              elevation: MaterialStateProperty.all(3),
              minimumSize: MaterialStateProperty.all(Size(10, 40)),
              overlayColor: MaterialStateProperty.all(Colors.grey[100]),
              backgroundColor: MaterialStateProperty.all(Colors.white),
              foregroundColor: MaterialStateProperty.all(Color(0xFF000028)),
              padding: MaterialStateProperty.all(
                  EdgeInsets.symmetric(vertical: 15, horizontal: 50)),
              textStyle: MaterialStateProperty.all(TextStyle(fontSize: 22)),
            ),
          );
        });
  }

  void _launchURL(url) async =>
      await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';
}
