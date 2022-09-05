import 'package:flutter/material.dart';

class DarkModeController extends ChangeNotifier {
  bool darkMode = true;

  void changeMode(bool newDarkMode) {
    darkMode = newDarkMode;
    notifyListeners();
  }
}
