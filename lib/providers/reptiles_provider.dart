import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:herpi/models/reptiles.dart';
import 'package:http/http.dart' as http;

class ReptilesProvider with ChangeNotifier {
  List<Reptile> _reptiles = [];
  List<Reptile> get reptiles => _reptiles;
  List<Reptile> _allreptiles = [];
  List<Reptile> get allreptiles => _allreptiles;

  Future<void> fetchReptiles(String lat, String lng) async {
    final response = await http.get(Uri.parse(
        "https://api.herpi.ge/api/v1/reptiles/nearby?lat=$lat&lng=$lng"));
    if (response.statusCode == 200) {
      final List<dynamic> responseData = jsonDecode(response.body);

      _reptiles = responseData.map((json) => Reptile.fromjson(json)).toList();
    } else {
      throw Exception('Failed to load posts ');
    }
    notifyListeners();
  }

  Future<void> fetchAllptiles() async {
    final response =
        await http.get(Uri.parse("https://api.herpi.ge/api/v1/reptiles"));
    if (response.statusCode == 200) {
      final List<dynamic> responseData = jsonDecode(response.body);

      _allreptiles =
          responseData.map((json) => Reptile.fromjson(json)).toList();
    } else {
      throw Exception('Failed to load posts ');
    }
    notifyListeners();
  }
}
