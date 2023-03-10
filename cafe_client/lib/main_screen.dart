import 'package:cafe_client/category_service.dart';
import 'package:flutter/material.dart';
import 'package:cafe_client/models/categoty.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return MainScreenState();
  }
}

class MainScreenState extends State<MainScreen> {
  List<Widget> categoryWidgets = [];
  CategoryService categoryService = CategoryService();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideBarWidget(),
      appBar: AppBar(
        backgroundColor: const Color(0xFF222222),
        title: AppBarTextField(),
        elevation: 0.0,
      ),
      body: Container(
        color: const Color(0xFF222222),
        child: ListView(
          padding: const EdgeInsets.all(8),
          scrollDirection: Axis.horizontal,
          children: setCategoryWidgets(),
        ),
      ),
    );
  }

  List<Widget> setCategoryWidgets() {
    categoryWidgets.clear();

    for (int i = 0; i < categoryDataList.length; i++) {
      var record = CategoryWidget(name: categoryDataList[i].name);
      categoryWidgets.add(record);
    }
    debugPrint(categoryWidgets.toString());

    return categoryWidgets.toList();
  }

  loadCategories() async {
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
    setState(() {
      categoryDataList = bufferData;
    });
  }
}

class SideBarWidget extends StatelessWidget {
  const SideBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: const <Widget>[
          ListTile(
            title: Text("Меню 1"),
            trailing: Icon(Icons.arrow_back),
          ),
          ListTile(
            title: Text("Меню 2"),
            trailing: Icon(Icons.arrow_downward),
          ),
        ],
      ),
    );
  }
}

class AppBarTextField extends StatelessWidget {
  const AppBarTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: "Поиск",
        fillColor: const Color(0xFF636363),
        contentPadding: const EdgeInsets.all(10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        filled: true,
      ),
    );
  }
}

// class MainScreen extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//     return MainScreenState();
//   }
// }

List<Category> categoryDataList = [];

//   class MainScreenState extends State<MainScreen> {
//   List<Widget> categoryWidgets = [];
//   CategoryService categoryService = CategoryService();

//   @override
//   void initState() {
//     super.initState();
//     categoryService.loadCategories();
//   }

//   List<Widget> setCategoryWidgets() {
//     categoryWidgets.clear();

//     for (int i = 0; i < categoryDataList.length; i++) {
//       var record = CategoryWidget(name: categoryDataList[i].name);
//       categoryWidgets.add(record);
//     }
//     debugPrint(categoryWidgets.toString());

//     return categoryWidgets;
//   }

//   void loadCategory() {
//     setState(() {
//       categoryWidgets = setCategoryWidgets();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: const Color(0xFF222222),
//       child: GestureDetector(
//         onTap: loadCategory,
//         child: ListView(
//           padding: const EdgeInsets.all(8),
//           scrollDirection: Axis.horizontal,
//           children: categoryWidgets,
//         ),
//       ),
//     );
//   }
// }

class CategoryWidget extends StatelessWidget {
  static const double textSize = 22;
  static const double space = 15;

  final name;

  const CategoryWidget({
    super.key,
    required this.name,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: space),
        child: Text(name,
            style: TextStyle(fontSize: textSize, color: Colors.white)));
  }
}
