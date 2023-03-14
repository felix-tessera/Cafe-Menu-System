import 'package:flutter/material.dart';
import 'package:cafe_client/main_screen.dart';
import 'package:cafe_client/widgets/menu_item_widget.dart';

class MenuItemListViewWidget extends StatelessWidget {
  MenuItemListViewWidget({super.key});

  List<Widget> setMenuItemWidgets() {
    //menuItemDataList.sort((a, b) => a.categoryId.compareTo(b.categoryId));

    List<Widget> menuItemWidgets = [];

    for (int i = 0; i < menuItemDataList.length; i++) {
      var record = MenuItemWidget(menuItem: menuItemDataList[i]);
      menuItemWidgets.add(record);
    }

    return menuItemWidgets.toList();
  }

  static const index = 10;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF010101),
      width: double.infinity,
      child: ListView(
        controller: scrollController,
        children: setMenuItemWidgets(),
      ),
    );
  }
}

final scrollController = ScrollController();

class MenuItemListViewManagerWidget extends StatelessWidget {
  MenuItemListViewManagerWidget({super.key});

  List<Widget> setMenuItemWidgets() {
    //menuItemDataList.sort((a, b) => a.categoryId.compareTo(b.categoryId));

    List<Widget> menuItemWidgets = [];

    for (int i = 0; i < menuItemDataList.length; i++) {
      var record = MenuItemManagerWidget(menuItem: menuItemDataList[i]);
      menuItemWidgets.add(record);
    }

    return menuItemWidgets.toList();
  }

  static const index = 10;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF010101),
      width: double.infinity,
      child: ListView(
        controller: scrollController,
        children: setMenuItemWidgets(),
      ),
    );
  }
}
