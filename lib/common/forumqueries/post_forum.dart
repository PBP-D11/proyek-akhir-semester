import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:flutter/material.dart';

Future<void> postForum(
    CookieRequest request, String title, String body, String topic) async {
  String user = request.jsonData['username'];
  int id = 4;
  if (topic == "Cars") {
    id = 1;
  } else if (topic == "Charging Station") {
    id = 2;
  } else if (topic == "Formula-e") {
    id = 3;
  } else {
    id = 4;
  }

  final response = await request
      .post('https://ev-ryday.up.railway.app/evorums/forum/${id}/post/add', {
    'body': body,
    'title': title,
    'user': user,
  });
}
