import 'package:cafe_client/services/category_service.dart';
import 'package:cafe_client/widgets/app_bar_text_field.dart';
import 'package:cafe_client/widgets/category_list_view_widget.dart';
import 'package:flutter/material.dart';
import 'package:cafe_client/widgets/menu_item_list_view_widget.dart';
import 'package:cafe_client/services/menu_item_service.dart';

class ManagerScreen extends StatefulWidget {
  const ManagerScreen({super.key});

  @override
  State<ManagerScreen> createState() => _ManagerScreenState();
}

createNewMenuItem() {}

loadData() {}

class _ManagerScreenState extends State<ManagerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF222222),
        title: AppBarTextField(callback: loadData),
        elevation: 0.0,
      ),
      body: Container(
        color: const Color(0xFF222222),
        child: Column(children: <Widget>[
          TextButton(
              style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                  foregroundColor: MaterialStateProperty.all(Colors.white)),
              onPressed: () {
                CategoryService categoryService = CategoryService(() {
                  setState(() {});
                });
                categoryService.postCategory();
              },
              child: const Icon(Icons.add_box)),
          CategoryListViewManagerWidget(),
          TextButton(
              style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                  foregroundColor: MaterialStateProperty.all(Colors.white)),
              onPressed: () {
                MenuItemService menuItemService = MenuItemService(() {
                  setState(() {});
                });
                menuItemService.postMenuItem();
              },
              child: const Icon(Icons.add_box)),
          const SizedBox(
            height: 10,
          ),
          Container(
            color: const Color(0xFF010101),
            height: 10,
          ),
          Expanded(child: MenuItemListViewManagerWidget())
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          MenuItemService menuItemService = MenuItemService(() {
            setState(() {});
          });
          CategoryService categoryService = CategoryService(() {
            setState(() {});
          });
          menuItemService.getMenuItems();
          categoryService.getCategories();
        },
        backgroundColor: const Color(0xFF010101),
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
