import 'package:flutter/material.dart';
import 'package:cafe_client/models/menu_item.dart';
import 'package:cafe_client/services/menu_item_service.dart';

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
            child: Placeholder(),
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

class MenuItemManagerWidget extends StatefulWidget {
  MenuItem menuItem;

  MenuItemManagerWidget({super.key, required this.menuItem});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
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
          Container(
            width: double.infinity,
            height: 123,
            decoration: const BoxDecoration(
              color: Color(0xFF222222),
              borderRadius: BorderRadius.vertical(top: Radius.circular(11)),
            ),
            child: Placeholder(),
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
                        GestureDetector(
                          onTap: () {
                            String NewName = '';

                            showDialog<void>(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('Изменение имя'),
                                  content: TextFormField(
                                    initialValue: menuItem.name,
                                    onChanged: (value) {
                                      NewName = value;
                                    },
                                  ),
                                  actions: <Widget>[
                                    TextButton(
                                      child: Text('Применить'),
                                      onPressed: () {
                                        MenuItemService menuItemService =
                                            MenuItemService(() {
                                          setState(() {});
                                        });
                                        menuItem = MenuItem(
                                            menuItem.id,
                                            NewName,
                                            menuItem.weight,
                                            menuItem.ingredients,
                                            menuItem.caloric,
                                            menuItem.price,
                                            menuItem.available,
                                            menuItem.categoryId);
                                        menuItemService.putMenuItem(menuItem);
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
                              String NewWeigth = '';

                              showDialog<void>(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text('Изменение веса'),
                                    content: TextFormField(
                                      initialValue: menuItem.weight.toString(),
                                      onChanged: (value) {
                                        NewWeigth = value;
                                      },
                                    ),
                                    actions: <Widget>[
                                      TextButton(
                                        child: Text('Применить'),
                                        onPressed: () {
                                          MenuItemService menuItemService =
                                              MenuItemService(() {
                                            setState(() {});
                                          });
                                          menuItem = MenuItem(
                                              menuItem.id,
                                              menuItem.name,
                                              int.parse(NewWeigth),
                                              menuItem.ingredients,
                                              menuItem.caloric,
                                              menuItem.price,
                                              menuItem.available,
                                              menuItem.categoryId);
                                          menuItemService.putMenuItem(menuItem);
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
