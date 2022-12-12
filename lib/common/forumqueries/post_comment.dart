import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:flutter/material.dart';

Future<void> postComment(
    CookieRequest request, int forum_id, String comment) async {
  final response = await request.post(
      'https://start-in.up.railway.app/inforum/forum/${forum_id}/comment/add', {
    'comment': comment,
  });
}
