import 'package:flutter/material.dart';

class ProfileTile extends StatelessWidget {
  final title;
  final subtitle;
  final textColor;

  ProfileTile({this.title, this.subtitle, this.textColor});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          title,
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700),
        ),
        SizedBox(
          height: 5.0,
        ),
        Text(
          subtitle,
          style: TextStyle(
            fontSize: 15.0,
            fontWeight: FontWeight.normal,
            color: textColor,
          ),
        ),
      ],
    );
  }
}
