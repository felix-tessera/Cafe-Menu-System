import 'package:flutter/material.dart';
import 'package:cafe_client/main_screen.dart';

class SortDropDownWidget extends StatefulWidget {
  Function callback;
  SortDropDownWidget({super.key, required this.callback});

  @override
  State<SortDropDownWidget> createState() =>
      _SortDropDownWidgetState(callback: callback);
}

class _SortDropDownWidgetState extends State<SortDropDownWidget> {
  Function callback;
  _SortDropDownWidgetState({required this.callback});

  static const List<String> sortPositions = <String>[
    "Не сортировать",
    "По цене",
    "По калорийности",
    "По весу"
  ];

  String dropdownValue = sortPositions.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      dropdownColor: const Color(0xFF222222),
      icon: const Icon(Icons.arrow_drop_down_outlined),
      elevation: 16,
      isDense: true,
      style: const TextStyle(color: Colors.white, fontSize: 16),
      underline: Container(
        height: 0,
      ),
      onChanged: (String? value) {
        if (value == sortPositions[0]) {
          menuItemDataList.sort((a, b) => a.categoryId.compareTo(b.categoryId));
        } else if (value == sortPositions[1]) {
          menuItemDataList.sort((a, b) => a.price.compareTo(b.price));
        } else if (value == sortPositions[2]) {
          menuItemDataList.sort((a, b) => a.caloric.compareTo(b.caloric));
        } else if (value == sortPositions[3]) {
          menuItemDataList.sort((a, b) => a.weight.compareTo(b.weight));
        }
        callback(); // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
        });
      },
      items: sortPositions.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
