// To parse this JSON data, do
//
//     final WatchList = WatchListFromJson(jsonString);

// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

List<Services> servicesFromJson(String str) =>
    List<Services>.from(json.decode(str).map((x) => Services.fromJson(x)));

String servicesToJson(List<Services> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Services {
	Services ({
		required this.name, 
		required this.phone, 
		required this.address, 
		required this.city, 
		required this.photo, 
		required this.time_open, 
		required this.time_close, 
		required this.link_gmap,
	});

	String name, phone, address, city, photo, time_open, time_close, link_gmap;

	factory Services.fromJson(Map<String, dynamic> json) => Services(
        name: json["fields"]["name"],
        phone: json["fields"]["phone"],
		address: json["fields"]["address"],
		city: json["fields"]["city"],
		photo: json["fields"]["photo"],
		time_open: json["fields"]["time_open"],
		time_close: json["fields"]["time_close"],
		link_gmap: json["fields"]["link_gmap"],
    );

  	Map<String, dynamic> toJson() => {
        "name": name,
		"phone": phone,
		"address": address,
		"city": city,
		"photo": photo,
		"time_open": time_open,
		"time_close": time_close,
		"link_gmap": link_gmap,
    };
}