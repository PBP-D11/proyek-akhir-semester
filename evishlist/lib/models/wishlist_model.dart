// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

List<Car> CarFromJson(String str) =>
    List<Car>.from(json.decode(str).map((x) => Car.fromJson(x)));

String CarToJson(List<Car> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Car {
  Car({
    required this.pk,
    required this.fields,
  });

  int pk;
  Fields fields;

  factory Car.fromJson(Map<String, dynamic> json) => Car(
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
      );

  Map<String, dynamic> toJson() => {
        "pk": pk,
        "fields": fields.toJson(),
      };
}

class Fields {
  Fields({
    required this.name,
    required this.price,
    required this.category,
    required this.photo,
    required this.link_buy,
  });

  String category;
  String name;
  String price;
  String photo;
  String link_buy;

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        category: json["category"],
        name: json["name"],
        price: json["price"],
        photo: json["photo"],
        link_buy: json["link_buy"],
      );

  Map<String, dynamic> toJson() => {
        "category": category,
        "name": name,
        "price": price,
        "photo": photo,
        "link_buy": link_buy,
      };
}
