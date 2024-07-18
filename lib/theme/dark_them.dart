import 'package:flutter/material.dart';
import 'package:tesla_app/constants/colors.dart';

ThemeData darkTheme = ThemeData(
    fontFamily: 'Play',
    iconTheme: const IconThemeData().copyWith(color: constIconColor),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.red,
    ),
    sliderTheme: const SliderThemeData(
      activeTrackColor: Color(0xFF058DD9),
    ),
    colorScheme: const ColorScheme.dark(
        primary: Color(0xFF27282A),
        onPrimary: Colors.white,
        secondary: Color(0xFF4E5054),
        onSecondary: Color(0xFF058DD9)));
