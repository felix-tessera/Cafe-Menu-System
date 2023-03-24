import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:cafe_client/auth_screen.dart';

class AuthService {
  final Function whenTrueCallback;
  final Function whenFalseCallback;

  static const baseUrl = 'http://felixtessera-001-site1.gtempurl.com/';

  AuthService(this.whenTrueCallback, this.whenFalseCallback);

  postAuthData(AuthData authData) async {
    try {
      final response = await http.post(Uri.parse('${baseUrl}api/auth'),
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
    } catch (error) {
      debugPrint(error.toString());
    }
  }
}
