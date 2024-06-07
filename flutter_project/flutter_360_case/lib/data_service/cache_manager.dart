import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class CacheManager {
  static const String buttonStatusKey = 'buttonStatus';

  Future<bool?> getButtonStatus() async {
    final prefs = await SharedPreferences.getInstance();
    String? jsonString = prefs.getString(buttonStatusKey);
    if (jsonString != null) {
      return jsonDecode(jsonString) as bool;
    }
    return null;
  }

  Future<void> setButtonStatus(bool status) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(buttonStatusKey, jsonEncode(status));
  }
}
