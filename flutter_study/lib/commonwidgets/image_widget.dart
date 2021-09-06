import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
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
            Text(
                  """
        Image({
            Key? key,
            required this.image, //ImageProvider - 要显示的图像
            this.frameBuilder,
            this.loadingBuilder,
            this.errorBuilder,
            this.semanticLabel,
            this.excludeFromSemantics = false,
            this.width, //double - 图像的宽度
            this.height,  //double - 图像的高度
            this.color, //Color - 该颜色与每个图像像素混合colorBlendMode
            this.colorBlendMode, //BlendMode - 用于 color 与此图像结合使用
            this.fit, //BoxFit - 图像在布局中分配的空间
            this.alignment = Alignment.center, //AlignmentGeometry - 图像边界内对齐图像
            this.repeat = ImageRepeat.noRepeat, //ImageRepeat - 未充分容器时，是否重复图片
            this.centerSlice, //Rect - 九片图像的中心切片
            this.matchTextDirection = false,  //bool - 是否在图像的方向上绘制图像 TextDirection
            this.gaplessPlayback = false, //bool - 当图像提供者发生变化时，是继续显示旧图像（true）还是暂时不显示（false）
            this.isAntiAlias = false,
            this.filterQuality = FilterQuality.low,
        })
                                                      
            """,
            ),
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
          ],
        ),
      ),
    );
  }
}
