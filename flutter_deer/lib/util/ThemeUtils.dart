


import 'package:flutter/material.dart';
import 'package:flutterdeer/res/colors.dart';

class ThemeUtils {

  static bool isDark(BuildContext context){
    return Theme.of(context).brightness == Brightness.dark;
  }

  static Color getDarkColor(BuildContext context, Color darkColor){
    return isDark(context) ? darkColor : null;
  }

  static Color getIconColor(BuildContext context){
    return isDark(context) ? Colours.dark_text : null;
  }

  static Color getStickyHeaderColor(BuildContext context){
    return isDark(context) ? Colours.dark_bg_gray_ : Colours.bg_gray_;
  }

  static Color getDialogTextFieldColor(BuildContext context){
    return isDark(context) ? Colours.dark_bg_gray_ : Colours.bg_gray;
  }

  static Color getKeyboardActionsColor(BuildContext context){
    return isDark(context) ? Colours.dark_bg_color : Colors.grey[200];
  }

  static void setSystemNavigationBarStyle(BuildContext context, ThemeData mode){
    if(Device){

    }
  }

}