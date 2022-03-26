import 'dart:convert';

CarouselModel carouselModelFromJson(String str) =>
    CarouselModel.fromJson(json.decode(str));

String carouselModelToJson(CarouselModel data) => json.encode(data.toJson());

class CarouselModel {
  CarouselModel({
    this.items = const [],
  });

  List<Item> items;

  factory CarouselModel.fromJson(Map<String, dynamic> json) => CarouselModel(
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
      };
}

class Item {
  Item({
    this.id,
    this.header,
    this.title,
    this.subtitle,
    this.desc,
    this.imageUrl,
  });

  String? id;
  String? header;
  String? title;
  String? subtitle;
  String? desc;
  String? imageUrl;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"],
        header: json["header"],
        title: json["title"],
        subtitle: json["subtitle"],
        desc: json["desc"],
        imageUrl: json["image_url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "header": header,
        "title": title,
        "subtitle": subtitle,
        "desc": desc,
        "image_url": imageUrl,
      };
}
