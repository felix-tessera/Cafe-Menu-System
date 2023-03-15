import 'package:cafe_client/models/category.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:cafe_client/main_screen.dart';

class CategoryService {
  final Function callback;
  CategoryService(this.callback);

  getCategories() async {
    List<Category> bufferData = [];

    final response =
        await http.get(Uri.parse('https://10.0.2.2:7003/api/categories'));
    if (response.statusCode == 200) {
      debugPrint(response.body.toString());

      List<dynamic> data = json.decode(response.body);

      for (int i = 0; i < data.length; i++) {
        data[i] as Map<String, dynamic>;
      }

      for (int i = 0; i < data.length; i++) {
        var record = Category(data[i]['id'], data[i]['name']);

        bufferData.add(record);
      }
    }
    categoryDataList = bufferData;
    callback();
  }

  putCategory(Category category) async {
    final response = await http.put(
        Uri.parse('https://10.0.2.2:7003/api/categories'),
        body: jsonEncode(category),
        headers: {'Content-Type': 'application/json'});
    debugPrint(response.statusCode.toString());
    debugPrint(jsonEncode(category));
    callback();
  }

  deleteCategory(Category category) async {
    final response = await http.delete(
        Uri.parse('https://10.0.2.2:7003/api/categories/${category.id}'));
    debugPrint(response.statusCode.toString());
    getCategories();
    callback();
  }

  postCategory() async {
    CategoryMock categoryMock = CategoryMock('Новая категория');

    final response = await http.post(
        Uri.parse('https://10.0.2.2:7003/api/categories'),
        body: json.encode(categoryMock),
        headers: {'Content-Type': 'application/json'});
    getCategories();
  }
}

class CategoryMock {
  final name;

  CategoryMock(this.name);

  Map<String, String> toJson() {
    return {"name": name};
  }
}
