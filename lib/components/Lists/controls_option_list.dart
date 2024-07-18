import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:tesla_app/components/Lists/controls_option_list_provider.dart';
import 'package:tesla_app/components/bars/control_item.dart';

class ControlsOptionList extends StatefulWidget {
  const ControlsOptionList({super.key});

  @override
  State<ControlsOptionList> createState() => _ControlsOptionListState();
}

class _ControlsOptionListState extends State<ControlsOptionList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ControlsOptionListProvider>(
      builder: (context, value, child) => Column(
        children: <Widget>[
          ControlItem(
            title: 'AC',
            val: value.controlLevel[0],
            isOn: value.clicked[0],
            onChanged: (val) => value.onChangeLevel(0, val),
            icon: CupertinoIcons.car,
            onTap: () => value.clickedButton(0),
          ),
          const SizedBox(
            height: 30,
          ),
          ControlItem(
            title: 'FAN',
            onChanged: (val) => value.onChangeLevel(1, val),
            val: value.controlLevel[1],
            isOn: value.clicked[1],
            icon: CupertinoIcons.antenna_radiowaves_left_right,
            onTap: () => value.clickedButton(1),
          ),
          const SizedBox(
            height: 30,
          ),
          ControlItem(
            title: 'Heat',
            onChanged: (val) => value.onChangeLevel(2, val),
            val: value.controlLevel[2],
            isOn: value.clicked[2],
            icon: CupertinoIcons.bolt_horizontal,
            onTap: () => value.clickedButton(2),
          ),
          const SizedBox(
            height: 30,
          ),
          ControlItem(
            title: 'Auto',
            onChanged: (val) => value.onChangeLevel(3, val),
            val: value.controlLevel[3],
            isOn: value.clicked[3],
            icon: CupertinoIcons.power,
            onTap: () => value.clickedButton(3),
          ),
          const SizedBox(
            height: 30,
          ),
          ControlItem(
            title: 'Power',
            onChanged: (val) => value.onChangeLevel(4, val),
            val: value.controlLevel[4],
            isOn: value.clicked[4],
            icon: CupertinoIcons.dot_square_fill,
            onTap: () => value.clickedButton(4),
          ),
          const SizedBox(
            height: 30,
          ),
          ControlItem(
            title: 'Alarm',
            onChanged: (val) => value.onChangeLevel(5, val),
            val: value.controlLevel[5],
            isOn: value.clicked[5],
            icon: CupertinoIcons.alarm,
            onTap: () => value.clickedButton(5),
          ),
        ],
      ),
    );
  }
}
