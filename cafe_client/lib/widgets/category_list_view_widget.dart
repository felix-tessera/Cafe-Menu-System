import 'package:flutter/material.dart';
import 'package:cafe_client/main_screen.dart';
import 'package:cafe_client/widgets/category_widget.dart';

class CategoryListViewWidget extends StatelessWidget {
  const CategoryListViewWidget({
    super.key,
  });

  List<Widget> setCategoryWidgets() {
    categoryDataList.sort((a, b) => a.id.compareTo(b.id));

    List<Widget> categoryWidgets = [];
    categoryWidgets.clear();

    for (int i = 0; i < categoryDataList.length; i++) {
      var record = CategoryWidget(category: categoryDataList[i]);
      categoryWidgets.add(record);
    }
    debugPrint(categoryWidgets.toString());

    return categoryWidgets.toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 35,
      child: ListView(
        padding: const EdgeInsets.all(8),
        scrollDirection: Axis.horizontal,
        children: setCategoryWidgets(),
      ),
    );
  }
}
