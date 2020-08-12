import 'package:flutter/material.dart';
import 'package:flutterapp/utils/uidata.dart';

class MyApp extends StatelessWidget {
  final materialApp = MaterialApp(
    title: UIData.appName,
    theme: ThemeData(
      primaryColor: Colors.black,
      fontFamily: UIData.quickFont,
      primarySwatch: Colors.amber
    ),
    debugShowCheckedModeBanner: false,
    showPerformanceOverlay: false,
//    home: HomePage(),

  );

  @override
  Widget build(BuildContext context) => materialApp;
}
