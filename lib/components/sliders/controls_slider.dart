import 'package:flutter/material.dart';

class ControlsSlider extends StatefulWidget {
  const ControlsSlider({super.key});

  @override
  State<ControlsSlider> createState() => _ControlsSliderState();
}

class _ControlsSliderState extends State<ControlsSlider> {
  @override
  Widget build(BuildContext context) {
    return Slider(
      onChanged: (val) {},
      value: 10,
      min: 0,
      max: 100,
    );
  }
}
