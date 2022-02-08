import 'dart:async';
import 'package:VietNamTravel/screen/register/RegisterProvider.dart';
import 'package:flutter/material.dart';
import 'package:VietNamTravel/constants.dart';
import 'package:google_fonts/google_fonts.dart';

import 'alert.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passcontroller = TextEditingController();
  final TextEditingController _namecontroller = TextEditingController();
  final TextEditingController _cfpasscontroller = TextEditingController();
  RegisterProvider _signUp = new RegisterProvider();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.keyboard_arrow_left,
            size: 40,
            color: Colors.black,
          ),
        ),
        title: Center(
          child: Text(
            'ĐĂNG KÝ',
            style: GoogleFonts.quicksand(
                color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            alignment: Alignment.center,
            child: Icon(
              Icons.person,
              size: 50,
              color: Colors.black,
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(40, 20, 40, 0),
            child: TextField(
              controller: _namecontroller,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(27)),
                ),
                labelText: 'Họ tên',
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(40, 20, 40, 0),
            child: TextField(
              controller: _emailcontroller,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(27)),
                ),
                labelText: 'Email',
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(40, 20, 40, 0),
            child: TextFormField(
              controller: _passcontroller,
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(27)),
                ),
                labelText: 'Mật khẩu',
              ),
              obscureText: true,
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(40, 20, 40, 0),
            child: TextFormField(
              controller: _cfpasscontroller,
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(27)),
                ),
                labelText: 'Xác nhận mật khẩu',
              ),
              obscureText: true,
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(40, 40, 30, 50),
            child: ElevatedButton(
              onPressed: () {
                if (_emailcontroller.text == "" ||
                    _namecontroller.text == "" ||
                    _passcontroller.text == "" ||
                    _cfpasscontroller == "") {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return Alert(
                          title: 'Yêu cầu nhập đầy đủ thông tin',
                        );
                      });
                } else if (_passcontroller.text != _cfpasscontroller.text) {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return Alert(
                            title: 'Xác nhận mật khẩu không trùng khớp');
                      });
                } else {
                  _signUp.register(
                      context,
                      _emailcontroller.text,
                      _passcontroller.text,
                      _cfpasscontroller.text,
                      _namecontroller.text);

                  _emailcontroller.clear();
                  _passcontroller.clear();
                  _cfpasscontroller.clear();
                  _namecontroller.clear();
                }
              },
              child: Text('Đăng Ký',
                  style: GoogleFonts.quicksand(
                      fontWeight: FontWeight.w600, color: Colors.white)),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(27)),
                primary: kBackgroundColor,
                padding: EdgeInsets.symmetric(horizontal: 140, vertical: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
