import 'package:flutter/material.dart';

class RowWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Row"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text("""
        Row({
          Key? key,
          MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start, //主轴方向对齐方式（横向）
          MainAxisSize mainAxisSize = MainAxisSize.max, //主轴方向占用空间
          CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center,  //纵轴方向对齐方式
          TextDirection? textDirection, //水平方向子组件排序方向
          VerticalDirection verticalDirection = VerticalDirection.down, //垂直方向子组件排序方向
          TextBaseline? textBaseline, // NO DEFAULT: we don't know what the text's baseline should be
          List<Widget> children = const <Widget>[],
        })
        对于Row主轴是水平方向，纵轴是垂直方向
            """),
            Text("主轴对齐方式-头对齐"),
            Container(
              height: 50,
              width: double.infinity,
              color: Colors.redAccent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("左"),
                  Text("中"),
                  Text("右"),
                ],
              ),
            ),
            Text("主轴对齐方式-居中对齐"),
            Container(
              height: 50,
              width: double.infinity,
              color: Colors.redAccent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("左"),
                  Text("中"),
                  Text("右"),
                ],
              ),
            ),
            Text("主轴对齐方式-尾对齐"),
            Container(
              height: 50,
              width: double.infinity,
              color: Colors.redAccent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("左"),
                  Text("中"),
                  Text("右"),
                ],
              ),
            ),
            Text("纵轴对齐方式-头对齐"),
            Container(
              height: 50,
              width: double.infinity,
              color: Colors.redAccent,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("左"),
                  Text("中"),
                  Text("右"),
                ],
              ),
            ),
            Text("纵轴对齐方式-居中对齐"),
            Container(
              height: 50,
              width: double.infinity,
              color: Colors.redAccent,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("左"),
                  Text("中"),
                  Text("右"),
                ],
              ),
            ),
            Text("纵轴对齐方式-尾对齐"),
            Container(
              height: 50,
              width: double.infinity,
              color: Colors.redAccent,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text("左"),
                  Text("中"),
                  Text("右"),
                ],
              ),
            ),
            Text("主轴对齐方式-尾对齐-从右往左排序"),
            Container(
              height: 50,
              width: double.infinity,
              color: Colors.redAccent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                textDirection: TextDirection.rtl,
                children: [
                  Text("左"),
                  Text("中"),
                  Text("右"),
                ],
              ),
            ),
            Text("纵轴对齐方式-尾对齐-从上往下排序"),
            Container(
              height: 50,
              width: double.infinity,
              color: Colors.redAccent,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                verticalDirection: VerticalDirection.up,
                children: [
                  Text("左"),
                  Text("中"),
                  Text("右"),
                  Container(
                    width: 1,
                    height: double.infinity,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
