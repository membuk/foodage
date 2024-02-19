import 'dart:io';
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Translation {
  static SharedPreferences? prefs;
  static late String selectedLanguage;
  static const String defaultLanguage = "tr";
  static late Map<String, String> activeLanguage;

  static Map<String, String> getLangMap() {
    return {
      "tr": "Türkçe",
      "en": "English",
      "es": "Español",
    };
  }

  static String translateKey(String key) {
    String? translated = activeLanguage[key];
    translated ??= key;

    return translated;
  }

  static Future<void> loadLanguage() async {
    prefs ??= await SharedPreferences.getInstance();

    String? lang = prefs!.getString("language");
    String localeLanguage = Platform.localeName.split('_')[0];
    if (getLangMap().keys.contains(localeLanguage)) {
      lang ??= localeLanguage;
    } else {
      lang ??= defaultLanguage;
    }

    selectedLanguage = lang;
    activeLanguage = await _loadJson("assets/languages/$selectedLanguage.json");
  }

  static Future<void> setLanguage(String abbreviation) async {
    prefs ??= await SharedPreferences.getInstance();
    await prefs!.setString("language", abbreviation);

    await loadLanguage();
  }

  static Future<Map<String, String>> _loadJson(String filename) async {
    return Map.castFrom(jsonDecode(await rootBundle.loadString(filename)));
  }
}
