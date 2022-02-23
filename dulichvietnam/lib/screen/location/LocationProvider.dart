import 'dart:convert';
import 'dart:io';
import 'package:VietNamTravel/constants.dart';
import 'package:VietNamTravel/screen/location/LocationObject.dart';
import 'package:VietNamTravel/screen/restaurent/restauren_object.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LocationProvider {
  static List<LocationObject> parseLocation(String responseBody) {
    final parse = jsonDecode(responseBody)['data'].cast<Map<String, dynamic>>();
    return parse
        .map<LocationObject>((e) => LocationObject.fromJson(e))
        .toList();
  }

  static Future<List<LocationObject>> fetchLocation(
      BuildContext context) async {
    String? token = await getToken();
    final response = await http.get(Uri.parse(locationlUrl), headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${token!}'
    });
    if (response.statusCode != 200) {
      final error = jsonDecode(response.body)['message'];
      final snackBar = SnackBar(
        content: Text('$error'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
    return parseLocation(response.body);
  }

  static Future<LocationObject> fetchLocationDetail(int id) async {
    String? token = await getToken();
    final response = await http.get(Uri.parse(locationlUrl + '/$id'), headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${token!}'
    });
    return LocationObject.fromJson(jsonDecode(response.body));
  }
}
