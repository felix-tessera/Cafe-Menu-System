import 'package:cafe_client/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String screenText = 'Загрузка...';

  checkNetworkConnection() async {
    bool isHasConnection = await InternetConnectionChecker().hasConnection;
    print(isHasConnection.toString());
    if (isHasConnection) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MainScreen()));
    } else {
      screenText = 'Нет подключения к интернету :(';
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    checkNetworkConnection();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xFF010101),
        child: Center(
            child: Text(
          screenText,
          style: const TextStyle(color: Colors.white, fontSize: 16),
        )),
      ),
    );
  }
}
