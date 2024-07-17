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
  });
  final IconData icon;
  final bool isOn;
  final void Function()? onTap;
  final void Function(double)? onChanged;
  final int val;

  @override
  State<ControlItem> createState() => _ControlItemState();
}

class _ControlItemState extends State<ControlItem> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('AC'),
        const SizedBox(
          width: 20,
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
