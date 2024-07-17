import 'package:flutter/material.dart';
import 'package:tesla_app/components/buttons/main_button.dart';

class TwoButtonsAppBar extends StatelessWidget {
  const TwoButtonsAppBar({
    super.key,
    this.onTapLeading,
    this.onTapAction,
    required this.iconAction,
    required this.iconLeading,
  });
  final void Function()? onTapLeading;
  final void Function()? onTapAction;
  final IconData iconAction;
  final IconData iconLeading;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: kToolbarHeight + 40,
      backgroundColor: Colors.transparent,
      title: Row(
        children: [
          Container(
              margin: const EdgeInsets.only(
                left: 10,
              ),
              child: MainButton(
                icon: iconAction,
                onTap: onTapLeading,
              )),
          const Spacer(),
          const Text('CLIMATE'),
          const Spacer(),
        ],
      ),
      actions: [
        Container(
            margin: const EdgeInsets.only(
              right: 30,
            ),
            child: MainButton(
              icon: iconLeading,
              onTap: onTapAction,
            )),
      ],
    );
  }
}
