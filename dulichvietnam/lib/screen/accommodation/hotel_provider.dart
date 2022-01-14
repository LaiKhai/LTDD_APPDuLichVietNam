import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:VietNamTravel/screen/accommodation/hotel_object.dart';
import 'package:path/path.dart';
import 'package:http/http.dart' as http;

class LuuTruProvider {
  static List<LuuTru> parseHotels(String reponseBody) {
    final parsed = jsonDecode(reponseBody).cast<Map<String, dynamic>>();
    return parsed.map<LuuTru>((e) => LuuTru.fromJson(e)).toList();
  }

  static Future<List<LuuTru>> fetchPosts() async {
    final response =
        await http.get(Uri.parse('http://192.168.1.5:80/api/luutru'));
    return parseHotels(response.body);
  }
}
