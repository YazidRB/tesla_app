import 'package:flutter/material.dart';
import 'package:tesla_app/components/AppBar/home_app_bar.dart';
import 'package:tesla_app/components/bars/home_bottom_navigation_bar.dart';
import 'package:tesla_app/components/Lists/home_list.dart';
import 'package:tesla_app/components/bars/home_options_bar.dart';
import 'package:tesla_app/constants/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Bottom Nav Bar s
      bottomNavigationBar: const HomeBottomNavigationBar(),
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              constColorsPageBackgroundGrey,
              constColorsPageBackgroundBlack,
            ],
            stops: [
              0,
              0.99,
            ],
          )),
          child: SingleChildScrollView(
            child: Column(
              children: [
                // App Bar
                const HomeAppBar(),
                const SizedBox(
                  height: 50,
                ),
                // Tesla Image
                Hero(
                  tag: 'settings',
                  child: Container(
                    decoration: const BoxDecoration(boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(24, 93, 93, 93),
                        blurRadius: 60,
                        spreadRadius: -50,
                      )
                    ]),
                    child: Image.asset('assets/images/tesla_home.png'),
                  ),
                ),
                // Middle App Bar
                const HomeOptionsBar(),
                const SizedBox(
                  height: 70,
                ),
                // Tesla List options
                const HomeList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
