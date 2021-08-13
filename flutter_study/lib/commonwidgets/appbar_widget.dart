import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppbarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Appbar"),
        centerTitle: true,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text("""
      AppBar({
          Key key,
          this.leading, //如果省略了 leading ，但 AppBar 在带有 Drawer 的 Scaffold 中，则会插入一个 button 以打开 Drawer。如果没有Drawer ， 默认的是个返回箭头，可以通过设置来关闭automaticallyImplyLeading 为false ，
          this.automaticallyImplyLeading = true, // 如果leading!=null，该属性不生效；如果leading==null且为true，左侧leading区域留白；如果leading==null且为false，左侧leading区域扩展给title区域使用
          this.title,//widget类型，即可任意设计样式，表示中间title区域，通常为标题栏
          this.actions,// List<Widget>类型，即可任意设计样式，表示右侧actions区域，可放置多个widget，通常为icon，如搜索icon、菜单icon
          this.flexibleSpace,// 在title上面的一个东西，一般无用
          this.bottom, //PreferredSizeWidget类型，appbar底部区域，通常为Tab控件
          this.elevation, //阴影高度，默认为4
          this.shape,//ShapeBorder 类型，表示描边形状
          this.backgroundColor, //Color类型，背景色 
          this.brightness,//Brightness类型，表示当前appbar主题是亮或暗色调，有dark和light两个值，可影响系统状态栏的图标颜色
          this.iconTheme, //IconThemeData类型，可影响包括leading、title、actions中icon的颜色、透明度，及leading中的icon大小。
          this.actionsIconTheme, //右侧action icon的默认主题
          this.textTheme,// TextTheme类型，文本主题样式，可设置appbar中文本的许多样式，如字体大小、颜色、前景色、背景色等...
          this.primary = true,//true时，appBar会以系统状态栏高度为间距显示在下方；false时，会和状态栏重叠，相当于全屏显示。
          this.centerTitle, // boolean 类型，表示标题是否居中显示
          this.titleSpacing, // flexibleSpace 和 title 的距离  默认是重合的
          this.toolbarOpacity = 1.0,//toolbar区域透明度，不包括flexibleSpace
          this.bottomOpacity = 1.0,//bottom区域透明度
          this.toolbarHeight,//toolbar高度
          this.leadingWidth,//leading宽度
          this.backwardsCompatibility,
          this.toolbarTextStyle,//leading和actions控件默认主题，不包括title
          this.titleTextStyle,//title默认主题
          this.systemOverlayStyle,//系统覆盖样式
      }
            """),
            SizedBox(
              height: 300,
              child: AppBar(
                title: Text("标题"),
                centerTitle: true,
                backgroundColor: Colors.lightBlue,
                actions: [
                  Center(
                    child: Text(
                      "action\n部分",
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Icon(
                    Icons.account_circle_rounded,
                    size: 30,
                  ),
                  Icon(
                    Icons.ac_unit_rounded,
                    size: 30,
                  ),
                  Icon(
                    Icons.add_alarm_rounded,
                    size: 30,
                  ),
                ],
                flexibleSpace: Container(
                  alignment: Alignment.topLeft,
                  width: 220,
                  color: Color(0x90FFB300),
                  child: Text(
                    "flexibleSpace   区域",
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ),
                bottom: PreferredSize(
                  child: Container(
                    color: Colors.amber,
                    child: Text("bottom  区域"),
                  ),
                  preferredSize: Size.fromHeight(100),
                ),
                systemOverlayStyle: SystemUiOverlayStyle.light,
              ),
            ),
            Text(
              "通过上面显示的效果可以看出flexibleSpace的长度是等于整个Appbar的，而且其排版默认是从appbar的左上角开始的，sflexibleSpace相对于顶部区域是在其背景色和其Widget之间，bottom是在flexibleSpace区域之上的，",
            ),
          ],
        ),
      ),
    );
  }
}
