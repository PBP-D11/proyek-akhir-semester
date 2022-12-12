// ignore_for_file: non_constant_identifier_names

import 'dart:convert';


List<News> NewsFromJson(String str) => List<News>.from(json.decode(str).map((x) => News.fromJson(x)));

String NewsToJson(List<News> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));


class News {
  News({
    required this.pk,
    required this.fields,
  });

  int pk;
  Fields fields;


  factory News.fromJson(Map<String, dynamic> json) => News(
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
    required this.title,
    required this.description,
    required this.image,
    required this.url,
  });

  
  String title;
  String description;
  String image;
  String url;

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        
        title: json["title"],
        description: json["description"],
        image: json["image"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        
        "title": title,
        "description": description,
        "image": image,
        "url": url
      };
}