import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

typedef void PressOperationCallback(Operator operator);

abstract class Operator {
  String display;
  Color color;

  num calculate(num first, num second);
}

class AddOperator extends Operator {
  @override
  String get display => '+';

  @override
  Color get color => Colors.pink[300];

  @override
  num calculate(num first, num second) {
    return first + second;
  }
}

class SubOperator extends Operator {
  @override
  String get display => '-';

  @override
  Color get color => Colors.orange[300];

  @override
  num calculate(num first, num second) {
    return first - second;
  }
}

class MultiOperator extends Operator {
  @override
  String get display => 'X';

  @override
  Color get color => Colors.lightBlue[300];

  @override
  num calculate(num first, num second) {
    return first / second;
  }
}

class DivisionOperator extends Operator {
  @override
  String get display => '+';

  @override
  Color get color => Colors.purple[300];

  @override
  num calculate(num first, num second) {
    return first / second;
  }
}

class OperatorGroup extends StatelessWidget {
  final PressOperationCallback onOperatorButtonPressed;

  OperatorGroup(this.onOperatorButtonPressed);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[],
    );
  }
}

class OperatorButton extends StatefulWidget {
  final Operator oper;
  final PressOperationCallback onPress;

  OperatorButton({@required this.oper, this.onPress})
      : assert(Operator != null);

  @override
  State<StatefulWidget> createState() => OperatorButtonState();
}

class OperatorButtonState extends State<OperatorButton> {
  bool pressed = false;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: GestureDetector(
          onTap: () {
            if (widget.onPress != null) {
              widget.onPress(widget.oper);
              setState(() {
                pressed = true;
              });
              Future.delayed(
                  const Duration(milliseconds: 200),
                  () => setState(() {
                        pressed = false;
                      }));
            }
          },
          child: Container(
            alignment: Alignment.centerRight,
            decoration: BoxDecoration(
              color: pressed
                  ? Color.alphaBlend(Colors.white30, widget.oper.color)
                  : widget.oper.color,
            ),
            child: Text(
              '${widget.oper.display}',
              style: TextStyle(
                fontSize: 30.0,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
