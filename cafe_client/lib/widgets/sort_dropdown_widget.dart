import 'package:flutter/material.dart';

class SortDropDownWidget extends StatefulWidget {
  const SortDropDownWidget({super.key});

  @override
  State<SortDropDownWidget> createState() => _SortDropDownWidgetState();
}

class _SortDropDownWidgetState extends State<SortDropDownWidget> {
  static const List<String> sortPositions = <String>[
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
        // This is called when the user selects an item.
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
