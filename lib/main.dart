import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:tesla_app/components/Lists/controls_option_list_provider.dart';
import 'package:tesla_app/pages/lock_unlock_page.dart';
import 'package:tesla_app/theme/theme_provider.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    // System status bar color
    statusBarColor: Color(0xFF2A2D32),
    // System Navigation bar color
    systemNavigationBarColor: Color(0xFF131313),
  ));

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ChangeNotifierProvider(create: (context) => ControlsOptionListProvider()),
    ],
    child: Consumer<ThemeProvider>(
        builder: (context, themes, child) => MaterialApp(
              debugShowCheckedModeBanner: false,
              showSemanticsDebugger: false,
              theme: themes.theme,
              home: const LockUnlockPage(),
            )),
  ));
}
