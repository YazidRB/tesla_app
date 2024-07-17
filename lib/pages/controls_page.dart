import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tesla_app/components/AppBar/two_buttons_app_bar.dart';
import 'package:tesla_app/components/Lists/controls_option_list.dart';
import 'package:tesla_app/components/Lists/controls_option_list_provider.dart';
import 'package:tesla_app/components/bars/bottom_nav_bar_controle.dart';
import 'package:tesla_app/components/display/indicator_tesla.dart';
import 'package:tesla_app/constants/colors.dart';

class ControlsPage extends StatefulWidget {
  const ControlsPage({super.key});

  @override
  State<ControlsPage> createState() => _ControlsState();
}

class _ControlsState extends State<ControlsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Stack(
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                constColorsPageBackgroundGrey,
                constColorsPageBackgroundBlack,
              ],
              stops: [
                0,
                0.99,
              ],
            )),
            child: ListView(
              children: <Widget>[
                // APP BAR
                TwoButtonsAppBar(
                  iconAction: Icons.arrow_back_ios_new_rounded,
                  iconLeading: CupertinoIcons.settings,
                  onTapLeading: () {
                    Navigator.pop(context);
                  },
                  onTapAction: () {},
                ),
                // BODY
                Consumer<ControlsOptionListProvider>(
                  builder: (context, value, child) => Column(
                    children: [
                      const SizedBox(
                        height: 120,
                      ),
                      // Tesla Indicator
                      IndicatorTesla(
                        value: !value.clicked.contains(true)
                            ? -1
                            : value.controlLevel[value.clicked.indexOf(true)],
                      ),
                      const SizedBox(
                        height: 100,
                      ),
                      // List of Controls Options
                      const Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 30.0, vertical: 40),
                        child: ControlsOptionList(),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          // Bottom Navigation Bar
          Consumer<ControlsOptionListProvider>(
            builder: (context, value, child) => AnimatedOpacity(
              duration: const Duration(milliseconds: 500),
              // if any botton is clicked show the bottomNavBar
              opacity: value.clicked.contains(true) ? 1 : 0,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: BottomNavBarControle(
                  // if a button is selected ( ON ) show the level in NavBar
                  val: value.clicked.contains(true)
                      ? value.controlLevel[value.clicked.indexOf(true)]
                      : 0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
