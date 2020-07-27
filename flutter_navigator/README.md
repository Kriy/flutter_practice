路由是对屏幕界面的抽象。例如，'/home'将带您进入首页, '/login'将您带到登陆页。
简单说每一个界面都对应相应的 Page.
我们可以把Router看成一个班级. 每一个学生都是注册在这个班级上的的人, 通过老师点名, 叫出这个学生, 或者通过老师通过不点名, 通过亲手抓的方式, 把学生叫出来
在些次Flutter demo应用程序中我们声明几个个路由
MaterialApp(
    title: 'Flutter Demo',
    theme: ThemeData(
        primarySwatch: Colors.blue,
    ),
    home: MyHomePage(title: 'Flutter Demo Home Page'),
    routes: <String, WidgetBuilder> {
        '/xiaoming': (_) => new XiaoMingPage(),
        '/lili': (_) => new LiLiPage(),
    },
);

https://user-gold-cdn.xitu.io/2019/1/17/1685c7c2ac2b4a33?imageslim

Router的管理
有了学生, 就会涉及学生的管理, 不然每个学生毫无规矩, 整个班级就会很混乱. 有的学生想做在第一排, 有的学生想坐在最后一排, 整个教室将会成为一锅粥 .这个时候我们今天的主角Navigator就可以登场了.
Navigator

Navigator用来管理堆栈功能（即push和pop）

如果你对堆栈有基本的了解，那么你就知道push和pop, push 是将元素添加到堆栈的顶部，pop是从同一堆栈中删除顶部元素。
因此，在Flutter的情况下，当我们导航到另一个屏幕时，我们使用Navigator.push方法将新屏幕添加到堆栈的顶部。当然，这些pop方法会从堆栈中删除该屏幕。
在此，让我们以上图为例，让我们看看如何从屏幕1移动到屏幕2.
初始状态:

点击 小明滚出来 进行push小明的界面入栈

点击顶部回退按钮或者android的返回按键, flutter会默认调取flutter.pop方法, 将 小明界面 弹出

点击 小丽滚出来 进入push小丽的界面入栈

这就是整个上图栈操作的全过程
总结

其实我还没写完

写到这里,  大家可能觉得小编说的, 某度一抓一把. 没什么干货, 小编写出来纯是混脸熟, 那么接下来干货来了.
 我查看了好多份相关文章, 基本上讲讲push方法pushName方法这个文章就结束了. 但是flutter的NB之处并不是这二个方法就可以展示的.
静态方法
以下是Navigator的官网静态方法, 接下来我将讲解其中重点部分.

https://user-gold-cdn.xitu.io/2019/1/18/1686158cf4265a35?imageView2/0/w/1280/h/960/format/webp/ignore-error/1

### maybePop
如果你在应用首页(堆栈只有一个元素)直接弹出堆栈中唯一的界面, 恭喜你,明天可以去财务结算了.为了避免发生这种问题,我们可以调用maybePop()方法。这个方法, 是可以试着弹弹,弹不走拉倒的方法.

效果测试:

这是gif中, 最终的几个按钮的按钮的代码
// 试试然后成功反回
RaisedButton(
    onPressed: () {
        Navigator.maybePop(context);
    },
    child: Text("栈中测试试maybePop"),
),
// 试试,发现自己是栈里唯一的元素, 放弃pop
RaisedButton(
    onPressed: () {
        Navigator.maybePop(context);
    },
    child: Text("栈首测试试maybePop"),
),
// 直接退, 然后挂了
RaisedButton(
    onPressed: () {
        Navigator.pop(context);
    },
    child: Text("直接pop()"),
),
复制代码canPop
我把canPop放到maybePop之后去讲. 是因为他很简单(其实我是懒得做demo图). canPop只有在栈中只有一个元素的时候返回 false, 其它都是 true.

maybePop可以理解成
Navigator.canPop(context) ? Navigator.pop(context): null;
复制代码push和pushNamed
push与pushNames运行效果相同,只是接口的调用方式不同, 都是将一个界面压入栈中. 区别在于, push是亲手把界面扔入栈中, 而pushNames则是通过点名的方式通过router让界面自己进入栈中.
// push的调用方法
Navigator.push(context,  new MaterialPageRoute(
    builder: (context)  {
      return Scaffold(
        appBar: AppBar(
          title: Text('我是新的界面'),
        )
      );
    }
));

// pushNamed的调用方法
// 先在Router上定义Page;
routes: <String, WidgetBuilder> {
    '/xiaoming': (_) => new XiaoMingPage(),
}
...
Navigator.pushNamed(context, '/XiaoMingPage');
复制代码pushReplacement 和 pushReplacementNamed
同上, 二者都是用来替代当前栈中栈顶元素. 只是接口的调用方式不同. 这点不多说了.效果具体看demo, 在二界测试页点击按钮后. 跳转到新界面, 再次点击反回, 我们回到了首页

### pushAndRemoveUntil 和 pushNamedAndRemoveUntil
当我们构建一个很复杂的应用，用户登录，滚动, 查看各种信息...用户想注销并回到首页，你不能只是简单地push一个首页, 在这样的情况下, 您应该删除堆栈中的所有路由，以便用户在注销后无法返回到先前的界面.
官方的Demo中的方法, 回到栈底, 并入栈一个 MyHomePage.

// flutter sample
void _finishAccountCreation() {
  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder: (BuildContext context) => MyHomePage()),
    ModalRoute.withName('/'),
  );
}
复制代码popUntil
当我们构建一个多表单创建的场景，一个用户需要按次序在不同 Page 填写不同的表单, 当用户填写至的第三页时，用户决定取消填写表单, 我们期望的逻辑是, 回到填写表单之前的某一页。

https://juejin.im/post/5c3ed794f265da616b10f14e

Navigator.popUntil(context, ModalRoute.withName('/Dashboard'));
