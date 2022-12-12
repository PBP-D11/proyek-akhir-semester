import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:flutter/material.dart';

Future<void> postComment(
    CookieRequest request, int topic_id, String comment) async {
  final response = await request.post(
      'https://ev-ryday.up.railway.app/evorums/forum/${topic_id}/post/add', {
    'comment': comment,
  });
}
