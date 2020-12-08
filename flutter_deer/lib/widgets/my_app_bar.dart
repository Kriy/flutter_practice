import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterdeer/res/colors.dart';
import 'package:flutterdeer/res/dimens.dart';
import 'package:flutterdeer/res/gaps.dart';
import 'package:flutterdeer/util/theme_utils.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Color backgroundColor;
  final String title;
  final String centerTitle;
  final String backImg;
  final String actionName;
  final VoidCallback onPressed;
  final bool isBack;

  const MyAppBar(
      {Key key,
      this.backgroundColor,
      this.title = '',
      this.centerTitle = '',
      this.actionName = '',
      this.backImg = 'assets/images/ic_back_black.png',
      this.onPressed,
      this.isBack = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color _backgroundColor;

    if (backgroundColor == null) {
      _backgroundColor = context.backgroundColor;
    } else {
      _backgroundColor = backgroundColor;
    }

    final SystemUiOverlayStyle _overlayStyle =
        ThemeData.estimateBrightnessForColor(_backgroundColor) ==
                Brightness.dark
            ? SystemUiOverlayStyle.light
            : SystemUiOverlayStyle.dark;

    final Widget back = isBack
        ? IconButton(
            tooltip: 'Back',
            padding: const EdgeInsets.all(12.0),
            icon: Image.asset(
              backImg,
              color: ThemeUtils.getIconColor(context),
            ),
            onPressed: () {
              FocusManager.instance.primaryFocus?.unfocus();
              Navigator.maybePop(context);
            })
        : Gaps.empty;

    final Widget action = actionName.isNotEmpty
        ? Positioned(
            child: Theme(
              data: Theme.of(context).copyWith(
                buttonTheme: const ButtonThemeData(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    minWidth: 60.0),
              ),
              child: FlatButton(
                child: Text(actionName, key: const Key('actionName')),
                textColor: context.isDark ? Colours.dark_text : Colours.text,
                highlightColor: Colors.transparent,
                onPressed: onPressed,
              ),
            ),
          )
        : Gaps.empty;

    final Widget titleWidget = Semantics(
      namesRoute: true,
      header: true,
      child: Container(
        alignment:
            centerTitle.isEmpty ? Alignment.centerLeft : Alignment.center,
        width: double.infinity,
        child: Text(
          title.isEmpty ? centerTitle : title,
          style: const TextStyle(
            fontSize: Dimens.font_sp18,
          ),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 48.0),
      ),
    );

    return AnnotatedRegion(
      child: Material(
        color: _backgroundColor,
        child: SafeArea(
          child: Stack(
            alignment: Alignment.centerLeft,
            children: [
              titleWidget,
              back,
              action,
            ],
          ),
        ),
      ),
      value: _overlayStyle,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(48.0);
}
