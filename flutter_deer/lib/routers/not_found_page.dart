
import 'package:flutter/material.dart';
import 'package:flutterdeer/widgets/my_app_bar.dart';
import 'package:flutterdeer/widgets/state_layout.dart';

class NotFoundPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MyAppBar(
        centerTitle: '页面不存在',
      ),
      body: StateLayout(
        type: StateType.account,
        hintText: '页面不存在',
      ),
    );
  }
}
