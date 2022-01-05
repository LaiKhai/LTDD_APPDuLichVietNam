import 'dart:convert';

import 'package:VietNamTravel/screen/home/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../../../constants.dart';

class LoginProvider {
  signIn(BuildContext context, String email, String password) async {
    String url = 'http://192.168.1.5:80/api/login';

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map body = {'email': email, 'password': password};
    var response = await http.post(Uri.parse(url),
        headers: <String, String>{'Accept': 'application/json'}, body: body);
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      print('response status:${response.statusCode}');
      print('response status:${response.body}');

      sharedPreferences.setString("token", jsonResponse['token']);
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
}
