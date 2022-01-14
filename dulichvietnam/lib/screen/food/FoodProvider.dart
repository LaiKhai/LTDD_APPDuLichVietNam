import 'dart:convert';

import 'package:VietNamTravel/screen/food/MealObject.dart';
import 'package:http/http.dart' as http;

class FoodProvider {
  static List<MealObject> parsePost(String responseBody) {
    final parse = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    return parse.map<MealObject>((e) => MealObject.fromJson(e)).toList();
  }

  static Future<List<MealObject>> fetchMeal() async {
    final response = await http.get(
        Uri.parse('http://192.168.1.2:80/api/monan'),
        headers: {'Accept': 'application/json'});
    return parsePost(response.body);
  }
}
