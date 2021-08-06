import 'package:flutter/material.dart';
import 'package:flutter_study/main.dart';

class WidgetList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("常用Widget"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              height: 30,
            ),
            MinWidthWidget(
              title: "Text",
              onPressed: () {
                Navigator.pushNamed(context, "text_widget");
              },
            ),
          ],
        ),
      ),
    );
  }
}
