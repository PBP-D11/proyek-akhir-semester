import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:flutter/material.dart';

Future<void> postForum(CookieRequest request, String title, String category,
    String content) async {
  final response =
      await request.post('https://start-in.up.railway.app/inforum/add/', {
    'content': content,
    'title': title,
    'category': category,
  });
}
