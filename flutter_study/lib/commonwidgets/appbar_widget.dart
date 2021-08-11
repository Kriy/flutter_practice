import 'package:flutter/material.dart';

class AppbarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Appbar"),
        centerTitle: true,
      ),
    );
  }
}
