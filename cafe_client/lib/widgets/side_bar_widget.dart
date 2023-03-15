import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:cafe_client/auth_screen.dart';

class SideBarWidget extends StatelessWidget {
  int count = 5;

  SideBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: const Color(0xFF010101),
        child: Padding(
          padding: const EdgeInsets.only(top: 27, left: 21),
          child: ListView(
            children: <Widget>[
              const Text(
                'Авторы',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 4,
              ),
              const Text(
                'Ермолюгин Никита Сергеевич',
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
              const SizedBox(
                height: 4,
              ),
              const Text(
                'Разработано в рамках учебной практикипо разработке и сопровождению.',
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
              const Padding(
                padding: EdgeInsets.only(right: 21),
                child: Divider(
                  height: 20,
                  thickness: 1,
                  indent: 0,
                  endIndent: 0,
                  color: Colors.white,
                ),
              ),
              GestureDetector(
                onDoubleTap: () {
                  count--;
                  if (count > 0) {
                    Fluttertoast.showToast(
                      msg: 'Осталось $count раз!',
                      backgroundColor: Colors.grey,
                    );
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AuthScreen()),
                    );
                  }
                },
                child: const Text(
                  'Версия: 0.0.1 Бета',
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
