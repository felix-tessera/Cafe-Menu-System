import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:cafe_client/models/menu_item.dart';
import 'package:cafe_client/main_screen.dart';

class MenuItemService {
  final Function callback;
  MenuItemService(this.callback);

  getMenuItems() async {
    List<MenuItem> bufferData = [];
    final response =
        await http.get(Uri.parse('https://10.0.2.2:7003/api/menuitems'));
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);

      for (int i = 0; i < data.length; i++) {
        data[i] as Map<String, dynamic>;
      }
      for (int i = 0; i < data.length; i++) {
        data[i]['weight'] = int.parse(data[i]['weight']);
        data[i]['caloric'] = int.parse(data[i]['caloric']);

        var record = MenuItem(
            data[i]['id'],
            data[i]['name'],
            data[i]['weight'],
            data[i]['ingredients'],
            data[i]['caloric'],
            data[i]['price'].toDouble(),
            data[i]['available'],
            data[i]['categoryId'],
            data[i]['imageLink']);

        bufferData.add(record);
      }
      menuItemDataList = bufferData;
      callback();
    }
  }

  putMenuItem(MenuItem menuItem) async {
    final response = await http.put(
        Uri.parse('https://10.0.2.2:7003/api/menuitems'),
        body: jsonEncode(menuItem),
        headers: {'Content-Type': 'application/json'});
    debugPrint(response.statusCode.toString());
    debugPrint(jsonEncode(menuItem));
    callback();
  }

  deleteMenuItem(MenuItem menuItem) async {
    final response = await http.delete(
        Uri.parse('https://10.0.2.2:7003/api/menuitems/${menuItem.id}'));
    debugPrint(response.statusCode.toString());
    callback();
  }

  postMenuItem() async {
    MenuItemMock categoryMock = MenuItemMock(
        'Имя',
        100,
        'Ингредиент, ингредиент, игредиент',
        100,
        10.0,
        true,
        categoryDataList[0].id);

    final response = await http.post(
        Uri.parse('https://10.0.2.2:7003/api/menuitems'),
        body: json.encode(categoryMock),
        headers: {'Content-Type': 'application/json'});
    getMenuItems();
  }
}

class MenuItemMock {
  final String name;
  final int weight;
  final String ingredients;
  final int caloric;
  final double price;
  final bool available;
  final int categoryId;

  MenuItemMock(this.name, this.weight, this.ingredients, this.caloric,
      this.price, this.available, this.categoryId);

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "weight": weight.toString(),
      "ingredients": ingredients,
      "caloric": caloric.toString(),
      "price": price,
      "available": available,
      "categoryId": categoryId
    };
  }
}
