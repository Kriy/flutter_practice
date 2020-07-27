import 'dart:convert';

import 'package:flutter/services.dart';

class Request {
  static const String baseUrl = 'http://www.shuqi.com/';

  static Future<dynamic> get({String action, Map params}) async {
    return Request.mock(action, params);
  }

  static Future<dynamic> post({String action, Map params}) {
    return Request.mock(action, params);
  }

  static Future<dynamic> mock(String action, Map params) async {
    var responseStr = await rootBundle.loadString('mock/$action.json');
    var responseJson = json.decode(responseStr);
    return responseJson['data'];
  }
}
