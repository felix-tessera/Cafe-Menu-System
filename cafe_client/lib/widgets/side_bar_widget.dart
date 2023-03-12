import 'package:flutter/material.dart';

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
