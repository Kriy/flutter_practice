import 'package:flutter/widgets.dart';
import 'package:flutter_app/utility/screen.dart';

afterLayout(VoidCallback callback) {
  WidgetsBinding.instance.addPostFrameCallback((Duration timeStame) {
    callback();
  });
}

fixedFontSize(double fontSize) {
  return fontSize / Screen.textScaleFactor;
}
