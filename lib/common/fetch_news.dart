// ignore_for_file: unused_import, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:evryday/models/news_model.dart';


Future<List<News>> fetchWatchList() async {
  var url = Uri.parse(
      'https://ev-ryday3.up.railway.app/news/json/');
  var response = await http.get(
    url,
    headers: {
      "Access-Control-Allow-Origin": "*",
      "Content-Type": "application/json",
    },
  );

  // Melakukan decode response menjadi bentuk json
  var data = jsonDecode(utf8.decode(response.bodyBytes));

  // Melakukan konversi data json menjadi object WatchList
  List<News> listNews = [];
  for (var d in data) {
    if (d != null) {
      listNews.add(News.fromJson(d));
    }
  }

  return listNews;
}