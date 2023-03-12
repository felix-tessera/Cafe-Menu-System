import 'package:flutter/material.dart';
import 'package:cafe_client/main_screen.dart';
import 'package:cafe_client/widgets/menu_item_widget.dart';

class MenuItemListViewWidget extends StatelessWidget {
  const MenuItemListViewWidget({super.key});

  List<Widget> setMenuItemWidgets() {
    menuItemDataList.sort((a, b) => a.categoryId.compareTo(b.categoryId));

    List<Widget> menuItemWidgets = [];

    for (int i = 0; i < menuItemDataList.length; i++) {
      var record = MenuItemWidget(menuItem: menuItemDataList[i]);
      menuItemWidgets.add(record);
    }

    return menuItemWidgets.toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF010101),
      width: double.infinity,
      child: ListView(
        children: setMenuItemWidgets(),
      ),
    );
  }
}
