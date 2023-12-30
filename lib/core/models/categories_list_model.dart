// To parse this JSON data, do
//
//     final categoriesListModel = categoriesListModelFromJson(jsonString);

import 'dart:convert';

CategoriesListModel categoriesListModelFromJson(String str) => CategoriesListModel.fromJson(json.decode(str));

String categoriesListModelToJson(CategoriesListModel data) => json.encode(data.toJson());

class CategoriesListModel {
  final String? message;
  final Data? data;

  CategoriesListModel({
    this.message,
    this.data,
  });

  factory CategoriesListModel.fromJson(Map<String, dynamic> json) => CategoriesListModel(
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

  @override
  String toString() {
    return 'Data{list: $list}';
  }

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
  final DateTime? createdAt;

  ListElement({
    this.id,
    this.title,
    this.createdAt,
  });

  @override
  String toString() {
    return 'ListElement{id: $id, title: $title, createdAt: $createdAt}';
  }

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
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
