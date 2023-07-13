import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Prefs {
  static const String JWT_TOKEN = 'JWT_TOKEN';
  static Future<String> get jwtToken => PreferencesHelper.getString(JWT_TOKEN);
  static Future setJwtToken(String value) =>
      PreferencesHelper.setString(JWT_TOKEN, value);
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
    p.write(key: key, value: value.toString());
    return true;
  }

  static Future<int> getInt(String key) async {
    final p = await prefs;
    final result = await p.read(key: key);
    return int.parse(result ?? '0');
  }

  static Future setInt(String key, int value) async {
    final p = await prefs;
    p.write(key: key, value: value.toString());
    return true;
  }

  static Future<String> getString(String key) async {
    final p = await prefs;
    final result = await p.read(key: key);
    return result ?? '0';
  }

  static Future setString(String key, String? value) async {
    final p = await prefs;
    p.write(key: key, value: value.toString());
    return true;
  }

  static Future<double> getDouble(String key) async {
    final p = await prefs;
    final result = await p.read(key: key);
    return double.parse(result ?? '0.0');
  }

  static Future setDouble(String key, double value) async {
    final p = await prefs;
    p.write(key: key, value: value.toString());
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
