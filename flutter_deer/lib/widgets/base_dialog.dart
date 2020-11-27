import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutterdeer/res/colors.dart';
import 'package:flutterdeer/res/dimens.dart';
import 'package:flutterdeer/res/styles.dart';
import 'package:flutterdeer/routers/fluro_navigator.dart';

class BaseDialog extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final Widget child;
  final bool hiddenTitle;

  const BaseDialog(
      {Key key,
      this.title,
      this.onPressed,
      this.hiddenTitle = false,
      @required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Widget dialogTitle = Visibility(
      visible: !hiddenTitle,
      child: Padding(
        padding: const EdgeInsets.only(
          bottom: 8.0,
        ),
        child: Text(
          hiddenTitle ? '' : title,
          style: TextStyles.textBold18,
        ),
      ),
    );

    final Widget bottomButton = Row(
      children: [
        _DialogButton(
          text: '取消',
          textColor: Colours.text_gray,
          onPressed: () => NavigatorUtils.goBack(context),
        ),
        const SizedBox(
          height: 48.0,
          width: 0.6,
          child: VerticalDivider(),
        ),
        _DialogButton(
          text: '确定',
          textColor: Theme.of(context).primaryColor,
          onPressed: onPressed,
        )
      ],
    );
  }
}

class _DialogButton extends StatelessWidget {
  const _DialogButton({
    Key key,
    this.text,
    this.textColor,
    this.onPressed,
  }) : super(key: key);

  final String text;
  final Color textColor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: SizedBox(
      height: 48.0,
      child: FlatButton(
        child: Text(
          text,
          style: const TextStyle(fontSize: Dimens.font_sp18),
        ),
        textColor: textColor,
        onPressed: onPressed,
      ),
    ));
  }
}
