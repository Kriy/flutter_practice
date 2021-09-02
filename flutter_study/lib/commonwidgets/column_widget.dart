import 'package:flutter/material.dart';

class ColumnWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Column"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text("""
        Column({
          Key? key,
          MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,  //主轴方向对齐方式
          MainAxisSize mainAxisSize = MainAxisSize.max, //主轴方向占用空间
          CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center,  //纵轴方向对齐方式
          TextDirection? textDirection, //水平方向子组建排序方向
          VerticalDirection verticalDirection = VerticalDirection.down, //垂直方向子组建排序方向
          TextBaseline? textBaseline, //基线
          List<Widget> children = const <Widget>[], //子组建集
        })
        主轴方向默认是占据上级Widget提供的最大高度
            """),
            Text("主轴对齐方式-头对齐"),
            Container(
              height: 100,
              width: double.infinity,
              color: Colors.redAccent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("上"),
                  Text("中"),
                  Text("下"),
                ],
              ),
            ),
            Text("主轴对齐方式-居中对齐"),
            Container(
              height: 100,
              width: double.infinity,
              color: Colors.redAccent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("上"),
                  Text("中"),
                  Text("下"),
                ],
              ),
            ),
            Text("主轴对齐方式-尾对齐"),
            Container(
              height: 100,
              width: double.infinity,
              color: Colors.redAccent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("上"),
                  Text("中"),
                  Text("下"),
                ],
              ),
            ),
            Text("主轴对齐方式-空白区域居中均分"),
            Container(
              height: 100,
              width: double.infinity,
              color: Colors.redAccent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("上"),
                  Text("中"),
                  Text("下"),
                ],
              ),
            ),
            Text("主轴对齐方式-空白区域每个widget均分"),
            Container(
              height: 100,
              width: double.infinity,
              color: Colors.redAccent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("上"),
                  Text("中"),
                  Text("下"),
                ],
              ),
            ),
            Text("主轴对齐方式-空白区域均分"),
            Container(
              height: 100,
              width: double.infinity,
              color: Colors.redAccent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("上"),
                  Text("中"),
                  Text("下"),
                ],
              ),
            ),
            Text("纵轴对齐方式-头对齐"),
            Container(
              height: 100,
              width: double.infinity,
              color: Colors.redAccent,
              child: Column(
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
              height: 100,
              width: double.infinity,
              color: Colors.redAccent,
              child: Column(
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
              height: 100,
              width: double.infinity,
              color: Colors.redAccent,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text("左"),
                  Text("中"),
                  Text("右"),
                ],
              ),
            ),
            Text("纵轴对齐方式-从右往左排序，尾对齐"),
            Container(
              height: 100,
              width: double.infinity,
              color: Colors.redAccent,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                textDirection: TextDirection.rtl,
                children: [
                  Text("左"),
                  Text("中"),
                  Text("右"),
                ],
              ),
            ),
            Text("纵轴对齐方式-从右往左排序，尾对齐"),
            Container(
              height: 100,
              width: double.infinity,
              color: Colors.redAccent,
              child: Column(
                textBaseline: TextBaseline.ideographic,
                children: [
                  Text("左"),
                  Text("中"),
                  Text("右"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
