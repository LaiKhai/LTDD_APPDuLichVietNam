import 'dart:convert';

import 'package:VietNamTravel/constants.dart';
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
    final response = await http
        .get(Uri.parse(restaurantUrl), headers: {'Accept': 'application/json'});
    return parseRestaurent(response.body);
  }

  static Future<List<RestaurentObject>> getAllRestaurent() async {
    var token = await getToken();
    final response = await http.get(Uri.parse(restaurantUrl), headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    return parseRestaurent(response.body);
  }

  //Tìm kiếm quán ăn
  static Future<List<RestaurentObject>> searchRes(String searchString) async {
    List<RestaurentObject> lstResult = [];
    List<dynamic> data = await getAllRestaurent();

    if (searchString == '') return lstResult = [];

    for (var e in data) {
      RestaurentObject co = RestaurentObject.fromJson(e);
      if (co.ten.toUpperCase().contains(searchString.toUpperCase())) {
        lstResult.add(co);
      }
    }
    return lstResult;
  }
}
