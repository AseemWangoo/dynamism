import 'dart:convert';

CarouselModel carouselModelFromJson(String str) =>
    CarouselModel.fromJson(json.decode(str) as Map<String, dynamic>);

String carouselModelToJson(CarouselModel data) => json.encode(data.toJson());

class CarouselModel {
  CarouselModel({
    this.items,
  });

  List<Item> items;

  factory CarouselModel.fromJson(Map<String, dynamic> json) => CarouselModel(
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        "items": List<dynamic>.from(items.map<dynamic>((x) => x.toJson())),
      };
}

class Item {
  Item({
    this.id,
    this.header,
    this.title,
    this.subtitle,
    this.imageUrl,
  });

  String id;
  String header;
  String title;
  String subtitle;
  String imageUrl;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"] as String,
        header: json["header"] as String,
        title: json["title"] as String,
        subtitle: json["subtitle"] as String,
        imageUrl: json["image_url"] as String,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        "id": id,
        "header": header,
        "title": title,
        "subtitle": subtitle,
        "image_url": imageUrl,
      };
}
