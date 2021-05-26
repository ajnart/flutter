import 'package:flutter/material.dart';
import 'color_palette.dart';

class SideBar extends StatefulWidget {
  @override
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
      child: Container(
        color: AppColor.bgSideMenu,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Text(
                "Aj-Dash",
                style: TextStyle(
                  color: AppColor.yellow,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            DrawerListTile(
              title: "Dashboard",
              icon: Icons.home,
              press: () {},
            ),
            DrawerListTile(
              title: "Recruitment",
              icon: Icons.menu_book,
              press: () {},
            ),
            DrawerListTile(
              title: "Onboarding",
              icon: Icons.article,
              press: () {},
            ),
            DrawerListTile(
              title: "Reports",
              icon: Icons.analytics,
              press: () {},
            ),
            DrawerListTile(
              title: "Calendar",
              icon: Icons.calendar_today,
              press: () {},
            ),
            DrawerListTile(
              title: "Settings",
              icon: Icons.settings,
              press: () {},
            ),
            Spacer(),
            Image.asset("assets/sidebar_image.png")
          ],
        ),
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback press;

  const DrawerListTile({Key key, this.title, this.icon, this.press})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: Icon(icon),
      title: Text(
        title,
        style: TextStyle(color: AppColor.white),
      ),
    );
  }
}
