import 'package:cafe_client/models/category.dart';
import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  static const double textSize = 16;
  static const double space = 15;

  final Category category;

  const CategoryWidget({
    super.key,
    required this.category,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: space),
        child: Text(category.name,
            style: const TextStyle(fontSize: textSize, color: Colors.white)));
  }
}
