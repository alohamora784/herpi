import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:herpi/models/reptiles.dart';
import 'package:herpi/models/reptiles_query.dart';
import 'package:herpi/models/reptiles_types.dart';
import 'package:http/http.dart' as http;

class ReptilesProvider with ChangeNotifier {
  List<Reptile> _reptiles = [];
  List<Reptile> get reptiles => _reptiles;
  List<Reptile> _reptilesbycategory = [];
  List<Reptile> get reptilesbycategory => _reptilesbycategory;
  List<Reptile> _allreptiles = [];
  List<Reptile> _reptilesbyslider = [];
  List<Reptile> get reptilesbyslider => _reptilesbyslider;
  List<Reptile> get allreptiles => _allreptiles;
  List<ReptileType> _reptiletypes = [];
  List<ReptileType> get reptiletypes => _reptiletypes;

  Future<void> fetchLocalReptiles(String lat, String lng) async {
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

  categoryslider(int i) {
    if (i == 0) {
      _reptilesbycategory = _reptiles
          .where(
            (element) => element.type.contains("SNAKE"),
          )
          .toList();

      ();
    } else if ((i == 1)) {
      _reptilesbycategory = _reptiles
          .where(
            (element) => element.type.contains("LIZARD"),
          )
          .toList();
    } else if (i == 2) {
      _reptilesbycategory = _reptiles
          .where(
            (element) => element.type.contains("SCORPION"),
          )
          .toList();
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

  filterbyslider(int index) {
    if (index == 0) {
      _reptilesbyslider = _allreptiles
          .where((element) => element.type.contains("SNAKE"))
          .toList();
    } else if (index == 1) {
      _reptilesbyslider = _allreptiles
          .where((element) => element.type.contains("LIZARD"))
          .toList();
    } else if (index == 2) {
      _reptilesbyslider = _allreptiles
          .where((element) => element.type.contains("SCORPION"))
          .toList();
    }
    notifyListeners();
  }

  Future<void> fetchReptileType(String name) async {
    final response = await http
        .get(Uri.parse("https://api.herpi.ge/api/v1/family?type=$name"));
    if (response.statusCode == 200) {
      final List<dynamic> responseData = jsonDecode(response.body);

      _reptiletypes =
          responseData.map((json) => ReptileType.fromjson(json)).toList();
    } else {
      throw Exception('Failed to load posts ');
    }
    notifyListeners();
  }

  Future<ReptileQuery> fetchWithId(int id) async {
    final response =
        await http.get(Uri.parse("https://api.herpi.ge/api/v1/reptiles/$id"));
    print("https://api.herpi.ge/api/v1/reptiles/$id");
    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);

      return ReptileQuery.fromjson(responseData);
    } else {
      throw Exception('Failed to load posts ');
    }
  }
}
