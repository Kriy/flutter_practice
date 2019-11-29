import 'package:flutter/cupertino.dart';
import 'package:flutter_app/model/novel.dart';

class NovelCoverView extends StatelessWidget {
  final Novel novel;
  NovelCoverView(this.novel);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Appnavi
      },
    );
  }
}
