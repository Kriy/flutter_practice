import 'package:flutter/material.dart';

class ContainerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Container"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text("""
        Container({
            Key? key,
            this.alignment, //子Widget对齐方式
            this.padding, //内边距EdgeInsets
            this.color, //背景颜色,值为一个 Color 对象，不能与 decoration 属性同时设置
            this.decoration, //装饰，背景边框等，不能与 color 属性同时设置，会绘制在 child 之下，也就是会被 child 覆盖,BoxDecoration
            this.foregroundDecoration,  //装饰，但是会绘制在 child 之上，会覆盖 child
            double? width,  //宽度，double
            double? height, //高度，double
            BoxConstraints? constraints,  //约束，这个规则貌似挺复杂的
            this.margin,  //外边距，值为一个 EdgeInsets 对象。EdgeInsets 对象即可调用
            this.transform, //设置Container的转换矩阵
            this.transformAlignment, //转换矩阵对齐方式
            this.child, //子Widget
            this.clipBehavior = Clip.none, //裁剪行为，当decoration不为null时，才有效，默认是不裁剪
                  clipBehavior: Clip.none,	不裁剪
                  clipBehavior: Clip.hardEdge,	裁剪但不应用抗锯齿，裁剪速度比none模式慢一点，但比其他方式快。
                  clipBehavior: Clip.antiAlias,	裁剪而且抗锯齿，以实现更平滑的外观。裁剪速度比antiAliasWithSaveLayer快，比hardEdge慢。
                  clipBehavior: Clip.antiAliasWithSaveLayer,	带有抗锯齿的剪辑，并在剪辑之后立即保存saveLayer
        }) 
            """),
            SizedBox(
              height: 30,
            ),
            Text("基本Container属性"),
            Container(
              color: Colors.orangeAccent,
              height: 100,
              width: 100,
            ),
            Text("设置圆形装饰器"),
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.deepOrange,
                shape: BoxShape.circle,
              ),
            ),
            Text("设置圆角装饰器"),
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                  color: Colors.deepOrange,
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                  border: Border.all(
                    color: Colors.grey,
                    width: 5,
                    style: BorderStyle.solid,
                  )),
            ),
            Text("设置图片装饰器"),
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.deepOrange,
                borderRadius: BorderRadius.all(Radius.circular(6)),
                image: DecorationImage(
                  image: NetworkImage(
                      "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg11.51tietu.net%2Fpic%2F2016-071418%2F20160714181543xyu10ukncwf221991.jpg&refer=http%3A%2F%2Fimg11.51tietu.net&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1631633913&t=75f80738e3612cd81fe7938896de0bcb"),
                  fit: BoxFit.fill,
                ),
                border: Border.all(
                  color: Colors.grey,
                  width: 5,
                  style: BorderStyle.solid,
                ),
              ),
              alignment: Alignment.center,
              child: Text(
                "带有背景图片的Container",
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
            ),
            Text("设置前装饰器，可以看到前装饰器是在背景装饰器之上的"),
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.deepOrange,
              ),
              foregroundDecoration: BoxDecoration(
                color: Colors.yellow,
                borderRadius: BorderRadius.all(Radius.circular(6)),
                border: Border.all(
                  color: Colors.grey,
                  width: 5,
                  style: BorderStyle.solid,
                ),
              ),
              child: Text("前装饰器"),
            ),
          ],
        ),
      ),
    );
  }
}
