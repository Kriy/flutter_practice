import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class TextWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Text"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text("""
    Text(
        this.data, {//要展示的数据内容，必须填写的参数
        Key key,
        this.style,//text类型，一般使用TextStyle
        this.strutStyle,//StrutStyle,影响Text在垂直方向上的布局
        this.textAlign,//文本应如何水平对齐enum：
        this.textDirection,//相对TextAlign中的start、end而言有用（当start使用了ltr相当于end使用了rtl，也相当于TextAlign使用了left）
        this.locale,//Locale，当相同的Unicode字符可以根据不同的地区以不同的方式呈现时，用于选择字体 
        this.softWrap,//bool 是否自动换行（true自动换行，false单行显示，超出屏幕部分默认截断处理）
        this.overflow,//TextOverflow，内容溢出时的处理方式
        this.textScaleFactor,//double 设置文字的放大缩小，例如，fontSize=10，this.textScaleFactor=2.0，最终得到的文字大小为10*2.0
        this.maxLines,//int 设置文字的最大展示行数
        this.semanticsLabel,//string,语义描述标签，相当于此text的别名
        this.textWidthBasis,//TextWidthBasis 测量一行或多行文本宽度
    })
            """),
            // DefaultTextStyle(style:, child: child),
            Text('普通文本样式'),
            Container(
              padding: EdgeInsets.all(10),
              child: InkWell(
                onTap: () {
                  Fluttertoast.showToast(msg: "点击");
                },
                child: Text('点击文本'),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
              child: Text(
                '自定义文本颜色',
                style: TextStyle(color: Color.fromRGBO(234, 200, 134, 1)),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
              child: Text(
                '文本背景颜色',
                style: TextStyle(backgroundColor: Colors.red),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
              child: Text(
                '文本字体大小',
                style: TextStyle(fontSize: 30.0),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
              child: Text(
                '文本加粗',
                style: TextStyle(fontWeight: FontWeight.w900),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
              child: Text(
                '文本斜体',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
              child: Text(
                '文本字母间隙space',
                style: TextStyle(letterSpacing: 2),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
              child: Text(
                '文本单词间距 word space',
                style: TextStyle(wordSpacing: 10),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
              child: Text(
                '文本行高',
                style: TextStyle(height: 3, backgroundColor: Colors.red),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
              child: Text(
                '文本阴影shadows',
                style: TextStyle(shadows: [
                  Shadow(
                      color: Colors.black, offset: Offset(6, 3), blurRadius: 10)
                ]),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
              child: Text(
                '文本文字删除线',
                style: TextStyle(
                    decoration: TextDecoration.lineThrough,
                    decorationColor: Colors.red),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
              child: Text(
                '文本文字底边线',
                style: TextStyle(
                    height: 3,
                    decoration: TextDecoration.underline,
                    decorationStyle: TextDecorationStyle.double),
              ),
            ),
            Container(
              // margin: EdgeInsets.only(top: 50.0, left: 120.0),
              constraints: BoxConstraints.tightFor(width: 200.0, height: 50.0),
              //卡片大小
              decoration: BoxDecoration(
                  //背景装饰
                  color: Colors.red,
                  boxShadow: [
                    //卡片阴影
                    BoxShadow(
                        color: Colors.black54,
                        offset: Offset(2.0, 2.0),
                        blurRadius: 4.0)
                  ]),
              // alignment: Alignment.center,
              child: Text(
                '文本对齐方式  ',
                // textDirection: TextDirection.rtl,
                textAlign: TextAlign.left,
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
              child: Text(
                '文本换行测试softWrap（自动换行）文本换行测试（自动换行）文本换行测试（自动换行）文本换行测试（自动换行）文本换行测试（自动换行）',
                softWrap: true,
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
              child: Text(
                '文本换行测试softWrap（不换行）文本换行测试（不换行）文本换行测试（不换行）文本换行测试（不换行）文本换行测试（不换行）',
                softWrap: false,
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
              child: Text(
                '文本溢出测试overflow ellipsis文本溢出测试文本溢出测试文本溢出测试文本溢出测试文本溢出测试',
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
              child: Text(
                '文本溢出测试overflow clip文本溢出测试文本溢出测试文本溢出测试文本溢出测试文本溢出测试',
                overflow: TextOverflow.clip,
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
              child: Text(
                '文本溢出测试overflow fade文本溢出测试文本溢出测试文本溢出测试文本溢出测试文本溢出测试',
                overflow: TextOverflow.fade,
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
              child: Text(
                '文本显示行数2文本显示行数2文本显示行数2文本显示行数2文本显示行数2文本显示行数2文本显示行数2文本显示行数2文本显示行数2文本显示行数2文本显示行数2',
                maxLines: 2,
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
              child: Text.rich(TextSpan(children: [
                TextSpan(
                    text: 'TextSpan点击处理',
                    style: new TextStyle(
                      color: Colors.blue,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        //点击具体事件处理
                        Fluttertoast.showToast(msg: "点击");
                      }),
                TextSpan(
                    text: '100',
                    style: TextStyle(
                        color: Color.fromRGBO(255, 85, 46, 1),
                        fontSize: 18.0,
                        fontWeight: FontWeight.w700)),
                TextSpan(
                    text: '100',
                    style: TextStyle(
                        color: Color.fromRGBO(255, 85, 46, 1),
                        fontSize: 24.0,
                        //字体加粗
                        fontWeight: FontWeight.w700)),
                TextSpan(
                    text: '100',
                    style: TextStyle(
                      decoration: TextDecoration.lineThrough,
                      color: Color.fromRGBO(153, 153, 153, 1),
                      fontSize: 14.0,
                      //字体加粗
                      // fontWeight: FontWeight.w700
                    )),
                TextSpan(text: '拼接普通文本拼接普通文本拼接普通文本拼接普通文本拼接普通文本')
              ])),
            )
          ],
        ),
      ),
    );
  }
}
