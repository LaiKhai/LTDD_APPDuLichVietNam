import 'dart:convert';
import 'package:VietNamTravel/screen/accommodation/hotel_object.dart';
import 'package:http/http.dart' as http;

class LuuTruProvider {
  static List<LuuTru> parseHotels(String reponseBody) {
    final parsed = jsonDecode(reponseBody)['data'];
    print(parsed);
    return parsed.map<LuuTru>((e) => LuuTru.fromJson(e)).toList();
  }

  static Future<List<LuuTru>> fetchPosts() async {
    final response =
        await http.get(Uri.parse('http://192.168.1.2:80/api/luutru'));
    print(response.body);
    return parseHotels(response.body);
  }
}
