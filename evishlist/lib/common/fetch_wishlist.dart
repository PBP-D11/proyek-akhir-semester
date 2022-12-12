// ignore_for_file: unused_import, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/wishlist_model.dart';


Future<List<Car>> fetchWatchList() async {
  var url = Uri.parse('https://ev-ryday.up.railway.app/evishlist/json/');
  var response = await http.get(
    url,
    headers: {
      "Access-Control-Allow-Origin": "*",
      "Content-Type": "application/json",
    },
  );

  // melakukan decode response menjadi bentuk json
  var data = jsonDecode(utf8.decode(response.bodyBytes));

  // melakukan konversi data json menjadi object WatchList
  List<Car> listCar = [];
  for (var d in data) {
    if (d != null) {
      listCar.add(Car.fromJson(d));
    }
  }

  return listCar;
}
