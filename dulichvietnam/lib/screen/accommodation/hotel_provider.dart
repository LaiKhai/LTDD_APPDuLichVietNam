// ignore_for_file: unused_local_variable

import 'dart:convert';
import 'package:VietNamTravel/constants.dart';
import 'package:VietNamTravel/screen/accommodation/hotel_object.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LuuTruProvider {
  static List<LuuTru> parseHotels(String responseBody) {
    final parse = jsonDecode(responseBody)['data'];
    return parse.map<LuuTru>((e) => LuuTru.fromJson(e)).toList();
  }

  static Future<List<LuuTru>> fetchPosts() async {
    final response = await http
        .get(Uri.parse(hotelUrl), headers: {'Accept': 'application/json'});
    return parseHotels(response.body);
  }

  static Future<List<LuuTru>> getAllHotel() async {
    var token = await getToken();
    final response = await http.get(Uri.parse(hotelUrl), headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    return parseHotels(response.body);
  }

  //Tìm kiếm lưu trú
  static Future<List<LuuTru>> searchHotels(String searchString) async {
    List<LuuTru> lstResult = [];
    List<dynamic> data = await getAllHotel();

    if (searchString == '') return lstResult = [];

    for (var e in data) {
      LuuTru co = LuuTru.fromJson(e);
      if (co.ten.toUpperCase().contains(searchString.toUpperCase())) {
        lstResult.add(co);
      }
    }
    return lstResult;
  }
}
