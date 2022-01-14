import 'package:VietNamTravel/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:async';

class RetaurentIntput extends StatefulWidget {
  const RetaurentIntput({Key? key}) : super(key: key);

  @override
  _RetaurentIntputState createState() => _RetaurentIntputState();
}

class _RetaurentIntputState extends State<RetaurentIntput> {
  final picker = ImagePicker();
  File? _image;

  Future getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
          child: TextField(
            keyboardType: TextInputType.name,
            decoration: InputDecoration(
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: kBackgroundColor),
              ),
              labelText: 'Tên quán ăn',
              labelStyle: TextStyle(fontSize: 18, color: kTextColor),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(40, 10, 40, 0),
          child: TextField(
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: kBackgroundColor),
              ),
              labelText: 'Địa chỉ',
              labelStyle: TextStyle(fontSize: 18, color: kTextColor),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(40, 10, 40, 0),
          child: TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: kBackgroundColor),
              ),
              labelText: 'Số điện thoại',
              labelStyle: TextStyle(fontSize: 18, color: kTextColor),
            ),
          ),
        ),
        Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.only(left: 30, top: 20),
            child: Column(
              children: [
                Text('Hình ảnh',
                    style: TextStyle(fontSize: 18, color: kTextColor)),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    getImage();
                  },
                  child: Text('+',
                      style: GoogleFonts.quicksand(
                          fontWeight: FontWeight.w600, color: kTextColor)),
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(27)),
                      primary: Colors.white,
                      padding:
                          EdgeInsets.symmetric(horizontal: 50, vertical: 80)),
                ),
              ],
            )),
      ],
    );
  }
}
