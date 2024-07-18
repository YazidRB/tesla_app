import 'package:flutter/material.dart';
import 'package:tesla_app/components/buttons/controls_button.dart';

class ControlItem extends StatefulWidget {
  const ControlItem({
    super.key,
    required this.icon,
    required this.onTap,
    required this.isOn,
    required this.val,
    this.onChanged,
    required this.title,
  });
  final IconData icon;
  final bool isOn;
  final void Function()? onTap;
  final void Function(double)? onChanged;
  final int val;
  final String title;

  @override
  State<ControlItem> createState() => _ControlItemState();
}

class _ControlItemState extends State<ControlItem> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          child: Text(widget.title),
          width: 50,
        ),
        const SizedBox(
          width: 10,
        ),
        ControlsButton(
          isOn: widget.isOn,
          icon: widget.icon,
          onTap: () {
            widget.onTap!();
          },
        ),
        Expanded(
            child: Slider(
                value: widget.val.toDouble(),
                min: 0,
                max: 30,
                onChanged: (val) {
                  widget.onChanged!(val);
                }))
      ],
    );
  }
}
