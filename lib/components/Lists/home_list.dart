import 'package:flutter/cupertino.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:tesla_app/constants/colors.dart';

class HomeList extends StatelessWidget {
  const HomeList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 20,
      ),
      decoration: BoxDecoration(
          color: const Color.fromRGBO(255, 255, 255, 0.44),
          borderRadius: BorderRadius.circular(50),
          border: const GradientBoxBorder(
              gradient: LinearGradient(
            colors: [
              Color(0xFF3C4348),
              Color(0xFF1C1E21),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          )),
          gradient: const LinearGradient(
            colors: [
              Color(0xFF3C4348),
              Color(0xFF1C1E21),
            ],
            stops: [
              0.1,
              1,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          )),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 30),
        child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 8,
          shrinkWrap: true,
          itemBuilder: (context, index) => Container(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(CupertinoIcons.car_detailed),
                      SizedBox(
                        width: 12,
                      ),
                      Text(
                        'Control',
                        style: TextStyle(
                            color: constIconColor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Icon(
                    CupertinoIcons.back,
                    textDirection: TextDirection.ltr,
                  )
                ],
              )),
        ),
      ),
    );
  }
}
