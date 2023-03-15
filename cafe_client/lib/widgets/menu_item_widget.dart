import 'package:cafe_client/main_screen.dart';
import 'package:cafe_client/models/category.dart';
import 'package:flutter/material.dart';
import 'package:cafe_client/models/menu_item.dart';
import 'package:cafe_client/services/menu_item_service.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MenuItemWidget extends StatelessWidget {
  final MenuItem menuItem;

  const MenuItemWidget({super.key, required this.menuItem});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(9),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 123,
            decoration: const BoxDecoration(
              color: Color(0xFF222222),
              borderRadius: BorderRadius.vertical(top: Radius.circular(11)),
            ),
            child: MenuItemImageWidget(menuItem: menuItem),
            //TODO: place image here
          ),
          Container(
            height: 129,
            decoration: const BoxDecoration(
                color: Color(0xFF222222),
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(11))),
            child: Padding(
              padding: const EdgeInsets.only(top: 10, left: 10, right: 17),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Row(
                      children: [
                        Text(
                          menuItem.name,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          width: 9,
                        ),
                        Expanded(
                          child: Text('${menuItem.weight} г',
                              style: const TextStyle(
                                  color: Color(0xFFC9C9C9), fontSize: 15)),
                        ),
                        Text('${menuItem.caloric} ккал',
                            style: const TextStyle(
                                color: Color(0xFFC9C9C9), fontSize: 15)),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    menuItem.ingredients,
                    style:
                        const TextStyle(color: Color(0xFFD9D9D9), fontSize: 14),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      '${menuItem.price} руб.',
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MenuItemImageWidget extends StatelessWidget {
  MenuItem menuItem;

  MenuItemImageWidget({super.key, required this.menuItem});

  @override
  Widget build(BuildContext context) {
    if (menuItem.available && menuItem.imageLink != null) {
      try {
        return Image.network(menuItem.imageLink.toString(), fit: BoxFit.cover);
      } catch (e) {
        return Placeholder();
      }
    } else {
      return Placeholder();
    }
  }
}

class MenuItemManagerWidget extends StatefulWidget {
  MenuItem menuItem;

  MenuItemManagerWidget({super.key, required this.menuItem});

  @override
  State<StatefulWidget> createState() {
    return _MenuItemManagerWidgetState(menuItem: menuItem);
  }
}

class _MenuItemManagerWidgetState extends State<MenuItemManagerWidget> {
  MenuItem menuItem;

  _MenuItemManagerWidgetState({required this.menuItem});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(9),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              String newImageLink = '';

              showDialog<void>(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Вставьте ссылку'),
                    content: TextFormField(
                      initialValue: menuItem.imageLink,
                      onChanged: (value) {
                        newImageLink = value;
                      },
                    ),
                    actions: <Widget>[
                      TextButton(
                        child: const Text('Применить'),
                        onPressed: () {
                          if (newImageLink != '') {
                            MenuItemService menuItemService =
                                MenuItemService(() {
                              setState(() {});
                            });
                            menuItem = MenuItem(
                                menuItem.id,
                                menuItem.name,
                                menuItem.weight,
                                menuItem.ingredients,
                                menuItem.caloric,
                                menuItem.price,
                                menuItem.available,
                                menuItem.categoryId,
                                newImageLink);
                            menuItemService.putMenuItem(menuItem);
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
              width: double.infinity,
              height: 123,
              decoration: const BoxDecoration(
                color: Color(0xFF222222),
                borderRadius: BorderRadius.vertical(top: Radius.circular(11)),
              ),
              child: MenuItemImageWidget(menuItem: menuItem),
              //TODO: place image here
            ),
          ),
          Container(
            height: 149,
            decoration: const BoxDecoration(
                color: Color(0xFF222222),
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(11))),
            child: Padding(
              padding: const EdgeInsets.only(top: 10, left: 10, right: 17),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            String newName = '';

                            showDialog<void>(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('Изменение имя'),
                                  content: TextFormField(
                                    initialValue: menuItem.name,
                                    onChanged: (value) {
                                      newName = value;
                                    },
                                  ),
                                  actions: <Widget>[
                                    TextButton(
                                      child: Text('Применить'),
                                      onPressed: () {
                                        if (newName != '') {
                                          MenuItemService menuItemService =
                                              MenuItemService(() {
                                            setState(() {});
                                          });
                                          menuItem = MenuItem(
                                              menuItem.id,
                                              newName,
                                              menuItem.weight,
                                              menuItem.ingredients,
                                              menuItem.caloric,
                                              menuItem.price,
                                              menuItem.available,
                                              menuItem.categoryId,
                                              menuItem.imageLink);
                                          menuItemService.putMenuItem(menuItem);
                                        }
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          child: Text(
                            //TODO: wrap with detector
                            menuItem.name,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        const SizedBox(
                          width: 9,
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              String newWeigth = '';

                              showDialog<void>(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text('Изменение веса'),
                                    content: TextFormField(
                                      initialValue: menuItem.weight.toString(),
                                      onChanged: (value) {
                                        newWeigth = value;
                                      },
                                    ),
                                    actions: <Widget>[
                                      TextButton(
                                        child: const Text('Применить'),
                                        onPressed: () {
                                          if (newWeigth != '') {
                                            MenuItemService menuItemService =
                                                MenuItemService(() {
                                              setState(() {});
                                            });
                                            menuItem = MenuItem(
                                                menuItem.id,
                                                menuItem.name,
                                                int.parse(newWeigth),
                                                menuItem.ingredients,
                                                menuItem.caloric,
                                                menuItem.price,
                                                menuItem.available,
                                                menuItem.categoryId,
                                                menuItem.imageLink);
                                            menuItemService
                                                .putMenuItem(menuItem);
                                          }
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            child: Text('${menuItem.weight} г',
                                style: const TextStyle(
                                    color: Color(0xFFC9C9C9), fontSize: 15)),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            String newCaloric = '';

                            showDialog<void>(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text('Изменение калорий'),
                                  content: TextFormField(
                                    initialValue: menuItem.caloric.toString(),
                                    onChanged: (value) {
                                      newCaloric = value;
                                    },
                                  ),
                                  actions: <Widget>[
                                    TextButton(
                                      child: const Text('Применить'),
                                      onPressed: () {
                                        if (newCaloric != '') {
                                          MenuItemService menuItemService =
                                              MenuItemService(() {
                                            setState(() {});
                                          });
                                          menuItem = MenuItem(
                                              menuItem.id,
                                              menuItem.name,
                                              menuItem.weight,
                                              menuItem.ingredients,
                                              int.parse(newCaloric),
                                              menuItem.price,
                                              menuItem.available,
                                              menuItem.categoryId,
                                              menuItem.imageLink);
                                          menuItemService.putMenuItem(menuItem);
                                        }
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          child: Text('${menuItem.caloric} ккал',
                              style: const TextStyle(
                                  color: Color(0xFFC9C9C9), fontSize: 15)),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  GestureDetector(
                    onTap: () {
                      String newIngredients = '';

                      showDialog<void>(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Изменение Ингредиентов'),
                            content: TextFormField(
                              initialValue: menuItem.ingredients.toString(),
                              onChanged: (value) {
                                newIngredients = value;
                              },
                            ),
                            actions: <Widget>[
                              TextButton(
                                child: const Text('Применить'),
                                onPressed: () {
                                  if (newIngredients != '') {
                                    MenuItemService menuItemService =
                                        MenuItemService(() {
                                      setState(() {});
                                    });
                                    menuItem = MenuItem(
                                        menuItem.id,
                                        menuItem.name,
                                        menuItem.weight,
                                        newIngredients,
                                        menuItem.caloric,
                                        menuItem.price,
                                        menuItem.available,
                                        menuItem.categoryId,
                                        menuItem.imageLink);
                                    menuItemService.putMenuItem(menuItem);
                                  }
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Text(
                      menuItem.ingredients,
                      style: const TextStyle(
                          color: Color(0xFFD9D9D9), fontSize: 14),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            String newPrice = '';

                            showDialog<void>(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text('Изменение цены'),
                                  content: TextFormField(
                                    initialValue: menuItem.price.toString(),
                                    onChanged: (value) {
                                      newPrice = value;
                                    },
                                  ),
                                  actions: <Widget>[
                                    TextButton(
                                      child: const Text('Применить'),
                                      onPressed: () {
                                        if (newPrice != '') {
                                          MenuItemService menuItemService =
                                              MenuItemService(() {
                                            setState(() {});
                                          });
                                          menuItem = MenuItem(
                                              menuItem.id,
                                              menuItem.name,
                                              menuItem.weight,
                                              menuItem.ingredients,
                                              menuItem.caloric,
                                              double.parse(newPrice),
                                              menuItem.available,
                                              menuItem.categoryId,
                                              menuItem.imageLink);
                                          menuItemService.putMenuItem(menuItem);
                                        }
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          child: Text(
                            '${menuItem.price} руб.',
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        const Spacer(),
                        PopupMenu(
                          menuItem: menuItem,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PopupMenu extends StatefulWidget {
  MenuItem menuItem;

  PopupMenu({super.key, required this.menuItem});

  @override
  State<PopupMenu> createState() => _PopupMenuState(menuItem: menuItem);
}

enum SampleItem {
  delete,
  changeCategory,
  changeAvailable,
}

class _PopupMenuState extends State<PopupMenu> {
  SampleItem? selectedMenu;

  MenuItem menuItem;
  _PopupMenuState({required this.menuItem});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<SampleItem>(
      color: Colors.white,
      initialValue: selectedMenu,
      // Callback that sets the selected popup menu item.
      onSelected: (SampleItem item) {
        MenuItemService menuItemService = MenuItemService(() {
          setState(() {});
        });
        setState(() {
          selectedMenu = item;
          if (selectedMenu == SampleItem.delete) {
            menuItemService.deleteMenuItem(menuItem);
          } else if (selectedMenu == SampleItem.changeCategory) {
            String newCategoryId = '';
            List<Category> thisCategory = categoryDataList
                .where((element) => element.id == menuItem.categoryId)
                .toList();
            showDialog<void>(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('Изменение категории'),
                  content: TextFormField(
                    initialValue: thisCategory[0].name,
                    onChanged: (value) {
                      newCategoryId = value;
                    },
                  ),
                  actions: <Widget>[
                    TextButton(
                      child: const Text('Применить'),
                      onPressed: () {
                        MenuItemService menuItemService = MenuItemService(() {
                          setState(() {});
                        });
                        List<Category> categoryFinded = categoryDataList
                            .where((element) => element.name == newCategoryId)
                            .toList();
                        if (categoryFinded.isNotEmpty) {
                          menuItem = MenuItem(
                              menuItem.id,
                              menuItem.name,
                              menuItem.weight,
                              menuItem.ingredients,
                              menuItem.caloric,
                              menuItem.price,
                              menuItem.available,
                              categoryFinded[0].id,
                              menuItem.imageLink);
                          menuItemService.putMenuItem(menuItem);
                          Navigator.of(context).pop();
                        } else {
                          Fluttertoast.showToast(
                            msg: 'Такой категории не существует',
                            backgroundColor: Colors.grey,
                          );
                        }
                      },
                    ),
                  ],
                );
              },
            );
          } else if (selectedMenu == SampleItem.changeAvailable) {
            menuItem = MenuItem(
                menuItem.id,
                menuItem.name,
                menuItem.weight,
                menuItem.ingredients,
                menuItem.caloric,
                menuItem.price,
                !menuItem.available,
                menuItem.categoryId,
                menuItem.imageLink);
            menuItemService.putMenuItem(menuItem);
          }
        });
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<SampleItem>>[
        const PopupMenuItem<SampleItem>(
          value: SampleItem.delete,
          child: Text('Удалить блюдо'),
        ),
        const PopupMenuItem<SampleItem>(
          value: SampleItem.changeCategory,
          child: Text('Выбрать категорию'),
        ),
        PopupMenuItem<SampleItem>(
          value: SampleItem.changeAvailable,
          child: Text('Доступен: ${menuItem.available}'),
        ),
      ],
    );
  }
}
