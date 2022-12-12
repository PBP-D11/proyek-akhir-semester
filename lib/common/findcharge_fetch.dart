import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:evryday/models/findcharge.dart';

Future<List<Findcharge>> fetchFindCharge() async {
  var url = Uri.parse("https://ev-ryday.up.railway.app/find-charge/json/");
  var response = await http.get(
    url,
    headers: {
      "Access-Control-Allow-Origin": "*",
      "Content-Type": "application/json",
    },
  );

  var data = jsonDecode(utf8.decode(response.bodyBytes));

  List<Findcharge> listFindcharge = [];
  for (var d in data) {
    if (d != null) {
      listFindcharge.add(Findcharge.fromJson(d));
    }
  }
  return listFindcharge;
}
