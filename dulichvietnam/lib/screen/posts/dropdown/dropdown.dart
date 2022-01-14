import 'package:flutter/material.dart';

class DropdownButtonExample extends StatefulWidget {
  const DropdownButtonExample({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _DropdownButtonExampleState();
}

class _DropdownButtonExampleState extends State<DropdownButtonExample> {
  final List<DropdownMenuItem<String>> _dropDownMenuItems = items
      .map(
        (String value) => DropdownMenuItem<String>(
          value: value,
          child: Text(value, style: TextStyle(fontSize: 12)),
        ),
      )
      .toList();

  String dropdownvalue = 'Địa danh';

  // List of items in our dropdown menu
  static const items = <String>[
    'Địa danh',
    'Nơi lưu trú',
    'Quán ăn',
    'Món ăn',
  ];
  @override
  Widget build(BuildContext context) {
    Widget drop = DropdownButton<String>(
      value: dropdownvalue,
      onChanged: (String? newValue) {
        if (newValue != null) {
          setState(() => dropdownvalue = newValue);
        }
      },
      items: this._dropDownMenuItems,
    );
    return Container(
      child: drop,
    );
  }
}
