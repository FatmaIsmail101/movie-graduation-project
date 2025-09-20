import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static SharedPreferences? _prefs;

  /// لازم تتنده مرة في بداية الابلكيشن
  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // ---------------- Save Methods ----------------
  static Future<bool> saveString(String key, String value) async {
    return await _prefs!.setString(key, value);
  }

  static Future<bool> saveInt(String key, int value) async {
    return await _prefs!.setInt(key, value);
  }

  static Future<bool> saveBool(String key, bool value) async {
    return await _prefs!.setBool(key, value);
  }

  static Future<bool> saveDouble(String key, double value) async {
    return await _prefs!.setDouble(key, value);
  }

  static Future<bool> saveStringList(String key, List<String> value) async {
    return await _prefs!.setStringList(key, value);
  }

  // ---------------- Get Methods ----------------
  static String? getString(String key) {
    return _prefs!.getString(key);
  }

  static int? getInt(String key) {
    return _prefs!.getInt(key);
  }

  static bool? getBool(String key) {
    return _prefs!.getBool(key);
  }

  static double? getDouble(String key) {
    return _prefs!.getDouble(key);
  }

  static List<String>? getStringList(String key) {
    return _prefs!.getStringList(key);
  }

  // ---------------- Remove & Clear ----------------
  static Future<bool> remove(String key) async {
    return await _prefs!.remove(key);
  }

  static Future<bool> clear() async {
    return await _prefs!.clear();
  }
}
