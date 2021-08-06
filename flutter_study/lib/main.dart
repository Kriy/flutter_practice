import 'package:flutter/material.dart';
import 'package:flutter_study/commonwidgets/text_widget.dart';
import 'package:flutter_study/commonwidgets/widget_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Study',
      routes: {
        "": (_) => MyApp(),
        "widget_list": (_) => WidgetList(),
        "text_widget": (_) => TextWidget(),
      },
      initialRoute: "/",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Flutter Study"),
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
              onPressed: () {
                Navigator.pushNamed(context, "widget_list");
              },
              title: "常用Widget讲解",
            ),
            MinWidthWidget(
              onPressed: () {},
              title: "     动画     ",
            ),
          ],
        ),
      ),
    );
  }
}

class MinWidthWidget extends StatelessWidget {
  void Function()? onPressed;
  String title;
  double width;

  MinWidthWidget({
    this.onPressed,
    this.title = "",
    this.width = 100,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed ?? () {},
      child: Container(
        width: width,
        alignment: Alignment.center,
        child: Text(title),
      ),
    );
  }
}
