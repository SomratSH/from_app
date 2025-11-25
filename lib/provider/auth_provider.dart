import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier {
  // Form Key
  final formKey = GlobalKey<FormState>();

  // Controllers
  final name = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final phone = TextEditingController();
  String? gender;

  bool isLoading = false;

  void setGender(String? value) {
    gender = value;
    notifyListeners();
  }

  Future<Map<String, dynamic>> registerUser() async {
    if (!formKey.currentState!.validate()) {
      return {"success": false, "message": "Please fill all fields"};
    }

    isLoading = true;
    notifyListeners();

    final url = Uri.parse("https://admin.bdsofttechnology.com/api/register");

    var request = http.MultipartRequest("POST", url);

    request.fields['name'] = name.text.trim();
    request.fields['email'] = email.text.trim();
    request.fields['password'] = password.text.trim();
    request.fields['phone'] = phone.text.trim();
    request.fields['gender'] = gender ?? "";
    email.clear();
    password.clear();
    try {
      final response = await request.send();
      final resBody = await response.stream.bytesToString();
      final jsonData = jsonDecode(resBody);

      isLoading = false;
      notifyListeners();

      if (response.statusCode == 200) {
        return {
          "success": true,
          "data": jsonData["data"],
          "token": jsonData["token"],
        };
      } else {
        return {
          "success": false,
          "message": jsonData["message"] ?? "Something went wrong",
        };
      }
    } catch (e) {
      isLoading = false;
      notifyListeners();
      return {"success": false, "message": "Network error, try again"};
    }
  }

  Future<bool> login() async {
    isLoading = true;
    notifyListeners();

    try {
      final url = Uri.parse("https://admin.bdsofttechnology.com/api/login");

      final response = await http.post(
        url,
        headers: {"Accept": "application/json"},
        body: {"email": email.text.trim(), "password": password.text.trim()},
      );

      final data = jsonDecode(response.body);

      if (response.statusCode == 200 && data["code"] == 200) {
        // if (data["errors"]["email"] != null) {
        //   return false;
        // }
        String token = data["token"];

        // SAVE TOKEN
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString("token", token);

        isLoading = false;
        notifyListeners();
        return true;
      } else {
        isLoading = false;
        notifyListeners();
        return false;
      }
    } catch (e) {
      print("Login error: $e");
      isLoading = false;
      notifyListeners();
      return false;
    }
  }

  Future<bool> logout() async {
    try {
      isLoading = true;
      notifyListeners();

      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.remove("token"); // remove stored token

      isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      isLoading = false;
      notifyListeners();
      print("Logout error: $e");
      return false;
    }
  }

  @override
  void dispose() {
    name.dispose();
    email.dispose();
    password.dispose();
    phone.dispose();
    super.dispose();
  }
}
