import 'package:VietNamTravel/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:async';

class HotelInput extends StatefulWidget {
  const HotelInput({Key? key}) : super(key: key);

  @override
  _HotelInputState createState() => _HotelInputState();
}

class _HotelInputState extends State<HotelInput> {
  final TextEditingController _txtTen = TextEditingController();
  final TextEditingController _txtDChi = TextEditingController();
  final TextEditingController _txtSDT = TextEditingController();
  List<File> files = [];

  final _picker = ImagePicker();
  File? _imageFile;

  Future getImage() async {
    final pickedFile = await _picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
          child: TextFormField(
            controller: _txtTen,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Không được bỏ trống';
              }
            },
            keyboardType: TextInputType.name,
            decoration: InputDecoration(
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: kBackgroundColor),
              ),
              labelText: 'Tên nơi lưu trú',
              labelStyle: TextStyle(fontSize: 18, color: kTextColor),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(40, 10, 40, 0),
          child: TextFormField(
            controller: _txtDChi,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Không được bỏ trống';
              }
            },
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
          child: TextFormField(
            controller: _txtSDT,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Không được bỏ trống';
              }
            },
            keyboardType: TextInputType.phone,
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
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.fromLTRB(40, 20, 0, 20),
          child: Text('Hình ảnh',
              style: TextStyle(fontSize: 18, color: kTextColor)),
        ),
        Container(
          padding: EdgeInsets.all(40),
          width: 350,
          height: 300,
          decoration: BoxDecoration(
              image: _imageFile == null
                  ? null
                  : DecorationImage(
                      image: FileImage(_imageFile ?? File('')),
                      fit: BoxFit.cover)),
          child: Center(
            child: IconButton(
              icon: Icon(
                Icons.image,
                size: 40,
                color: Colors.black54,
              ),
              onPressed: () {
                getImage();
              },
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.all(50),
          child: RaisedButton(
            onPressed: () {
              setState(() {});
            },
            shape: StadiumBorder(),
            color: kBackgroundColor,
            textColor: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Text(
              "Đăng Bài",
              style: TextStyle(fontSize: 18),
            ),
          ),
        ),
      ],
    );
  }
}
