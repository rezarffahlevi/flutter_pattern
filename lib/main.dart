import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:temanbumil_web/src/app.dart';
import 'package:temanbumil_web/src/configs/configs.dart';

void main() async {
  await initInjection();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
        supportedLocales: [Locale('en', 'US'), Locale('id', 'ID')],
        path: 'translations',
        startLocale: Locale('id', 'ID'),
        fallbackLocale: Locale('id', 'ID'),
        child: const App()),
  );
}
