import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class DarkThemeProvider with ChangeNotifier {
  bool isDark = false;
  switchMode() {
    isDark = !isDark;
    saveModeToSharedPref("isDark", isDark);
    notifyListeners();
  }

  setMode() {
    getModeFromSharedPref("isDark");
  }

  saveModeToSharedPref(String title, bool isbool) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('title', isbool);
  }

  getModeFromSharedPref(String title) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isDark = prefs.getBool(title) ?? false;
    notifyListeners();
  }
}
