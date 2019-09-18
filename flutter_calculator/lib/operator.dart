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

class MultiOperator extends Operator{

}