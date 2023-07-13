import 'package:flutter/material.dart';
import 'package:temanbumil_web/src/app.dart';
import 'package:temanbumil_web/src/configs/configs.dart';

void main() async {
  await initInjection();
  runApp(const App());
}