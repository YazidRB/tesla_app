import 'package:flutter/material.dart';

class ControlsOptionListProvider extends ChangeNotifier {
  // list of bottons status (clicked or not)
  final List<bool> _clicked = List.filled(6, false);
  // list of the level of each control
  final List<int> _controlLevel = List.filled(6, 0);

  // GETERS
  get clicked => _clicked;
  get controlLevel => _controlLevel;

  // clicked Button change status to On / OFF
  void clickedButton(int index) {
    // if the button is allrady off then turn the other buttons off before turning
    // the current one ON
    //
    // otherwise just turn it off
    if (_clicked[index] == false) {
      _clicked.fillRange(0, 6, false);
    }

    _clicked[index] = !_clicked[index];

    notifyListeners();
  }

  // function for changing the level of a control slider
  void onChangeLevel(int index, double val) {
    controlLevel[index] = val.round();

    notifyListeners();
  }
}
