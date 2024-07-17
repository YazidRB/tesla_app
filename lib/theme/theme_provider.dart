import 'package:flutter/material.dart';
import 'dark_them.dart';

class ThemeProvider with ChangeNotifier {
  final ThemeData _theme = darkTheme;

  ThemeData get theme => _theme;
}
