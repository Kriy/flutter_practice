import 'package:flutter/material.dart';
import 'package:flutter_zhihu/global_config.dart';

class NoticePage extends StatefulWidget {
  @override
  _NoticePageState createState() => _NoticePageState();
}

class _NoticePageState extends State<NoticePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('通知'),
        ),
        body: Center(
          child: null,
        ),
      ),
      theme: GlobalConfig.themeData,
    );
  }
}
