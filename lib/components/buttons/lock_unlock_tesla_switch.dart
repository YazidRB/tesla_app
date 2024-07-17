import 'package:flutter/cupertino.dart';
import 'package:tesla_app/constants/colors.dart';

class LockUnlockTeslaSwitch extends StatefulWidget {
  const LockUnlockTeslaSwitch({
    super.key,
    required this.initialValue,
    required this.onChanged,
  });

  final ValueChanged<bool> onChanged;
  final bool initialValue;

  @override
  State<LockUnlockTeslaSwitch> createState() => _LockUnlockTeslaSwitchState();
}

class _LockUnlockTeslaSwitchState extends State<LockUnlockTeslaSwitch> {
  late bool _value;

  @override
  void initState() {
    super.initState();
    _value = widget.initialValue;
  }

  void _toggleSwitch() {
    setState(() {
      _value = !_value;
    });
    widget.onChanged(_value);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleSwitch,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: 165.0,
        height: 79.0,
        decoration: BoxDecoration(
          boxShadow: const <BoxShadow>[
            BoxShadow(
              offset: Offset(18, 10),
              color: Color.fromRGBO(0, 0, 0, 0.3),
              blurRadius: 20,
            ),
            BoxShadow(
              offset: Offset(-8, -6),
              color: Color.fromRGBO(158, 158, 158, 0.05),
              blurRadius: 10,
            ),
          ],
          gradient: const RadialGradient(
            colors: <Color>[
              Color(0xFF18191B),
              Color(0xFF18191B),
              Color.fromRGBO(80, 80, 80, 0.05),
            ],
            center: FractionalOffset(
              0.3,
              -0.9,
            ),
            radius: 2.7,
            stops: <double>[
              0,
              0.7,
              1,
            ],
          ),
          borderRadius: BorderRadius.circular(40.0),
        ),
        child: Stack(
          children: [
            Stack(
              children: [
                Positioned(
                  top: 30,
                  right: 30,
                  child: AnimatedOpacity(
                    opacity: !_value ? 1.0 : 0.0,
                    duration: const Duration(seconds: 1),
                    curve: Curves.bounceInOut,
                    child: Visibility(
                      visible: !_value,
                      child: const Text('Locked'),
                    ),
                  ),
                ),
                Positioned(
                  top: 30,
                  left: 23,
                  child: AnimatedOpacity(
                    opacity: _value ? 1.0 : 0.0,
                    duration: const Duration(seconds: 1),
                    curve: Curves.bounceInOut,
                    child: Visibility(
                      visible: _value,
                      child: const Text('Unlocked'),
                    ),
                  ),
                ),
              ],
            ),
            AnimatedPositioned(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeIn,
              top: 15.0,
              left: _value ? 100.0 : 20.0,
              child: AnimatedSwitcher(
                  duration: const Duration(seconds: 1),
                  transitionBuilder:
                      (Widget child, Animation<double> animation) {
                    return ScaleTransition(
                      scale: animation,
                      child: child,
                    );
                  },
                  // Icon Lock & Unlock
                  child: Row(
                    children: [
                      Container(
                        width: 49,
                        height: 49,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: RadialGradient(
                            colors: [
                              constColorsMainButtonGreyShadowInside,
                              constColorsMainButtonGreyShadowOutside,
                            ],
                            center: Alignment.topLeft,
                            radius: BorderSide.strokeAlignOutside,
                            stops: [
                              0,
                              1,
                            ],
                          ),
                        ),
                        child: AnimatedSwitcher(
                          duration: const Duration(milliseconds: 180),
                          transitionBuilder: (child, animation) {
                            return ScaleTransition(
                              scale: animation,
                              child: child,
                            );
                          },
                          child: _value
                              ? Icon(
                                  CupertinoIcons.lock_open_fill,
                                  color: const Color(0xFF2FB8FF),
                                  size: 29.0,
                                  key: UniqueKey(),
                                )
                              : Icon(
                                  CupertinoIcons.lock_fill,
                                  color: const Color(0xFF2FB8FF),
                                  size: 26.0,
                                  key: UniqueKey(),
                                ),
                        ),
                      ),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
