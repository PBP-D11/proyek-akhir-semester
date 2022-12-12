// To parse this JSON data, do
//
//     final profile = profileFromJson(jsonString);

import 'dart:convert';

Profile profileFromJson(String str) => Profile.fromJson(json.decode(str));

String profileToJson(Profile data) => json.encode(data.toJson());

class Profile {
  Profile({
    required this.fullName,
    required this.username,
    required this.email,
    required this.contributor,
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.password,
  });

  String fullName;
  String username;
  String email;
  bool contributor;
  String firstName;
  String lastName;
  String phone;
  String password;

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        fullName: json["full_name"],
        username: json["username"],
        email: json["email"],
        contributor: json["contributor"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        phone: json["phone"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "full_name": fullName,
        "username": username,
        "email": email,
        "contributor": contributor,
        "first_name": firstName,
        "last_name": lastName,
        "phone": phone,
        "password": password,
      };
}


// // To parse this JSON data, do
// //
// //     final profile = profileFromJson(jsonString);

// import 'dart:convert';

// Profile profileFromJson(String str) => Profile.fromJson(json.decode(str));

// String profileToJson(Profile data) => json.encode(data.toJson());

// class Fields {
//   Fields({
//     required this.fullName,
//     required this.username,
//     required this.email,
//     required this.contributor,
//     required this.firstName,
//     required this.lastName,
//     required this.phone,
//     required this.password,
//   });

//   String fullName;
//   String username;
//   String email;
//   bool contributor;
//   String firstName;
//   String lastName;
//   String phone;
//   String password;

//   factory Fields.fromJson(Map<String, dynamic> json) => Fields(
//       fullName: json["full_name"],
//       username: json["username"],
//       email: json["email"],
//       contributor: json["contributor"],
//       firstName: json["first_name"],
//       lastName: json["last_name"],
//       phone: json["phone"],
//       password: json["password"]);

//   Map<String, dynamic> toJson() => {
//         "full_name": fullName,
//         "username": username,
//         "email": email,
//         "contributor": contributor,
//         "first_name": firstName,
//         "last_name": lastName,
//         "phone": phone,
//         "password": password,
//       };
// }

// class Profile {
//   Profile({
//     required this.model,
//     required this.pk,
//     required this.fields,
//   });

//   String model;
//   int pk;
//   Fields fields;

//   factory Profile.fromJson(Map<String, dynamic> json) =>
//       Profile(model: 'Profile', pk: 0, fields: Fields.fromJson(json["fields"]));

//   Map<String, dynamic> toJson() => {
//         "model": model,
//         "pk": pk,
//         "fields": fields.toJson(),
//       };
// }
