import 'package:flutter/cupertino.dart';

class BottomBarProvider with ChangeNotifier {
  int _index = 0;

  int get getIndex => _index;

  set setIndex(int newIndex) {
    _index = newIndex;
    notifyListeners();
  }
}
