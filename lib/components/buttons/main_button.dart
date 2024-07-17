import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:tesla_app/constants/colors.dart';

class MainButton extends StatefulWidget {
  const MainButton({super.key, this.onTap, required this.icon});
  final void Function()? onTap;
  final IconData icon;

  @override
  State<MainButton> createState() => _MainButtonState();
}

class _MainButtonState extends State<MainButton> with TickerProviderStateMixin {
  // Clicked Animation instances
  late final Animation animationLight;
  late final Animation animationShadow;

  // Clicked Animation Controllers
  late final AnimationController animationControllerLight;
  late final AnimationController animationControllerShadow;

  @override
  void initState() {
    // L I G H T   A N I M A T I O N

    animationControllerLight = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 170),
    );

    animationLight = TweenSequence([
      TweenSequenceItem(
          tween: ColorTween(
            begin: constColorsMainButtonGreyShadowInside,
            end: constColorsMainButtonGreyShadowOutside,
          ),
          weight: 1.0),
      TweenSequenceItem(
          tween: ColorTween(
            begin: constColorsMainButtonGreyShadowOutside,
            end: constColorsMainButtonGreyShadowInside,
          ),
          weight: 1.0),
    ]).animate(animationControllerLight);

    // D A R K    A N I M A T I O N

    animationControllerShadow = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 170),
    );

    animationShadow = TweenSequence([
      TweenSequenceItem(
          tween: ColorTween(
            begin: constColorsMainButtonGreyShadowOutside,
            end: constColorsMainButtonGreyShadowInside,
          ),
          weight: 1.0),
      TweenSequenceItem(
          tween: ColorTween(
            end: constColorsMainButtonGreyShadowOutside,
            begin: constColorsMainButtonGreyShadowInside,
          ),
          weight: 1.0),
    ]).animate(animationControllerShadow);

    super.initState();
  }

  @override
  void dispose() {
    // dispose animations controllers
    animationControllerLight.dispose();
    animationControllerShadow.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // on click start the animations from the start
        animationControllerLight.forward(from: 0);
        animationControllerShadow.forward(from: 0).then(
          (value) {
            widget.onTap!();
          },
        );
      },
      child: Container(
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: constColorsMainButtonGreyShadow,
                blurRadius: 20,
                spreadRadius: -6,
                offset: Offset(-5, -5)),
            BoxShadow(
                color: constColorsMainButtonBlackShadow,
                blurRadius: 20,
                spreadRadius: -6,
                offset: Offset(5, 5)),
          ],
        ),
        child: AnimatedBuilder(
            animation: animationControllerLight,
            builder: (context, child) {
              return Container(
                width: 62,
                height: 62,
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                    border: const GradientBoxBorder(
                        width: 2,
                        gradient: LinearGradient(
                          colors: [
                            constColorsMainButtonBorderblack,
                            constColorsMainButtonBorderWhite,
                          ],
                          stops: [
                            0.8,
                            1,
                          ],
                          begin: Alignment.topLeft,
                        )),
                    shape: BoxShape.circle,
                    gradient: RadialGradient(
                      colors: [
                        animationLight.value,
                        animationShadow.value,
                      ],
                      center: Alignment.topLeft,
                      radius: BorderSide.strokeAlignOutside,
                      stops: const [
                        0,
                        1,
                      ],
                    )),
                child: child,
              );
            },
            child: Icon(
              widget.icon,
              color: constIconColor,
              size: 29,
            )),
      ),
    );
  }
}
