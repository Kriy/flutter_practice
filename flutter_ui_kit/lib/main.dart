import 'package:flutter/material.dart';
import 'package:flutterapp/di/dependency_injection.dart';

void main() {
  Injector.configure(Flavor.MOCK);
  runApp(MyApp());
}
