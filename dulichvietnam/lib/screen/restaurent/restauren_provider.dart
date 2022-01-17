import 'dart:convert';

import 'package:VietNamTravel/screen/restaurent/restauren_object.dart';
import 'package:http/http.dart' as http;

class RestaurentProvider {
  static List<RestaurentObject> parseRestaurent(String responseBody) {
    final parse = jsonDecode(responseBody)['data'];
    return parse
        .map<RestaurentObject>((e) => RestaurentObject.fromJson(e))
        .toList();
  }

  static Future<List<RestaurentObject>> fetchPosts() async {
    final response = await http.get(
        Uri.parse('http://192.168.1.5:80/api/quanan'),
        headers: {'Accept': 'application/json'});
    return parseRestaurent(response.body);
  }
}
