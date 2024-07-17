import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:tesla_app/constants/colors.dart';

class ControlsButton extends StatefulWidget {
  const ControlsButton(
      {super.key, required this.icon, required this.onTap, required this.isOn});
  final IconData icon;
  final void Function()? onTap;

  // status of the button
  final bool isOn;

  @override
  State<ControlsButton> createState() => _ControlsButtonState();
}

class _ControlsButtonState extends State<ControlsButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onTap!();
      },
      child: Container(
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.5),
                blurRadius: 20,
                spreadRadius: -6,
                offset: Offset(10, 10)),
          ],
        ),
        child: Container(
            width: 62,
            height: 62,
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
                border: const GradientBoxBorder(
                    width: 1,
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFF141515),
                        Color(0xFF2E3236),
                      ],
                      stops: [
                        0.8,
                        1,
                      ],
                      begin: Alignment.topLeft,
                    )),
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: widget.isOn
                      ? const [
                          Color(0xFF11A8FD),
                          Color(0xFF005EA3),
                        ]
                      : const [
                          Color(0xFF2E3236),
                          Color(0xFF141515),
                        ],
                  center: Alignment.topLeft,
                  radius: BorderSide.strokeAlignOutside,
                  stops: const [
                    0,
                    1,
                  ],
                )),
            child: Icon(
              widget.icon,
              color: widget.isOn ? Colors.white : constIconColor,
              size: 29,
            )),
      ),
    );
  }
}
