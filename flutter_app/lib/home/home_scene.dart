import 'package:flutter/material.dart';
import 'package:flutter_app/app/sq_color.dart';
import 'package:flutter_app/home/home_list_view.dart';
import 'package:flutter_app/home/home_section_view.dart';

class HomeScene extends StatefulWidget {
  @override
  HomeSceneState createState() => HomeSceneState();
}

class HomeSceneState extends State<HomeScene> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          brightness: Brightness.light,
          title: Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: TabBar(
              labelColor: SQColor.darkGray,
              labelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              unselectedLabelColor: SQColor.gray,
              indicatorColor: SQColor.secondary,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorWeight: 3,
              indicatorPadding: EdgeInsets.fromLTRB(8, 0, 8, 5),
              tabs: <Widget>[
                Tab(text: '精选'),
                Tab(text: '女生'),
                Tab(text: '男生'),
                Tab(text: '漫画'),
              ],
            ),
          ),
          backgroundColor: SQColor.white,
          elevation: 0,
        ),
        body: TabBarView(
          children: <Widget>[
            HomeListView(HomeListType.excellent),
            HomeListView(HomeListType.female),
            HomeListView(HomeListType.male),
            HomeListView(HomeListType.cartoon)
          ],
        ),
      ),
    );
  }
}
