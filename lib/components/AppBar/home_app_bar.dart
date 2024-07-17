import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tesla_app/components/buttons/main_button.dart';
import 'package:tesla_app/pages/controls_page.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: kToolbarHeight + 40,
      backgroundColor: Colors.transparent,
      titleSpacing: 30,
      title: const IntrinsicWidth(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 70,
              child: Text('Tesla'),
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              children: [
                Icon(
                  CupertinoIcons.battery_25,
                  size: 26,
                  color: Color.fromRGBO(235, 235, 245, 0.3),
                ),
                SizedBox(
                  width: 6,
                ),
                Text(
                  '187 km',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color.fromRGBO(235, 235, 245, 0.3),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      actions: [
        Container(
            margin: const EdgeInsets.only(
              right: 30,
            ),
            child: MainButton(
              icon: CupertinoIcons.person_fill,
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ControlsPage(),
                    ));
              },
            )),
      ],
    );
  }
}
