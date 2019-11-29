import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/model/novel.dart';
import 'package:flutter_app/novel_detail/novel_detail_scene.dart';

class AppNavigator {
  static push(BuildContext context, Widget scene) {
    Navigator.push(
        context, MaterialPageRoute(builder: (BuildContext context) => scene));
  }
  
  static pushNovelDetail(BuildContext context, Novel novel){
    AppNavigator.push(context, NovelDetailScene(novel.id));
  }

  static pushLogin(BuildContext context){
    Navigator.push(context, MaterialPageRoute(builder:(context){
      return LoginScene();
    }));
  }
  
  
}
