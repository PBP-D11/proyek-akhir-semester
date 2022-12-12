// To parse this JSON data, do
//
//     final forum = forumFromJson(jsonString);

import 'dart:convert';

List<Forum> forumFromJson(String str) =>
    List<Forum>.from(json.decode(str).map((x) => Forum.fromJson(x)));

String forumToJson(List<Forum> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Forum {
  Forum({
    required this.model,
    required this.pk,
    required this.fields,
  });

  String model;
  int pk;
  Fields fields;

  factory Forum.fromJson(Map<String, dynamic> json) => Forum(
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
    required this.topic,
    required this.timestamp,
    required this.title,
    required this.body,
  });

  int author;
  int topic;
  DateTime timestamp;
  String title;
  String body;

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        author: json["author"],
        topic: json["topic"],
        timestamp: DateTime.parse(json["timestamp"]),
        title: json["title"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "author": author,
        "topic": topic,
        "timestamp": timestamp.toIso8601String(),
        "title": title,
        "body": body,
      };
}
