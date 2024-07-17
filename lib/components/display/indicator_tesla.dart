import 'package:flutter/material.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:provider/provider.dart';
import 'package:tesla_app/components/Lists/controls_option_list_provider.dart';
import 'package:tesla_app/constants/colors.dart';

class IndicatorTesla extends StatefulWidget {
  const IndicatorTesla({super.key, required this.value});

  // indication value (displayed)
  final int value;

  @override
  State<IndicatorTesla> createState() => _IndicatorTeslaState();
}

class _IndicatorTeslaState extends State<IndicatorTesla> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        padding: const EdgeInsets.all(10),
        width: 188,
        height: 188,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          gradient: RadialGradient(
            colors: <Color>[
              constColorsMainButtonGreyShadowOutside,
              Colors.black,
            ],
            center: Alignment.topLeft,
            radius: BorderSide.strokeAlignOutside,
            stops: [
              0,
              1,
            ],
          ),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: constColorsMainButtonGreyShadow,
                blurRadius: 50,
                spreadRadius: -6,
                offset: Offset(-25, -25)),
            BoxShadow(
                color: constColorsMainButtonBlackShadow,
                blurRadius: 50,
                spreadRadius: -6,
                offset: Offset(25, 25)),
          ],
        ),
      ),
      Consumer<ControlsOptionListProvider>(
        builder: (context, value, child) => TweenAnimationBuilder(
          tween: Tween<double>(
            begin: 30,
            end: 0,
          ),
          duration: const Duration(milliseconds: 200),
          builder: (context, val, child) => Positioned(
            top: 77,
            right: 77,
            child: CircularProgressIndicator(
              color: Colors.blue,
              value: value.clicked.contains(true)
                  ? value.controlLevel[value.clicked.indexOf(true)] / 30
                  : 0,
              strokeWidth: 18,
              strokeAlign: 5,
            ),
          ),
        ),
      ),
      Positioned(
        top: 34,
        right: 34,
        child: Container(
          width: 119.25,
          height: 119.25,
          decoration: const BoxDecoration(
            border: GradientBoxBorder(
                width: 2,
                gradient: LinearGradient(
                  colors: <Color>[
                    constColorsMainButtonBorderWhite,
                    constColorsMainButtonBorderblack,
                  ],
                  stops: <double>[
                    0.8,
                    1,
                  ],
                  begin: Alignment.topLeft,
                )),
            shape: BoxShape.circle,
            gradient: LinearGradient(colors: [
              Color.fromRGBO(25, 25, 25, 1),
              Color(
                0xFF32363B,
              ),
            ], stops: [
              0.3,
              1,
            ], begin: Alignment.topLeft),
          ),
        ),
      ),
      Positioned(
        top: 53,
        right: widget.value > 9 ? 64 : 82,
        child: Text(
          widget.value == -1 ? ' ' : widget.value.toString(),
          style: const TextStyle(
            fontSize: 56,
            color: Color(0xFF5C5C62),
          ),
        ),
      )
    ]);
  }
}
