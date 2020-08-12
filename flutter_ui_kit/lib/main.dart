import 'package:flutter/material.dart';
import 'package:flutterapp/di/dependency_injection.dart';
import 'package:flutterapp/myapp.dart';

void main() {
  Injector.configure(Flavor.MOCK);
  runApp(MyApp());
}
