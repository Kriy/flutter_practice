import 'package:flutter/material.dart';
import 'package:flutter_zhihu/global_config.dart';

class SearchPage extends StatefulWidget {
  @override
  SearchPageState createState() => SearchPageState();
}

class SearchPageState extends State<SearchPage> {
  Widget searchInput() {
    return Container(
      child: Row(
        children: <Widget>[
          Container(
            child: FlatButton.icon(
                onPressed: () {},
                icon: Icon(
                  Icons.arrow_back,
                  color: GlobalConfig.fontColor,
                ),
                label: Text('')),
            width: 60.0,
          ),
          Expanded(
            child: TextField(
              autofocus: true,
              decoration: InputDecoration.collapsed(
                  hintText: '搜索庇护内容',
                  hintStyle: TextStyle(
                    color: GlobalConfig.fontColor,
                  )),
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(const Radius.circular(4.0)),
          color: GlobalConfig.searchBackgroundColor),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: GlobalConfig.themeData,
      home: Scaffold(
        appBar: AppBar(
          title: searchInput(),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                child: Text(
                  '庇护热搜',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
                margin:
                    const EdgeInsets.only(top: 16.0, left: 16.0, bottom: 16.0),
                alignment: Alignment.topLeft,
              ),
              Row(
                children: <Widget>[
                  Container(
                    child: Chip(
                      label: FlatButton(
                        onPressed: () {},
                        child: Text(
                          '汽车关税下调',
                          style: TextStyle(color: GlobalConfig.fontColor),
                        ),
                      ),
                      backgroundColor: GlobalConfig.dark == true
                          ? Colors.white10
                          : Colors.black12,
                    ),
                    margin: const EdgeInsets.only(left: 16.0, bottom: 16.0),
                    alignment: Alignment.topLeft,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
