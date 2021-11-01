import 'dart:convert';
import 'dart:developer';
import 'package:blog/ui/auth/auth_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class AuthRepository {
  Future<AuthModel?>? signin({
    @required String? username,
    @required String? password,
  }) async {
    try {
      await Future.delayed(const Duration(seconds: 3));
      final uri = Uri.parse("http://10.0.2.2:3000/api/user/login");
      final body = <String, String>{
        "email": username!,
        "password": password!,
      };
      final response = await http.post(
        uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(body),
      );
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return AuthModel.fromJson(responseData);
      } else {
        throw (response.statusCode);
      }
    } catch (error) {
      if (error == 401) {
        throw Exception("Incorrect Username or Password");
      } else if (error == 400) {
        throw Exception("Bad Request");
      } else if (error == 500) {
        throw Exception("Internal Server Error");
      } else {
        throw Exception("App is not working properly. Please try letter");
      }
    }
  }
}

Future<void> signout() async {
  await Future.delayed(const Duration(seconds: 5));
}
