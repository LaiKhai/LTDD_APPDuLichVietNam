import 'dart:convert';

import 'package:VietNamTravel/screen/home/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../../../constants.dart';
import 'User.dart';

class LoginProvider {
  Future<String> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    if (token == null) return '';
    return token;
  }

  Future<void> signIn(
      BuildContext context, String email, String password) async {
    String url = loginUrl;

    Map body = {'email': email, 'password': password};
    var response = await http.post(Uri.parse(url),
        headers: <String, String>{'Accept': 'application/json'}, body: body);
    if (response.statusCode == 200) {
      final jsonResponse = User.fromJson(json.decode(response.body));
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('token', jsonResponse.token);
      Future<String?> token = LoginProvider().getToken();
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => HomeScreen()),
          (route) => false);
    } else {
      print('response status:${response.body}');
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: Text('Chưa nhập email hoặc mật khẩu',
                  style: GoogleFonts.quicksand(
                      fontWeight: FontWeight.bold, color: Colors.black)),
              title: Row(
                children: [
                  Icon(
                    Icons.warning_rounded,
                    color: kBackgroundColor,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text('Thông báo',
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
                      'OK',
                      style: GoogleFonts.quicksand(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ))
              ],
            );
          });
    }
  }

  Future<void> Logout() async {
    Future<String?> token = LoginProvider().getToken();
    print(token);
    var response =
        await http.post(Uri.parse(logoutUrl), headers: <String, String>{
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    print(response.body);
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('token');
    return jsonDecode(response.body)['message'];
  }
}
