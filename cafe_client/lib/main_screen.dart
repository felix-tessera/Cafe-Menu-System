import 'package:cafe_client/services/menu_item_service.dart';
import 'package:flutter/material.dart';
import 'package:cafe_client/widgets/menu_item_widget.dart';
import 'package:cafe_client/services/category_service.dart';
import 'package:cafe_client/models/category.dart';
import 'package:cafe_client/models/menu_item.dart';
import 'package:cafe_client/widgets/sort_dropdown_widget.dart';
import 'package:cafe_client/widgets/category_list_view_widget.dart';
import 'package:cafe_client/widgets/side_bar_widget.dart';
import 'package:cafe_client/widgets/app_bar_text_field.dart';
import 'package:cafe_client/widgets/menu_item_list_view_widget.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return MainScreenState();
  }
}

class MainScreenState extends State<MainScreen> {
  CategoryService? categoryService;
  MenuItemService? menuItemService;

  @override
  void initState() {
    super.initState();
    categoryService = CategoryService(loadData);
    categoryService?.getCategories();
    menuItemService = MenuItemService(loadData);
    menuItemService?.getMenuItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SideBarWidget(),
      appBar: AppBar(
        backgroundColor: const Color(0xFF222222),
        title: const AppBarTextField(),
        elevation: 0.0,
      ),
      body: Container(
        color: const Color(0xFF222222),
        child: Column(
          children: <Widget>[
            CategoryListViewWidget(),
            const SortDropDownWidget(),
            const SizedBox(
              height: 10,
            ),
            Container(
              color: const Color(0xFF010101),
              height: 10,
            ),
            Expanded(child: MenuItemListViewWidget()),
          ],
        ),
      ),
    );
  }

  MenuItem menuItem = MenuItem(
      1,
      'Ролл "Филаделфия Лайт"',
      '230',
      'Форель с/с, творожный сыр, норм, рил для ролл, васаби, соевый соус, лимон. В комплект входит одиннабор палочек.',
      '160',
      16.0,
      true,
      2);

  loadData() async {
    setState(() {});
  }
}

List<Category> categoryDataList = [];
List<MenuItem> menuItemDataList = [];
