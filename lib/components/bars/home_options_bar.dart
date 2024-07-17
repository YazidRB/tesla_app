import 'package:flutter/cupertino.dart';
import 'package:tesla_app/constants/colors.dart';

class HomeOptionsBar extends StatelessWidget {
  const HomeOptionsBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: constColorsHomeOptionBarBackgroundColor,
          borderRadius: BorderRadius.circular(50),
          boxShadow: const <BoxShadow>[
            BoxShadow(
                color: constColorsHomeOptionShadowBlack,
                blurRadius: 20,
                spreadRadius: 12,
                offset: Offset(10, 5)),
            BoxShadow(
                color: constColorsHomeOptionShadowWhite,
                blurRadius: 20,
                spreadRadius: 7,
                offset: Offset(-10, -5)),
          ]),
      margin: const EdgeInsets.symmetric(horizontal: 29),
      padding: const EdgeInsets.all(30),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(CupertinoIcons.lock_fill),
          Icon(CupertinoIcons.circle_grid_hex_fill),
          Icon(CupertinoIcons.bolt),
          Icon(CupertinoIcons.car_detailed),
        ],
      ),
    );
  }
}
