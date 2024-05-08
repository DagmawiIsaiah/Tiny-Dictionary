import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

late bool onboardingCompleted;
late bool darkMode;

Future<void> initalize() async {
  final prefs = await SharedPreferences.getInstance();
  onboardingCompleted = prefs.getBool("onboardingCompleted") ?? false;
  darkMode = prefs.getBool("darkMode") ?? false;
}

class AppManager extends ChangeNotifier {
  int tabIndex = 0;

  void changeTabIndex(index) {
    tabIndex = index;
    notifyListeners();
  }

  void updateOnboardingStatus(bool status) {
    onboardingCompleted = true;
    saveStates();
    notifyListeners();
  }

  void updateThemeMode() {
    darkMode = !darkMode;
    saveStates();
    notifyListeners();
  }

  void saveStates() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setBool("onboardingCompleted", onboardingCompleted);
    await pref.setBool("darkMode", darkMode);
  }
}
