import 'package:flutter/material.dart';
import 'package:cafe_client/main_screen.dart';

class AppBarTextField extends StatelessWidget {
  const AppBarTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onSubmitted: (value) {
        Searcher searcher = Searcher(value);
        searcher.search();
      },
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        hintText: "Поиск",
        hintStyle: const TextStyle(color: Colors.white),
        fillColor: const Color(0xFF636363),
        contentPadding: const EdgeInsets.all(10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        filled: true,
      ),
    );
  }
}

class Searcher {
  String searchString;
  Searcher(this.searchString);
  var bufferMenuItemDataList = menuItemDataList;

  search() {
    searchString = searchString.toLowerCase();
    var findedElements = menuItemDataList
        .where((element) =>
            element.name.toLowerCase().contains(searchString) == true)
        .toList();
    menuItemDataList = findedElements;
    debugPrint(findedElements.toString());
  }
}
