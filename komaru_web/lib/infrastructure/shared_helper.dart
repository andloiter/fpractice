import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// SharedKey
enum SharedKeyEnum {
  // 担当者コード
  tantoCode(''),
  ;

  const SharedKeyEnum(this.defaultValue);
  final String defaultValue;
}

class SharedHelper {
  // -------------------------------------------------------------------------------------------
  // コンストラクタ
  // -------------------------------------------------------------------------------------------
  //Private Constructor
  SharedHelper._privateConstructor();
  static final SharedHelper instance = SharedHelper._privateConstructor();

  Future<void> setValueString(SharedKeyEnum key, String value) async {
    _saveValue(key, value);
  }

  Future<void> setValueInt(SharedKeyEnum key, int value) async {
    String saveValue = value.toString();
    _saveValue(key, saveValue);
  }

  Future<void> setValueBool(SharedKeyEnum key, bool value) async {
    String saveValue = value ? '1' : '0';
    _saveValue(key, saveValue);
  }

  Future<void> setValueTimeOfDay(SharedKeyEnum key, TimeOfDay value) async {
    String saveValue =
        '${value.hour.toString().padLeft(2, '0')}:${value.minute.toString().padLeft(2, '0')}';
    _saveValue(key, saveValue);
  }

  Future<void> _saveValue(SharedKeyEnum key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key.name, value);
  }

  Future<String> getValueString(SharedKeyEnum key) async {
    String saveValue = '';

    var result = await _loadValue(key);
    saveValue = result ?? key.defaultValue;

    return saveValue;
  }

  Future<int> getValueInt(SharedKeyEnum key) async {
    String saveValue = '';

    var result = await _loadValue(key);
    saveValue = result ?? key.defaultValue;

    return int.parse(saveValue);
  }

  Future<bool> getValueBool(SharedKeyEnum key) async {
    String saveValue = '';

    var result = await _loadValue(key);
    saveValue = result ?? key.defaultValue;

    return saveValue.compareTo('1') == 0 ? true : false;
  }

  Future<TimeOfDay> getValueTimeOfDay(SharedKeyEnum key) async {
    String saveValue = '';

    var result = await _loadValue(key);
    saveValue = result ?? key.defaultValue;

    return TimeOfDay(
        hour: int.parse(saveValue.split(":")[0]),
        minute: int.parse(saveValue.split(":")[1]));
  }

  Future<String?> _loadValue(SharedKeyEnum key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key.name);
  }
}
