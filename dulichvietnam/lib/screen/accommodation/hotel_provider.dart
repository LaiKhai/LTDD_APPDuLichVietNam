import 'dart:convert';
import 'package:VietNamTravel/screen/accommodation/hotel_object.dart';
import 'package:http/http.dart' as http;

class LuuTruProvider {
  static List<LuuTru> parseHotels(String responseBody) {
    final parse = jsonDecode(responseBody)['data'];
    return parse.map<LuuTru>((e) => LuuTru.fromJson(e)).toList();
  }

  static Future<List<LuuTru>> fetchPosts() async {
    final response = await http.get(
        Uri.parse('http://192.168.1.4:80/api/luutru'),
        headers: {'Accept': 'application/json'});
    return parseHotels(response.body);
  }
}
