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
              title: "Scaffold",
              onPressed: () {
                Navigator.pushNamed(context, "scaffold_widget");
              },
            ),
            MinWidthWidget(
              title: "Appbar",
              onPressed: () {
                Navigator.pushNamed(context, "appbar_widget");
              },
            ),
            MinWidthWidget(
              title: "Container",
              onPressed: () {
                Navigator.pushNamed(context, "container_widget");
              },
            ),
            MinWidthWidget(
              title: "Text",
              onPressed: () {
                Navigator.pushNamed(context, "text_widget");
              },
            ),
            MinWidthWidget(
              title: "Column",
              onPressed: () {
                Navigator.pushNamed(context, "column_widget");
              },
            ),
          ],
        ),
      ),
    );
  }
}
