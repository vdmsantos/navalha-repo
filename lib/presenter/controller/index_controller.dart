import 'package:flutter/material.dart';

class IndexController extends ChangeNotifier {
  late int indexpage = 0;
  var bottomNavIndex = 0;

  void setIndex(int index) {
    indexpage = index;
    bottomNavIndex = index;
    notifyListeners();
  }
}