import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class HomeProvider extends ChangeNotifier {
  int total = 0;
  int pending = 0;
  int approved = 0;
  bool isLoading = true;

  HomeProvider() {
    fetchCounts();
  }

  Future<void> fetchCounts() async {
    isLoading = true;
    notifyListeners();

    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString("token");

      final url = Uri.parse(
        "https://admin.bdsofttechnology.com/api/data-collection/count",
      );
      final response = await http.get(
        url,
        headers: {
          "Accept": "application/json",
          "Authorization": "Bearer $token",
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        total = data["total"];
        pending = data["pending"];
        approved = data["approved"];
      } else {
        // Handle error if needed
        total = 0;
        pending = 0;
        approved = 0;
      }
    } catch (e) {
      print("Error fetching counts: $e");
    }

    isLoading = false;
    notifyListeners();
  }
}
