import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:tesla_app/constants/colors.dart';

class BottomNavBarControle extends StatefulWidget {
  const BottomNavBarControle({super.key, required this.val});
  // the displated Value
  final int val;

  @override
  State<BottomNavBarControle> createState() => _BottomNavBarControleState();
}

class _BottomNavBarControleState extends State<BottomNavBarControle> {
  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          height: 144,
          decoration: BoxDecoration(
            border: const GradientBoxBorder(
                width: 0.3,
                gradient: LinearGradient(
                  colors: [
                    Colors.white,
                    Colors.black,
                  ],
                  begin: Alignment.topLeft,
                )),
            gradient: const LinearGradient(colors: [
              Color.fromRGBO(0, 0, 0, 0.2),
              Color.fromRGBO(47, 184, 255, 0.2),
              Color.fromRGBO(158, 236, 217, 0.2),
            ], stops: [
              0,
              0.9,
              1,
            ]),
            borderRadius: BorderRadius.circular(40),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        iconSize: 24,
                        icon: const Icon(CupertinoIcons.power),
                        color: const Color(0xFF2FB8FF),
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {},
                    iconSize: 24,
                    icon: const Icon(CupertinoIcons.back),
                  ),
                  Text(
                    '${widget.val.toString()}°',
                    style: const TextStyle(
                      fontSize: 43,
                    ),
                  ),
                  IconButton(
                    iconSize: 24,
                    onPressed: () {},
                    icon: const Icon(CupertinoIcons.forward),
                  ),
                  IconButton(
                    onPressed: () {},
                    iconSize: 24,
                    icon: const Icon(CupertinoIcons.bolt_slash_fill),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'On',
                      style: TextStyle(color: constIconColor),
                    ),
                    Text(
                      'Vent',
                      style: TextStyle(color: constIconColor),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
