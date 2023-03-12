import 'package:cafe_client/main_screen.dart';
import 'package:cafe_client/models/category.dart';
import 'package:flutter/material.dart';
import 'package:cafe_client/widgets/menu_item_list_view_widget.dart';

class CategoryWidget extends StatelessWidget {
  static const double textSize = 16;
  static const double space = 15;
  static const double _height = 270;

  final Category category;

  void scrollToIndex(index) {
    scrollController.animateTo(_height * index,
        duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
  }

  CategoryWidget({
    super.key,
    required this.category,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        for (int i = 0; i < menuItemDataList.length; i++) {
          if (menuItemDataList[i].categoryId == category.id) {
            scrollToIndex(i);
            debugPrint(menuItemDataList[i].categoryId.toString());
            break;
          }
        }
      },
      child: Container(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: space),
            child: Text(category.name,
                style:
                    const TextStyle(fontSize: textSize, color: Colors.white))),
      ),
    );
  }
}
