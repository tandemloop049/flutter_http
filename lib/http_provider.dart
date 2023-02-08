import 'package:flutter/material.dart';

class HttpProvider extends ChangeNotifier {
  int idGetMethod = 0;

  void changeID(String value) {
    idGetMethod = int.tryParse(value) ?? 0;
    notifyListeners();
  }
}
