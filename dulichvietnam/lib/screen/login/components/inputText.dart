import 'dart:convert';

import 'package:VietNamTravel/screen/home/homescreen.dart';
import 'package:VietNamTravel/screen/login/components/LoginProvider.dart';
import 'package:VietNamTravel/screen/register/register.dart';
import 'package:flutter/material.dart';
import 'package:VietNamTravel/constants.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class InputText extends StatefulWidget {
  const InputText({Key? key}) : super(key: key);

  @override
  _InputTextState createState() => _InputTextState();
}

class _InputTextState extends State<InputText> {
  final TextEditingController _uscontroller = TextEditingController();
  final TextEditingController _pascontroller = TextEditingController();
  LoginProvider _auth = new LoginProvider();

  @override
  Widget build(BuildContext context) {
    Widget alert = AlertDialog(
      title: Text('Đăng nhập không thành công'),
      content:
          Text('Bạn nhập kiểu đéo gì mà sai mật khẩu hay tài khoản ròi kìa'),
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

    return Container(
        child: Column(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(40, 50, 40, 10),
          child: TextField(
            controller: _uscontroller,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: kBackgroundColor),
              ),
              labelText: 'Email',
              labelStyle: TextStyle(fontSize: 16, color: kTextColor),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(40, 10, 40, 40),
          child: TextField(
            controller: _pascontroller,
            obscureText: true,
            keyboardType: TextInputType.visiblePassword,
            decoration: InputDecoration(
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: kBackgroundColor)),
              labelText: 'Password',
              labelStyle: TextStyle(fontSize: 16, color: kTextColor),
            ),
          ),
        ),
        Expanded(
            child: Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: ElevatedButton(
            onPressed: () {
              if (_uscontroller.text == "" || _pascontroller.text == "") {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        content: Text('Chưa nhập email hoặc mật khẩu',
                            style: GoogleFonts.quicksand(
                                fontWeight: FontWeight.bold,
                                color: Colors.black)),
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
              } else {
                _auth.signIn(context, _uscontroller.text, _pascontroller.text);
              }
            },
            child: Text('Đăng Nhập',
                style: GoogleFonts.quicksand(
                    fontWeight: FontWeight.w600, color: Colors.white)),
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(80)),
              primary: kBackgroundColor,
              padding: EdgeInsets.symmetric(horizontal: 130, vertical: 20),
            ),
          ),
        )),
        Expanded(
            child: Padding(
          padding: EdgeInsets.only(top: 10),
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => RegisterScreen()));
            },
            child: Text('Đăng Ký',
                style: GoogleFonts.quicksand(
                    fontWeight: FontWeight.w600, color: Colors.white)),
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(80)),
              primary: kBackgroundColor,
              padding: EdgeInsets.symmetric(horizontal: 140, vertical: 20),
            ),
          ),
        )),
        Expanded(
            child: Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  'Quên mật khẩu !',
                  style: GoogleFonts.quicksand(
                      fontWeight: FontWeight.w600, color: kBackgroundColor),
                )))
      ],
    ));
  }
}
