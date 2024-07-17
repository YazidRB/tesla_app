import 'package:flutter/material.dart';
import 'package:tesla_app/components/buttons/main_button.dart';

class SingleButtonBar extends StatelessWidget {
  const SingleButtonBar({
    super.key,
    this.onTap,
    required this.icon,
  });
  final void Function()? onTap;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: kToolbarHeight + 40,
      backgroundColor: Colors.transparent,
      actions: [
        Container(
            margin: const EdgeInsets.only(
              right: 30,
            ),
            child: MainButton(
              icon: icon,
              onTap: onTap,
            )),
      ],
    );
  }
}
