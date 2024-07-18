import 'package:flutter/cupertino.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:tesla_app/constants/colors.dart';

class HomeList extends StatelessWidget {
  HomeList({super.key});
  final Map<String, IconData> listMetaData = <String, IconData>{
    'Car': CupertinoIcons.car_detailed,
    'Power': CupertinoIcons.power,
    'Control': CupertinoIcons.game_controller,
    'Fan': CupertinoIcons.wifi,
    'Off': CupertinoIcons.volume_off,
    'ON': CupertinoIcons.info,
    'Air': CupertinoIcons.airplane,
  };

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
          itemCount: listMetaData.length,
          shrinkWrap: true,
          itemBuilder: (context, index) => Container(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(listMetaData.values.toList()[index]),
                      const SizedBox(
                        width: 12,
                      ),
                      Text(
                        listMetaData.keys.toList()[index],
                        style: const TextStyle(
                            color: constIconColor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const Icon(
                    CupertinoIcons.back,
                    textDirection: TextDirection.rtl,
                  )
                ],
              )),
        ),
      ),
    );
  }
}
