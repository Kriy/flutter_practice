import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/bookshelf/bookshelf_header.dart';
import 'package:flutter_app/public.dart';

import 'bookshelf_item_view.dart';

class BookshelfScene extends StatefulWidget {
  @override
  BookshelfState createState() => BookshelfState();
}

class BookshelfState extends State<BookshelfScene> with RouteAware {
  List<Novel> favoriteNovles = [];
  ScrollController scrollController = ScrollController();
  double navAlpha = 0;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      List<Novel> favoriteNovels = [];
      List<dynamic> favoriteResponse = await Request.get(action: 'bookshelf');
      favoriteResponse.forEach((data) {
        favoriteNovels.add(Novel.fromJson(data));
      });

      setState(() {
        this.favoriteNovles = favoriteNovels;
      });
    } catch (e) {
      Toast.show(e.toString());
    }
  }

  Widget buildNavigationBar() {
    return Stack(
      children: <Widget>[
        Positioned(
          right: 0,
          child: Container(
            margin: EdgeInsets.fromLTRB(5, Screen.topSafeHeight, 0, 0),
            child: buildActions(SQColor.white),
          ),
        ),
        Opacity(
          opacity: navAlpha,
          child: Container(
            padding: EdgeInsets.fromLTRB(5, Screen.topSafeHeight, 0, 0),
            height: Screen.navigationBarHeight,
            color: SQColor.white,
            child: Row(
              children: <Widget>[
                SizedBox(
                  width: 103,
                ),
                Expanded(
                  child: Text(
                    '书架',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                buildActions(SQColor.darkGray),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget buildActions(Color iconColor) {
    return Row(
      children: <Widget>[
        Container(
          height: kToolbarHeight,
          width: 44,
          child: Image.asset(
            'img/actionbar_checkin.png',
            color: iconColor,
          ),
        ),
        Container(
          height: kToolbarHeight,
          width: 44,
          child: Image.asset(
            'img/actionbar_search.png',
            color: iconColor,
          ),
        ),
        SizedBox(
          width: 15,
        ),
      ],
    );
  }

  Widget buildFavoriteView() {
    if (favoriteNovles.length <= 1) {
      return Container();
    }
    List<Widget> children = [];
    var novels = favoriteNovles.sublist(1);
    novels.forEach((novel) {
      children.add(BookshelfItemView(novel));
    });
    var width = (Screen.width - 15 * 2 - 24 * 2) / 3;
    children.add(GestureDetector(
      onTap: () {
        eventBus.emit(EventToggleTabBarIndex, 1);
      },
      child: Container(
        color: SQColor.paper,
        width: width,
        height: width / 0.75,
        child: Image.asset('img/bookshelf_add.png'),
      ),
    ));
    return Container(
      padding: EdgeInsets.fromLTRB(15, 20, 15, 15),
      child: Wrap(
        spacing: 23,
        children: children,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SQColor.white,
      body: AnnotatedRegion(
        value: navAlpha > 0.5
            ? SystemUiOverlayStyle.dark
            : SystemUiOverlayStyle.light,
        child: Stack(
          children: <Widget>[
            RefreshIndicator(
              onRefresh: fetchData,
              child: ListView(
                padding: EdgeInsets.only(top: 0),
                controller: scrollController,
                children: <Widget>[
                  favoriteNovles.length > 0
                      ? BookshelfHeader(favoriteNovles[0])
                      : Container(),
                  buildFavoriteView(),
                ],
              ),
            ),
            buildNavigationBar(),
          ],
        ),
      ),
    );
  }
}
