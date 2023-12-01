import 'dart:ui';

import 'package:flutter/material.dart';

class Reptile {
  final int id;
  final String name;
  final String scientificName;
  final String type;
  final bool hasRedFlag;
  final bool hasMildVenom;
  final String image;
  final String status;
  final int views;
  final bool venomous;
  Family family;
  AddedBy addedBy;

  Reptile({
    required this.id,
    required this.name,
    required this.scientificName,
    required this.type,
    required this.hasRedFlag,
    required this.hasMildVenom,
    required this.image,
    required this.status,
    required this.views,
    required this.venomous,
    required this.family,
    required this.addedBy,
  });

  factory Reptile.fromjson(json) {
    return Reptile(
      id: json["id"],
      name: json["name"],
      scientificName: json["scientificName"],
      type: json["type"],
      hasRedFlag: json["hasRedFlag"],
      hasMildVenom: json["hasMildVenom"],
      image: json["image"],
      status: json["status"],
      views: json["views"],
      venomous: json["venomous"],
      family: Family.fromJson(json['family']),
      addedBy: AddedBy.fromJson(json['addedBy']),
    );
  }
  Color get dangerLevel {
    if (venomous) {
      return Colors.red;
    }
    if (hasMildVenom) {
      return Colors.orange;
    }
    return Colors.green;
  }
}

class Family {
  int id;
  String name;
  String image;

  Family({
    required this.id,
    required this.name,
    required this.image,
  });
  factory Family.fromJson(Map<String, dynamic> json) {
    return Family(
      id: json['id'],
      name: json['name'],
      image: json['image'],
    );
  }
}

class AddedBy {
  int id;
  String firstName;
  String lastName;
  String? avatar;
  String role;

  AddedBy({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.avatar,
    required this.role,
  });
  factory AddedBy.fromJson(Map<String, dynamic> json) {
    return AddedBy(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      avatar: json['avatar'],
      role: json['role'],
    );
  }
}
