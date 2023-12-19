import 'dart:ui';

import 'package:flutter/material.dart';

class ReptileQuery {
  final int id;
  final String name;
  final String scientificName;
  final String genus;
  final String type;
  final String description;
  final bool hasRedFlag;
  final bool hasMildVenom;
  final String image;
  final String status;
  final int views;
  final int createdAt;
  final int? publishAt;
  final bool venomous;
  Family family;
  AddedBy addedBy;
  final List<GalleryItem> gallery;

  ReptileQuery({
    required this.id,
    required this.name,
    required this.scientificName,
    required this.genus,
    required this.type,
    required this.description,
    required this.hasRedFlag,
    required this.hasMildVenom,
    required this.image,
    required this.status,
    required this.views,
    required this.createdAt,
    required this.publishAt,
    required this.venomous,
    required this.family,
    required this.addedBy,
    required this.gallery,
  });
  factory ReptileQuery.fromjson(json) {
    List<GalleryItem> galleryList = [];
    if (json['gallery'] != null) {
      galleryList = List<GalleryItem>.from(
        json['gallery'].map((galleryItem) => GalleryItem.fromJson(galleryItem)),
      );
    }

    return ReptileQuery(
      id: json["id"],
      name: json["name"],
      scientificName: json["scientificName"],
      genus: json["genus"],
      type: json["type"],
      description: json["description"],
      hasRedFlag: json["hasRedFlag"],
      hasMildVenom: json["hasMildVenom"],
      image: json["image"],
      status: json["status"],
      views: json["views"],
      createdAt: json["createdAt"],
      publishAt: json["publishAt"],
      venomous: json["venomous"],
      family: Family.fromJson(json['family']),
      addedBy: AddedBy.fromJson(json['addedBy']),
      gallery: galleryList,
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
  final int id;
  final String name;
  final String image;

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

class GalleryItem {
  final int id;
  final String url;
  final List<String> credits;
  final Author author;

  GalleryItem({
    required this.id,
    required this.url,
    required this.credits,
    required this.author,
  });

  factory GalleryItem.fromJson(Map<String, dynamic> json) {
    return GalleryItem(
      id: json['id'],
      url: json['url'],
      credits: List<String>.from(json['credits']),
      author: Author.fromJson(json['author']),
    );
  }
}

class Author {
  final int id;
  final String firstName;
  final String lastName;
  final String avatar;
  final String role;

  Author({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.avatar,
    required this.role,
  });

  factory Author.fromJson(Map<String, dynamic> json) {
    return Author(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      avatar: json['avatar'],
      role: json['role'],
    );
  }
}
