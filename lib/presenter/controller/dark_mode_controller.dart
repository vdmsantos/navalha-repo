import 'package:flutter/material.dart';
import 'package:projeto_1/domain/entities/client_entity.dart';

class DarkModeController extends ChangeNotifier {
  bool darkMode = true;

  void changeMode(bool newDarkMode) {
    darkMode = newDarkMode;
    notifyListeners();
  }
}
