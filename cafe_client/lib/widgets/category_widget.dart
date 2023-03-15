import 'package:cafe_client/main_screen.dart';
import 'package:cafe_client/models/category.dart';
import 'package:cafe_client/services/category_service.dart';
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

class CategoryManagerWidget extends StatefulWidget {
  final Category category;

  const CategoryManagerWidget({super.key, required this.category});

  @override
  State<CategoryManagerWidget> createState() =>
      _CategoryManagerWidgetState(category);
}

class _CategoryManagerWidgetState extends State<CategoryManagerWidget> {
  static const double textSize = 16;
  static const double space = 15;
  Category category;

  _CategoryManagerWidgetState(this.category);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        String newName = '';

        showDialog<void>(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Изменение категории'),
              content: TextFormField(
                initialValue: category.name.toString(),
                onChanged: (value) {
                  newName = value;
                },
              ),
              actions: <Widget>[
                TextButton(
                    onPressed: () {
                      CategoryService categoryService = CategoryService(() {
                        setState(() {});
                      });
                      categoryService.deleteCategory(category);
                      Navigator.of(context).pop();
                    },
                    child: const Text('Удалить')),
                TextButton(
                  child: const Text('Применить'),
                  onPressed: () {
                    if (newName != '') {
                      CategoryService categoryService = CategoryService(() {
                        setState(() {});
                      });
                      category = Category(
                        category.id,
                        newName,
                      );
                      categoryService.putCategory(category);
                    }
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
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
