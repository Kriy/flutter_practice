import 'package:flutter/material.dart';
import 'package:flutter_navigator/main.dart';

class PushAndRemoveUnitPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PushAndRemoveUnitState();
}

class _PushAndRemoveUnitState extends State<PushAndRemoveUnitPage> {
  final String name = '测试： pushAndRemoveUntil';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$name'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return PushAndRemoveUnitPage();
                }));
              },
              child: Text('开启无限跳转, 你可以试试左上返回按键'),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) =>
                          MyHomePage(title: '替换的home页')),
                  ModalRoute.withName('/'),
                );
              },
              child: Text("注销所有的界面回首页"),
            ),
          ],
        ),
      ),
    );
  }
}
