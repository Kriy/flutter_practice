import 'package:flutter/material.dart';
import 'package:flutter_app/home/home_model.dart';
import 'package:flutter_app/home/home_section_view.dart';
import 'package:flutter_app/home/novel_cell.dart';
import 'package:flutter_app/home/novel_grid_item.dart';

class NovelFirstHybirdCard extends StatelessWidget {
  final HomeModule cardInfo;

  NovelFirstHybirdCard(this.cardInfo);

  @override
  Widget build(BuildContext context) {
    var novels = cardInfo.books;
    if (novels.length < 3) {
      return Container();
    }

    List<Widget> children = [];
    var bottomNovels = novels.sublist(1);
    bottomNovels.forEach((novel) {
      children.add(NovelGridItem(novel));
    });

    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          HomeSectionView(cardInfo.name),
          NovelCell(novels[0]),
          Container(
            padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
            child: Wrap(spacing: 15, runSpacing: 15, children: children),
          ),
          Container(
            height: 10,
            color: Color(0xFFF5F5F5),
          ),
        ],
      ),
    );
  }
}
