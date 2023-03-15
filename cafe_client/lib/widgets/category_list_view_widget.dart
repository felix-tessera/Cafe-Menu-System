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
      height: 45,
      child: Align(
        child: ListView(
          padding: const EdgeInsets.all(8),
          scrollDirection: Axis.horizontal,
          children: setCategoryWidgets(),
        ),
      ),
    );
  }
}

class CategoryListViewManagerWidget extends StatefulWidget {
  const CategoryListViewManagerWidget({super.key});

  @override
  State<CategoryListViewManagerWidget> createState() =>
      _CategoryListViewManagerWidgetState();
}

class _CategoryListViewManagerWidgetState
    extends State<CategoryListViewManagerWidget> {
  List<Widget> setCategoryWidgets() {
    categoryDataList.sort((a, b) => a.id.compareTo(b.id));

    List<Widget> categoryWidgets = [];

    for (int i = 0; i < categoryDataList.length; i++) {
      var record = CategoryManagerWidget(category: categoryDataList[i]);
      categoryWidgets.add(record);
    }
    debugPrint(categoryWidgets.toString());

    return categoryWidgets.toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 45,
      child: Align(
        child: ListView(
          padding: const EdgeInsets.all(8),
          scrollDirection: Axis.horizontal,
          children: setCategoryWidgets(),
        ),
      ),
    );
  }
}
