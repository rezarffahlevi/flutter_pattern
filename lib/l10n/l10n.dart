import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';

class L10n {
  final String localeName;
  L10n(this.localeName);

  // static Future<L10n> load(Locale locale) {
  //   final String name =
  //       locale.countryCode == null || locale.countryCode!.isEmpty ? locale.languageCode : locale.toString();
  //   final String localeName = Intl.canonicalizedLocale(name);
  //
  //   return initializeMessages(localeName).then((_) {
  //     return L10n(localeName);
  //   });
  // }

  static AppLocalizations? of(BuildContext context) {
    return AppLocalizations.of(context);
  }

  // String get title {
  //   return Intl.message(
  //     'Teman Bumil',
  //     name: 'title',
  //     desc: 'Teman Bumil',
  //     locale: localeName,
  //   );
  // }

  static final supportedLocales = const [
    const Locale('id'),
    const Locale('en'),
  ];

  static final localizationsDelegates = const [
    AppLocalizations.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    DefaultCupertinoLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ];
}
