import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter_app/app/request.dart';
import 'package:flutter_app/model/novel.dart';
import 'package:flutter_app/model/novel_comment.dart';
import 'package:flutter_app/public.dart';

class NovelDetailScene extends StatefulWidget {
  final String novelId;

  NovelDetailScene(this.novelId);

  @override
  State<StatefulWidget> createState() => NovelDetailSceneState();
}

class NovelDetailSceneState extends State<NovelDetailScene> with RouteAware {
  Novel novel;
  List<Novel> recommendNovels = [];
  List<NovelComment> comments = [];
  ScrollController scrollController = ScrollController();
  double navAlpha = 0;
  bool isSummaryUnfold = false;
  int commentCount = 0;
  int commentMemberCount = 0;

  @override
  void initState() {
    super.initState();
    fetchData();

    scrollController.addListener(() {
      var offset = scrollController.offset;
      if (offset < 0) {
        if (navAlpha != 0) {
          setState(() {
            navAlpha = 0;
          });
        }
      } else if (offset < 50) {
        setState(() {
          navAlpha = 1 - (50 - offset) / 50;
        });
      } else if (navAlpha != 1) {
        setState(() {
          navAlpha = 1;
        });
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  changeSummaryMaxLines() {
    setState(() {
      isSummaryUnfold = !isSummaryUnfold;
    });
  }

  back() {
    Navigator.pop(context);
  }

  fetchData() async{
    try{
      var novelId = this.widget.novelId;
      var novelResponse = await Request.post(action: 'novel_detail', params: {'id': novelId});

      var commentsResponse = await Request.post(action: 'novel_comment', params: {'id': novelId});
      List<NovelComment> comments = [];
      commentsResponse.forEach((data){
        comments.add(NovelComment.fromJson(data));
      });

      var recommendResponse = await Request.post(action: 'novel_recommend', params: {'id': novelId});
      List<Novel> recommendNovels = [];
      recommendResponse.forEach((data) {
        recommendNovels.add(Novel.fromJson(data));
      });

      setState(() {
        this.novel = Novel.fromJson(novelResponse);
        this.comments = comments;
        this.recommendNovels = recommendNovels;
      });
    }catch(e){
      Toast.show(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  }
}
