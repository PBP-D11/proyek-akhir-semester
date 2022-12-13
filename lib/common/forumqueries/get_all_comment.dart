import 'package:evryday/common/forumqueries/Comment.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<Comment>> get_all_comment(int post_id) async {
  print(post_id);
  var url = Uri.parse(
      'https://ev-ryday.up.railway.app/evorums/forum/comment/${post_id}');
  var response = await http.get(
    url,
    headers: {
      "Access-Control-Allow-Origin": "*",
      "Content-Type": "application/json",
    },
  );

  // melakukan decode response menjadi bentuk json
  var data = jsonDecode(utf8.decode(response.bodyBytes));

  // melakukan konversi data json menjadi object Comment
  List<Comment> forums = [];
  for (var d in data) {
    if (d != null) {
      forums.add(Comment.fromJson(d));
    }
  }

  return forums;
}
