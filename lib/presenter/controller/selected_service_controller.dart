import 'package:flutter/material.dart';

class SelectedServiceController extends ChangeNotifier {
  List<int> indexSelectedList = [];

  void onServiceSelected(int index, bool inList) {
    if (inList) {
      indexSelectedList.remove(index);
    } else {
      indexSelectedList.add(index);
    }
    notifyListeners();
  }
}
