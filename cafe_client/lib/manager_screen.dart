import 'package:flutter/material.dart';
import 'package:cafe_client/widgets/menu_item_list_view_widget.dart';

class ManagerScreen extends StatefulWidget {
  const ManagerScreen({super.key});

  @override
  State<ManagerScreen> createState() => _ManagerScreenState();
}

createNewMenuItem() {}

class _ManagerScreenState extends State<ManagerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MenuItemListViewManagerWidget(),
      floatingActionButton: const FloatingActionButton(
        onPressed: createNewMenuItem,
        backgroundColor: Color(0xFF010101),
        child: Icon(Icons.add),
      ),
    );
  }
}
