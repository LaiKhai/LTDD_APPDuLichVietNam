import 'dart:convert';
import 'dart:io';
import 'package:VietNamTravel/constants.dart';
import 'package:VietNamTravel/screen/location/LocationObject.dart';
import 'package:VietNamTravel/screen/location/Location_HomeScreen.dart';
import 'package:VietNamTravel/screen/restaurent/restauren_object.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';

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
    return LocationObject.fromJson(jsonDecode(response.body)['data'][0]);
  }

  static Future<void> addLocation(BuildContext context, String tendiadanh,
      String mota, String vung_miens_id, List<File> lstImg) async {
    String? token = await getToken();
    var lst = [];
    Dio dio = new Dio();
    for (var item in lstImg) {
      print(lstImg.length);
      print(item.path);
      item.existsSync();
      lst.add(await MultipartFile.fromFileSync(item.path));
    }
    print(lst);
    FormData formData = new FormData.fromMap({
      'hinhanhs[]': await lst,
      'tendiadanh': tendiadanh,
      'mota': mota,
      'vung_miens_id': vung_miens_id,
      'trangthai': 2
    });
    final response = await Dio().post(locationlUrl,
        data: formData,
        options: new Options(
          followRedirects: false,
          validateStatus: (status) => true,
          headers: <String, String>{
            'Accept': 'application/json',
            'Authorization': 'Bearer ${token!}'
          },
        ));
    if (response.statusCode == 200) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: Text('Đăng bài thành công',
                  style: GoogleFonts.quicksand(
                      fontWeight: FontWeight.bold, color: Colors.black)),
              title: Row(
                children: [
                  Icon(
                    Icons.check_circle,
                    color: kBackgroundColor,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text('Thành Công',
                      style: GoogleFonts.quicksand(
                        fontWeight: FontWeight.bold,
                        color: kBackgroundColor,
                      ))
                ],
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Location_HomeScreen()),
                          (route) => false);
                    },
                    child: Text(
                      'Ok',
                      style: GoogleFonts.quicksand(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    )),
              ],
            );
          });
    } else {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: Text('Đăng bài thất bại',
                  style: GoogleFonts.quicksand(
                      fontWeight: FontWeight.bold, color: Colors.black)),
              title: Row(
                children: [
                  Icon(
                    Icons.check_circle,
                    color: kBackgroundColor,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text('Thất Bại',
                      style: GoogleFonts.quicksand(
                        fontWeight: FontWeight.bold,
                        color: kBackgroundColor,
                      ))
                ],
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Đóng',
                      style: GoogleFonts.quicksand(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    )),
              ],
            );
          });
    }
  }
}
