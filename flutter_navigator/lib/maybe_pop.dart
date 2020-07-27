import 'package:flutter/material.dart';

class MaybePop extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MaybeState();
}

class _MaybeState extends State<MaybePop> {
  final String name = '我在二级界面,测试maybepop';

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
                Navigator.maybePop(context);
              },
              child: Text('栈中测试maybepop'),
            ),
          ],
        ),
      ),
    );
  }
}
