import 'package:cafe_client/models/category.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:cafe_client/main_screen.dart';

class CategoryService {
  final Function callback;
  CategoryService(this.callback);

  static const baseUrl = 'http://felixtessera-001-site1.gtempurl.com/';

  getCategories() async {
    try {
      List<Category> bufferData = [];

      final response = await http.get(Uri.parse('${baseUrl}api/categories'));
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
    } catch (error) {
      debugPrint(error.toString());
    }
  }

  putCategory(Category category) async {
    try {
      final response = await http.put(Uri.parse('${baseUrl}api/categories'),
          body: jsonEncode(category),
          headers: {'Content-Type': 'application/json'});
      debugPrint(response.statusCode.toString());
      debugPrint(jsonEncode(category));
      callback();
    } catch (error) {
      debugPrint(error.toString());
    }
  }

  deleteCategory(Category category) async {
    try {
      final response = await http
          .delete(Uri.parse('${baseUrl}api/categories/${category.id}'));
      debugPrint(response.statusCode.toString());
      getCategories();
      callback();
    } catch (error) {
      debugPrint(error.toString());
    }
  }

  postCategory() async {
    CategoryMock categoryMock = CategoryMock('Новая категория');
    try {
      final response = await http.post(Uri.parse('${baseUrl}api/categories'),
          body: json.encode(categoryMock),
          headers: {'Content-Type': 'application/json'});
      getCategories();
    } catch (error) {
      debugPrint(error.toString());
    }
  }
}

class CategoryMock {
  final name;

  CategoryMock(this.name);

  Map<String, String> toJson() {
    return {"name": name};
  }
}
