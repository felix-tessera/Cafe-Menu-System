import 'package:flutter/material.dart';
import 'package:cafe_client/services/auth_service.dart';
import 'package:cafe_client/manager_screen.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

String errorTextValue = '';

class _AuthScreenState extends State<AuthScreen> {
  AuthData authData = AuthData();

  bool isPassInvisible = true;
  Icon eyeIcon = const Icon(
    Icons.remove_red_eye_outlined,
    color: Colors.white,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xFF010101),
        child: Column(children: [
          const Padding(
            padding: EdgeInsets.only(top: 148),
            child: Align(
              alignment: Alignment.topCenter,
              child: Text(
                'Войти',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(
                left: 57,
                right: 57,
                top: 150,
              ),
              child: TextField(
                onChanged: (value) {
                  authData.login = value;
                },
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    errorText: errorTextValue.isEmpty ? null : '',
                    hintText: 'Логин',
                    hintStyle: const TextStyle(color: Color(0xFFcdcdcd)),
                    enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFcdcdcd)))),
              )),
          Expanded(
            child: Padding(
                padding: const EdgeInsets.only(
                  left: 57,
                  right: 57,
                  top: 33,
                ),
                child: TextField(
                  onChanged: (value) {
                    authData.password = value;
                  },
                  keyboardType: TextInputType.visiblePassword,
                  style: const TextStyle(color: Colors.white),
                  obscureText: isPassInvisible,
                  decoration: InputDecoration(
                      errorText: errorTextValue.isEmpty
                          ? null
                          : 'Неверный логин или пароль',
                      suffixIcon: GestureDetector(
                        onTap: () {
                          isPassInvisible = !isPassInvisible;
                          if (isPassInvisible) {
                            eyeIcon = const Icon(
                              Icons.remove_red_eye_outlined,
                              color: Colors.white,
                            );
                          } else {
                            eyeIcon = const Icon(
                              Icons.remove_red_eye_rounded,
                              color: Colors.white,
                            );
                          }
                          setState(() {});
                        },
                        child: eyeIcon,
                      ),
                      hintText: 'Пароль',
                      hintStyle: const TextStyle(color: Color(0xFFcdcdcd)),
                      enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFcdcdcd)))),
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 57, right: 57),
            child: ElevatedButton(
              onPressed: () {
                AuthService authService = AuthService(() {
                  setState(() {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ManagerScreen()));
                  });
                }, () {
                  setState(() {});
                });
                authService.postAuthData(authData);
              },
              style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(
                      const Size(double.infinity, 40)),
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(22.0),
                  ))),
              child: const Text(
                'Авторизоваться',
                style: TextStyle(color: Colors.black, fontSize: 17),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

class AuthData {
  String login = '';
  String password = '';

  Map<String, String> toJson() {
    return {
      "login": login,
      "password": password,
    };
  }
}
