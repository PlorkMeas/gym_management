import 'package:flutter/material.dart';

class MyAppState extends ChangeNotifier {
  int selected = 0;

  void onChangePage(int index) {
    selected = index;
    notifyListeners();
  }
}
