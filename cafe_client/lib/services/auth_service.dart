import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:cafe_client/auth_screen.dart';

class AuthService {
  final Function whenTrueCallback;
  final Function whenFalseCallback;

  AuthService(this.whenTrueCallback, this.whenFalseCallback);

  postAuthData(AuthData authData) async {
    final response = await http.post(
        Uri.parse('https://10.0.2.2:7003/api/auth'),
        body: jsonEncode(authData),
        headers: {'Content-Type': 'application/json'});
    debugPrint(jsonEncode(authData));
    debugPrint(response.body.toString());
    if (response.statusCode == 200) {
      if (response.body == "true") {
        errorTextValue = '';
        whenTrueCallback();
      } else {
        errorTextValue = '.';
        whenFalseCallback();
      }
    }
  }
}
