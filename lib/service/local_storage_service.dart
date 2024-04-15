import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  LocalStorageService._privateConstructor();

  static final LocalStorageService _instance =
      LocalStorageService._privateConstructor();

  factory LocalStorageService() {
    return _instance;
  }

  SharedPreferences? _prefs;

  Future<void> init() async {
    try {
      _prefs = await SharedPreferences.getInstance();
      debugPrint('SharedPreferences initialized successfully.');
    } catch (e) {
      debugPrint('Failed to initialize SharedPreferences: $e');
    }
  }

  Future<void> saveString(String key, String value) async {
    try {
      await _prefs?.setString(key, value);
      debugPrint('Saved string: $key = $value');
    } catch (e) {
      debugPrint('Failed to save string: $key = $value, Error: $e');
    }
  }

  String? getString(String key) {
    try {
      var value = _prefs?.getString(key);
      debugPrint('Retrieved string: $key = $value');
      return value;
    } catch (e) {
      debugPrint('Failed to retrieve string: $key, Error: $e');
      return null;
    }
  }

  Future<void> saveBool(String key, bool value) async {
    try {
      await _prefs?.setBool(key, value);
      debugPrint('Saved bool: $key = $value');
    } catch (e) {
      debugPrint('Failed to save bool: $key = $value, Error: $e');
    }
  }

  bool? getBool(String key) {
    try {
      var value = _prefs?.getBool(key);
      debugPrint('Retrieved bool: $key = $value');
      return value;
    } catch (e) {
      debugPrint('Failed to retrieve bool: $key, Error: $e');
      return null;
    }
  }

  Future<void> saveInt(String key, int value) async {
    try {
      await _prefs?.setInt(key, value);
      debugPrint('Saved int: $key = $value');
    } catch (e) {
      debugPrint('Failed to save int: $key = $value, Error: $e');
    }
  }

  int? getInt(String key) {
    try {
      var value = _prefs?.getInt(key);
      debugPrint('Retrieved int: $key = $value');
      return value;
    } catch (e) {
      debugPrint('Failed to retrieve int: $key, Error: $e');
      return null;
    }
  }

  Future<void> saveDouble(String key, double value) async {
    try {
      await _prefs?.setDouble(key, value);
      debugPrint('Saved double: $key = $value');
    } catch (e) {
      debugPrint('Failed to save double: $key = $value, Error: $e');
    }
  }

  double? getDouble(String key) {
    try {
      var value = _prefs?.getDouble(key);
      debugPrint('Retrieved double: $key = $value');
      return value;
    } catch (e) {
      debugPrint('Failed to retrieve double: $key, Error: $e');
      return null;
    }
  }

  Future<void> remove(String key) async {
    try {
      await _prefs?.remove(key);
      debugPrint('Removed item: $key');
    } catch (e) {
      debugPrint('Failed to remove item: $key, Error: $e');
    }
  }

  Future<void> clear() async {
    try {
      await _prefs?.clear();
      debugPrint('Cleared all SharedPreferences');
    } catch (e) {
      debugPrint('Failed to clear SharedPreferences: $e');
    }
  }
}
