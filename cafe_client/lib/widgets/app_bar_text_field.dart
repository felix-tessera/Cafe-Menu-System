import 'package:flutter/material.dart';
import 'package:cafe_client/main_screen.dart';
import 'package:cafe_client/models/menu_item.dart';
import 'package:cafe_client/services/menu_item_service.dart';

class AppBarTextField extends StatelessWidget {
  Function callback;

  AppBarTextField({super.key, required this.callback});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onTap: () {
        MenuItemService menuItemService = MenuItemService(callback);
        menuItemService.getMenuItems();
      },
      onSubmitted: (value) {
        Searcher searcher = Searcher(value);
        menuItemDataList = searcher.search();
        if (value == '') {
          MenuItemService menuItemService = MenuItemService(callback);
          menuItemService.getMenuItems();
          debugPrint(menuItemDataList.toString());
        }
        callback();
      },
      keyboardType: TextInputType.text,
      style: const TextStyle(color: Colors.white),
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

var bufferMenuItemDataList = menuItemDataList;

class Searcher {
  String searchString;
  Searcher(this.searchString);

  List<MenuItem> search() {
    searchString = searchString.toLowerCase();
    var findedElements = menuItemDataList
        .where((element) =>
            element.name.toLowerCase().contains(searchString) == true)
        .toList();
    debugPrint(menuItemDataList.toString());
    return findedElements;
  }
}
