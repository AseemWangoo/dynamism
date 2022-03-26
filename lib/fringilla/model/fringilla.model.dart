import 'dart:convert';

FringillaModel fringillaModelFromJson(String str) =>
    FringillaModel.fromJson(json.decode(str));

String fringillaModelToJson(FringillaModel data) => json.encode(data.toJson());

class FringillaModel {
  FringillaModel({
    this.items = const [],
  });

  List<Item> items;

  factory FringillaModel.fromJson(Map<String, dynamic> json) => FringillaModel(
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
      };
}

class Item {
  Item({
    this.id,
    this.index,
    this.description,
    this.urlLink,
  });

  String? id;
  String? index;
  String? description;
  String? urlLink;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"],
        index: json["index"],
        description: json["description"],
        urlLink: json["url_link"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "index": index,
        "description": description,
        "url_link": urlLink,
      };
}
