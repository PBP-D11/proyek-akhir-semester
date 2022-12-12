import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:flutter/material.dart';

Future<void> postComment(
    CookieRequest request, int post_id, String comment) async {
  final response = await request.post(
      'https://ev-ryday.up.railway.app/evorums/forum/${post_id}/comment/add', {
    'comment': comment,
  });
}
