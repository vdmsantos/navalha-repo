import 'package:flutter/material.dart';

class CurrentIndexController extends ChangeNotifier {
  int currentIndex = 0;

  void setBottomBarIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }
}