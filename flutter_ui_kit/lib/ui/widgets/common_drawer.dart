import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutterapp/ui/widgets/about_tile.dart';
import 'package:flutterapp/utils/uidata.dart';

class CommonDrawaer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text("Pawan Kumar"),
            accountEmail: Text(
              "mtechviral@gmail.com",
            ),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage(UIData.pkImage),
            ),
          ),
          ListTile(
            title: Text(
              "Profile",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 18.0,
              ),
            ),
            leading: Icon(
              Icons.person,
              color: Colors.blue,
            ),
          ),
          ListTile(
            title: Text(
              "Shopping",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 18.0,
              ),
            ),
            leading: Icon(
              Icons.shopping_cart,
              color: Colors.green,
            ),
          ),
          ListTile(
            title: Text(
              "Dashboard",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 18.0,
              ),
            ),
            leading: Icon(
              Icons.dashboard,
              color: Colors.red,
            ),
          ),
          ListTile(
            title: Text(
              "Timeline",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18.0),
            ),
            leading: Icon(
              Icons.timeline,
              color: Colors.cyan,
            ),
          ),
          Divider(),
          ListTile(
            title: Text(
              "Settings",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18.0),
            ),
            leading: Icon(
              Icons.settings,
              color: Colors.brown,
            ),
          ),
          Divider(),
          MyAboutTile(),
        ],
      ),
    );
  }
}
