import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Prefs {
  static const String JWT_TOKEN = 'JWT_TOKEN';
  static Future<String> get jwtToken => PreferencesHelper.getString(JWT_TOKEN);
  static Future setJwtToken(String value) =>
      PreferencesHelper.setString(JWT_TOKEN, value);

  static const String LOGGED_IN = 'LOGGED_IN';
  static Future<bool> get loggedIn => PreferencesHelper.getBool(LOGGED_IN);
  static Future setLoggedIn(bool value) =>
      PreferencesHelper.setBool(LOGGED_IN, value);

  static const String MEMBER_ID = 'MEMBER_ID';
  static Future<String> get memberId => PreferencesHelper.getString(MEMBER_ID);
  static Future setMemberId(String value) =>
      PreferencesHelper.setString(MEMBER_ID, value);
}

class PreferencesHelper {
  static Future<bool> getBool(String key) async {
    final p = await prefs;
    final result = await p.read(key: key);
    return bool.parse(result ?? 'false');
  }

  static Future<bool?> getBoolorNull(String key) async {
    final p = await prefs;
    final result = await p.read(key: key);
    return result == null ? null : bool.parse(result);
  }

  static Future setBool(String key, bool value) async {
    final p = await prefs;
    await p.write(key: key, value: value.toString());
    return true;
  }

  static Future<int> getInt(String key) async {
    final p = await prefs;
    final result = await p.read(key: key);
    return int.parse(result ?? '0');
  }

  static Future setInt(String key, int value) async {
    final p = await prefs;
    await p.write(key: key, value: value.toString());
    return true;
  }

  static Future<String> getString(String key) async {
    final p = await prefs;
    final result = await p.read(key: key);
    return result ?? '';
  }

  static Future setString(String key, String? value) async {
    final p = await prefs;
    await p.write(key: key, value: value.toString());
    return true;
  }

  static Future<double> getDouble(String key) async {
    final p = await prefs;
    final result = await p.read(key: key);
    return double.parse(result ?? '0.0');
  }

  static Future setDouble(String key, double value) async {
    final p = await prefs;
    await p.write(key: key, value: value.toString());
    return true;
  }

  static Future remove(String key) async {
    final p = await prefs;
    return await prefs.delete(key: key);
  }

  static Future removeAll() async {
    final p = await prefs;
    return await prefs.deleteAll();
  }

  static Future<List<Widget>>? getAllPrefs() async {
    final FlutterSecureStorage thisPrefs = await prefs;
    List<Widget> list = [];
    thisPrefs.readAll().then((value) {
      value.forEach((index, val) {
        list.add(ListTile(
          title: Text(index),
          subtitle: Text(val),
        ));
      });
    });
    return list;
  }

  static FlutterSecureStorage get prefs => const FlutterSecureStorage();
}
