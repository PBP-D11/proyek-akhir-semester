// To parse this JSON data, do
//
//     final findcharge = findchargeFromJson(jsonString);

import 'dart:convert';

List<Findcharge> findchargeFromJson(String str) => List<Findcharge>.from(json.decode(str).map((x) => Findcharge.fromJson(x)));

String findchargeToJson(List<Findcharge> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Findcharge {
    Findcharge({
        required this.model,
        required this.pk,
        required this.fields,
    });

    String model;
    int pk;
    Fields fields;

    factory Findcharge.fromJson(Map<String, dynamic> json) => Findcharge(
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
        required this.namaStation,
        required this.kota,
        required this.alamat,
        required this.timeOpen,
        required this.timeClose,
        required this.linkGmap,
    });

    String namaStation;
    String kota;
    String alamat;
    String timeOpen;
    String timeClose;
    String linkGmap;

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        namaStation: json["nama_station"],
        kota: json["kota"],
        alamat: json["alamat"],
        timeOpen: json["time_open"],
        timeClose: json["time_close"],
        linkGmap: json["link_gmap"],
    );

    Map<String, dynamic> toJson() => {
        "nama_station": namaStation,
        "kota": kota,
        "alamat": alamat,
        "time_open": timeOpen,
        "time_close": timeClose,
        "link_gmap": linkGmap,
    };
}
