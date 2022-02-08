import 'package:VietNamTravel/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:async';

class FoodInput extends StatefulWidget {
  const FoodInput({Key? key}) : super(key: key);

  @override
  _FoodInputState createState() => _FoodInputState();
}

class _FoodInputState extends State<FoodInput> {
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
          child: TextField(
            keyboardType: TextInputType.name,
            decoration: InputDecoration(
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: kBackgroundColor),
              ),
              labelText: 'Tên món ăn',
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
              labelText: 'Mô tả',
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
          width: 350        ,
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
      ],
    );
  }
}
