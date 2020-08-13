import 'package:flutter/material.dart';
import 'package:flutterapp/ui/page/login/login_one/login_card.dart';

class LoginWidgets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    GestureDetector
    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 100.0,
            ),
            LoginCard(),
          ],
        ),
      ),
    );
  }
}
