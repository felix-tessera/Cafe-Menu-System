import 'dart:io';
import 'package:cafe_client/splash_sreen.dart';
import 'package:flutter/material.dart';
import 'main_screen.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SplashScreen(),
    );
  }
}
