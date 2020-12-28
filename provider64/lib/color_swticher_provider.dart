import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'dart:math';

class ColorSwitcherProvider extends ChangeNotifier {
  bool _switchStatus = true;
  bool get switchStatus => _switchStatus;

  int _headerColor = 0xFF000000 + Random().nextInt(0xFFFFFF);
  int get headerColor => _headerColor;

  int _boxColor = 0xFF000000 + Random().nextInt(0xFFFFFF);
  int get boxColor => _boxColor;

  void toggle() {
    _switchStatus = !_switchStatus;
    _boxColor = 0xFF000000 + Random().nextInt(0xFFFFFF);
    _headerColor = 0xFF000000 + Random().nextInt(0xFFFFFF);

    notifyListeners();
  }
}
