// To parse this JSON data, do
//
//     final comment = commentFromJson(jsonString);

import 'dart:convert';

List<Comment> commentFromJson(String str) =>
    List<Comment>.from(json.decode(str).map((x) => Comment.fromJson(x)));

String commentToJson(List<Comment> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Comment {
  Comment({
    required this.model,
    required this.pk,
    required this.fields,
  });

  String model;
  int pk;
  Fields fields;

  factory Comment.fromJson(Map<String, dynamic> json) => Comment(
        model: json["model"],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
      );

  Map<String, dynamic> toJson() => {
        "model": model,
        "pk": pk,
        "fields": fields.toJson(),
      };
}

class Fields {
  Fields({
    required this.author,
    required this.post,
    required this.timestamp,
    required this.body,
  });

  int author;
  int post;
  DateTime timestamp;
  String body;

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        author: json["author"],
        post: json["post"],
        timestamp: DateTime.parse(json["timestamp"]),
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "author": author,
        "post": post,
        "timestamp": timestamp.toIso8601String(),
        "body": body,
      };
}
