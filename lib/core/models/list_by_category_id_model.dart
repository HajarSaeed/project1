// To parse this JSON data, do
//
//     final listByCategoriesIdModel = listByCategoriesIdModelFromJson(jsonString);

import 'dart:convert';

ListByCategoriesIdModel listByCategoriesIdModelFromJson(String str) => ListByCategoriesIdModel.fromJson(json.decode(str));

String listByCategoriesIdModelToJson(ListByCategoriesIdModel data) => json.encode(data.toJson());

class ListByCategoriesIdModel {
  final String? message;
  final Data? data;

  ListByCategoriesIdModel({
    this.message,
    this.data,
  });

  factory ListByCategoriesIdModel.fromJson(Map<String, dynamic> json) => ListByCategoriesIdModel(
    message: json["message"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "data": data?.toJson(),
  };
}

class Data {
  final List<ListElement>? list;

  Data({
    this.list,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    list: json["list"] == null ? [] : List<ListElement>.from(json["list"]!.map((x) => ListElement.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "list": list == null ? [] : List<dynamic>.from(list!.map((x) => x.toJson())),
  };
}

class ListElement {
  final int? id;
  final String? title;
  final String? description;
  final String? image;
  final DateTime? createdAt;
  final Category? category;

  ListElement({
    this.id,
    this.title,
    this.description,
    this.image,
    this.createdAt,
    this.category,
  });

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
    id: json["id"],
    title: json["title"],
    description: json["description"],
    image: json["image"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    category: json["category"] == null ? null : Category.fromJson(json["category"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "description": description,
    "image": image,
    "created_at": createdAt?.toIso8601String(),
    "category": category?.toJson(),
  };
}

class Category {
  final int? id;
  final String? title;
  final DateTime? createdAt;

  Category({
    this.id,
    this.title,
    this.createdAt,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"],
    title: json["title"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "created_at": createdAt?.toIso8601String(),
  };
}
