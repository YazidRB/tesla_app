import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tesla_app/constants/colors.dart';

class HomeBottomNavigationBar extends StatefulWidget {
  const HomeBottomNavigationBar({super.key});

  @override
  State<HomeBottomNavigationBar> createState() =>
      _HomeBottomNavigationBarState();
}

class _HomeBottomNavigationBarState extends State<HomeBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      backgroundColor: constColorsHomeOptionBarBackgroundColor,
      color: constColorsHomeOptionShadowBlack,
      index: 2,
      items: [
        Container(
          decoration: const BoxDecoration(boxShadow: <BoxShadow>[
            BoxShadow(
              color: Color.fromRGBO(0, 188, 212, 0.3),
              blurRadius: 15,
              spreadRadius: 5,
            ),
          ]),
          child: const Icon(
            CupertinoIcons.car_detailed,
            color: Colors.cyan,
          ),
        ),
        const Icon(
          CupertinoIcons.bolt_fill,
          color: Colors.grey,
        ),
        Icon(
          CupertinoIcons.add,
          size: 40,
          color: Theme.of(context).colorScheme.onSecondary,
        ),
        const Icon(
          CupertinoIcons.game_controller_solid,
          color: Colors.grey,
        ),
        const Icon(
          CupertinoIcons.person_fill,
          color: Colors.grey,
        ),
      ],
    );
  }
}
