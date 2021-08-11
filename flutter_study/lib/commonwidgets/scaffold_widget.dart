import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ScaffoldWidget extends StatefulWidget {
  @override
  ScaffoldWidgetState createState() => ScaffoldWidgetState();
}

class ScaffoldWidgetState extends State<ScaffoldWidget> {
  bool changeLocation = false;
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scaffold"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text("""
      //脚手架
      Scaffold({
          Key key,
          this.appBar,//设置标题栏，显示在脚手架顶部
          this.body,//设置脚手架内容区域控件
          this.floatingActionButton,//设置显示在上层区域的按钮，默认位置位于右下角
          this.floatingActionButtonLocation,//设置floatingActionButton的位置
          this.floatingActionButtonAnimator,//floatingActionButton位置变化时动画
          this.persistentFooterButtons,//一组显示在脚手架底部的按钮(在bottomNavigationBar底部导航栏的上面)
          this.drawer,//设置左边侧边栏
          this.onDrawerChanged,//左边侧边栏打开/关闭回调
          this.endDrawer,//设置右边侧边栏
          this.onEndDrawerChanged,//右边侧边栏打开/关闭回调
          this.bottomNavigationBar,//设置脚手架 底部导航栏
          this.bottomSheet,//底部抽屉栏
          this.backgroundColor,//设置脚手架内容区域的颜色
          this.resizeToAvoidBottomInset = true,// 设置键盘弹起时是否会遮挡底部的布局，false则会进行遮挡，true则不会进行遮挡。
          this.primary = true,//脚手架是否显示在状态栏底部
          this.drawerDragStartBehavior = DragStartBehavior.start,//处理拖动行为的开始方式，默认是DragStartBehavior.start
          this.extendBody = false,//控制body底部的可显示范围是否在bottomNavigationBar和persistentFooterButtons之上，如果设置为True则会直接显示到屏幕的底部，而不是bottomNavigationBar和persistentFooterButtons的上面。
          this.extendBodyBehindAppBar = false,//控制是否是从屏幕顶部开始显示，而不是从AppBar下面开始显示
          this.drawerScrimColor,//设置当Drawer打开的时候下面内容的遮挡颜色,默认为半透明颜色
          this.drawerEdgeDragWidth,设置可拖拽区域宽度，在区域内才能拖拽出抽屉
          this.drawerEnableOpenDragGesture = true,//左边侧边栏拖拽手势是否可用
          this.endDrawerEnableOpenDragGesture = true,//右边侧边栏拖拽手势是否可用
          this.restorationId,//复位ID
        })
          """),
            SizedBox(
              height: 150,
              child: Scaffold(
                appBar: AppBar(
                  title: Text("标题"),
                  centerTitle: true,
                ),
                body: Center(
                  child: Text("Body"),
                ),
              ),
            ),
            Divider(
              height: 3,
              color: Colors.black,
            ),
            SizedBox(
              height: 600,
              child: Scaffold(
                //标题栏
                appBar: AppBar(
                  title: Text("标题"),
                  centerTitle: true,
                ),
                //内容区域
                body: Center(
                  child: Text("Body"),
                ),
                extendBodyBehindAppBar: false,
                // bottomSheet: Container(
                //   width: double.infinity,
                //   height: 200,
                //   color: Colors.amberAccent,
                // ),
                persistentFooterButtons: [
                  Text("123"),
                  Text("123"),
                  Text("123"),
                  Text("123"),
                  Text("123"),
                ],
                backgroundColor: Colors.deepOrangeAccent,
                floatingActionButton: FloatingActionButton(
                  onPressed: () {
                    Fluttertoast.showToast(msg: "点击");
                    setState(() {
                      changeLocation = !changeLocation;
                    });
                  },
                  child: Text("点击"),
                ),
                floatingActionButtonLocation: changeLocation
                    ? FloatingActionButtonLocation.centerFloat
                    : FloatingActionButtonLocation.endFloat,
                floatingActionButtonAnimator:
                    FloatingActionButtonAnimator.scaling,
                drawer: Container(
                  width: 200,
                  height: double.infinity,
                  color: Colors.orangeAccent,
                  child: Center(
                    child: Text("左边侧边栏"),
                  ),
                ),
                onDrawerChanged: (isOpen) {
                  Fluttertoast.showToast(msg: isOpen ? "左边打开" : "左边关闭");
                },
                drawerEnableOpenDragGesture: true,
                endDrawer: Container(
                  width: 200,
                  height: double.infinity,
                  color: Colors.orangeAccent,
                  child: Center(
                    child: Text("右边侧边栏"),
                  ),
                ),
                onEndDrawerChanged: (isOpen) {
                  Fluttertoast.showToast(msg: isOpen ? "右边打开" : "右边关闭");
                },
                drawerDragStartBehavior: DragStartBehavior.down,
                endDrawerEnableOpenDragGesture: false,
                drawerScrimColor: Colors.transparent,
                drawerEdgeDragWidth: 100.0,
                bottomNavigationBar: BottomNavigationBar(
                  type: BottomNavigationBarType.fixed,
                  currentIndex: currentIndex,
                  onTap: (index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  items: [
                    BottomNavigationBarItem(
                        icon: Icon(Icons.accessibility), label: "首页"),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.account_circle_rounded), label: "我的"),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 500,
              child: Scaffold(
                appBar: AppBar(
                  title: Text("标题"),
                ),
                body: Center(
                  child: Text("body"),
                ),
                bottomNavigationBar: BottomAppBar(
                    shape: const CircularNotchedRectangle(),
                    child: Row(
                      children: <Widget>[
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.home),
                        ),
                        SizedBox(),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.business),
                        ),
                      ],
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                    )),
                floatingActionButton: FloatingActionButton(
                  onPressed: () {
                    Fluttertoast.showToast(msg: "点击");
                  },
                  tooltip: 'Increment Counter',
                  child: Icon(Icons.add),
                ),
                floatingActionButtonLocation:
                    FloatingActionButtonLocation.centerDocked,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
