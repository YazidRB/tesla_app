import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tesla_app/components/AppBar/single_button_app_bar.dart';
import 'package:tesla_app/components/buttons/lock_unlock_tesla_switch.dart';
import 'package:tesla_app/constants/colors.dart';
import 'package:tesla_app/pages/home_page.dart';
import 'package:audioplayers/audioplayers.dart';

class LockUnlockPage extends StatefulWidget {
  const LockUnlockPage({super.key});

  @override
  State<LockUnlockPage> createState() => _LockUnlockPageState();
}

class _LockUnlockPageState extends State<LockUnlockPage> {
  // tesla car locked status
  bool isLocked = false;

  // AudioPlyaer instance
  AudioPlayer lockedCarAudio = AudioPlayer();
  AudioPlayer unLockedCarAudio = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: isLocked
              ? [
                  constColorsPageBackgroundGrey,
                  constColorsPageBackgroundBlack,
                ]
              : [
                  const Color(0xFF292C31),
                  const Color(0xFF000000),
                  const Color(0xFF000000),
                  const Color(0xFF292929),
                ],
          stops: isLocked
              ? [
                  0,
                  0.99,
                ]
              : [
                  0,
                  0.3,
                  0.57,
                  1,
                ],
        )),
        // Lock & UnLock page
        child: Column(
          children: [
            // App Bar
            Hero(
              tag: 'settings',
              child: SingleButtonBar(
                icon: CupertinoIcons.settings,
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomePage(),
                      ));
                },
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Center(
                    child: SingleChildScrollView(
                      child: Container(
                          decoration:
                              const BoxDecoration(boxShadow: <BoxShadow>[
                            BoxShadow(
                                color: Color.fromRGBO(47, 184, 255, 0.15),
                                blurRadius: 100,
                                spreadRadius: -100,
                                offset: Offset(0, -50)),
                            BoxShadow(
                              color: Color.fromRGBO(158, 236, 217, 0.15),
                              blurRadius: 100,
                              spreadRadius: -100,
                              offset: Offset(0, -50),
                            ),
                          ]),
                          child: Stack(
                            children: [
                              Positioned(
                                left: 10,
                                top: 30,
                                child: AnimatedOpacity(
                                    opacity: isLocked ? 1 : 0,
                                    duration: const Duration(milliseconds: 300),
                                    child: Image.asset(
                                      'assets/images/tesla_front.png',
                                      width: 256,
                                      height: 207,
                                    )),
                              ),
                              AnimatedOpacity(
                                opacity: !isLocked ? 1 : 0,
                                duration: const Duration(milliseconds: 300),
                                child: Image.asset(
                                  'assets/images/tesla_front_dark.png',
                                  width: 256,
                                  height: 207,
                                ),
                              ),
                            ],
                          )),
                    ),
                  ),
                  // Lock & Unlock Switch
                  LockUnlockTeslaSwitch(
                    initialValue: isLocked,
                    onChanged: (val) async {
                      isLocked
                          ? await lockedCarAudio
                              .play(AssetSource('sounds/car-lock.mp3'))
                          : await unLockedCarAudio
                              .play(AssetSource('sounds/car-starting.mp3'));
                      setState(() {
                        isLocked = val;
                      });
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
