import 'dart:convert';

import 'package:VietNamTravel/constants.dart';
import 'package:VietNamTravel/screen/food/MealObject.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FoodProvider {
  static List<MealObject> parsePost(String responseBody) {
    final parse = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    return parse.map<MealObject>((e) => MealObject.fromJson(e)).toList();
  }

  static Future<List<MealObject>> fetchMeal(BuildContext context) async {
    final response = await http
        .get(Uri.parse(foodUrl), headers: {'Accept': 'application/json'});
    if (response.statusCode != 200) {
      final error = jsonDecode(response.body)['message'];
      final snackBar = SnackBar(
        content: Text('$error'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
    return parsePost(response.body);
  }
}
