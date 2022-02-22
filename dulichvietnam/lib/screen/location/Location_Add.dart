import 'dart:io';

import 'package:VietNamTravel/screen/Post/Post_UserProfile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';

import '../../constants.dart';

class Location_Add extends StatefulWidget {
  const Location_Add({Key? key}) : super(key: key);

  @override
  _Location_AddState createState() => _Location_AddState();
}

List<DropdownMenuItem<String>> get dropdownItem {
  List<DropdownMenuItem<String>> menuItem = [
    DropdownMenuItem(child: Text('--Vùng Miền--'), value: '--Vùng Miền--'),
    DropdownMenuItem(child: Text('Tây Bắc Bộ'), value: '1'),
    DropdownMenuItem(child: Text('Đông Bắc Bộ'), value: '2'),
    DropdownMenuItem(child: Text('Đồng Bằng Sông Cửu Long'), value: '3'),
    DropdownMenuItem(child: Text('Bắc Trung Bộ'), value: '4'),
    DropdownMenuItem(child: Text('Duyên Hải Nam Trung Bộ'), value: '5'),
    DropdownMenuItem(child: Text('Tây Nguyên'), value: '6'),
    DropdownMenuItem(child: Text('Đông Nam Bộ'), value: '7'),
    DropdownMenuItem(child: Text('Đồng Bằng Sông Cửu Long'), value: '8')
  ];
  return menuItem;
}

List<File> filesImg = [];
addImg() async {
  FilePickerResult? resultImg =
      await FilePicker.platform.pickFiles(allowMultiple: true);
  resultImg!=null?
    filesImg = resultImg.paths.map((path) => File(path!)).toList():null;
  
}

class _Location_AddState extends State<Location_Add> {
  @override
  Widget build(BuildContext context) {
    String? selectValue = '--Vùng Miền--';
    return Scaffold(
      appBar: AppBar(
          backgroundColor: kBackgroundColor,
          title: Container(
            margin: EdgeInsets.fromLTRB(60, 0, 10, 0),
            child: Text("Thêm Địa Danh",
                style: GoogleFonts.quicksand(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                )),
          )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(10, 20, 10, 10),
              child: ListTile(
                leading: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.asset(
                      'assets/images/avatar_test.jpg',
                      fit: BoxFit.cover,
                      width: 40,
                      height: 40,
                    )),
                title: Text('Lai Khải',
                    style: GoogleFonts.quicksand(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
              ),
            ),
            Form(
                child: Padding(
                    padding: EdgeInsets.all(20),
                    child: TextFormField(
                      keyboardType: TextInputType.multiline,
                      maxLines: 9,
                      validator: (val) =>
                          val!.isEmpty ? 'Không được để trống' : null,
                      decoration: InputDecoration(
                        hintText: "Mô tả",
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: Colors.black),
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    ))),
            Container(
                width: 400,
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                child: DropdownButtonFormField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 1),
                        borderRadius: BorderRadius.circular(30)),
                  ),
                  dropdownColor: Colors.white,
                  value: selectValue,
                  items: dropdownItem,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectValue = newValue!;
                    });
                  },
                )),
            Container(
                padding: EdgeInsets.fromLTRB(10, 20, 310, 10),
                child: Text(
                  'Vị Trí',
                  style: GoogleFonts.quicksand(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                )),
            Container(
                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: TextFormField(
                  decoration: InputDecoration(
                      hintText: "Kinh Độ",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30))),
                )),
            Container(
                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: TextFormField(
                  decoration: InputDecoration(
                      hintText: "Vĩ Độ",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30))),
                )),
            Container(
                padding: EdgeInsets.fromLTRB(10, 20, 250, 10),
                child: Text(
                  'Thêm Ảnh',
                  style: GoogleFonts.quicksand(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                )),
            Container(
                margin: EdgeInsets.fromLTRB(10, 5, 200, 20),
                padding: EdgeInsets.fromLTRB(10, 10, 50, 0),
                width: 200,
                height: 200,
                child: ElevatedButton(
                  child: Icon(Icons.add),
                  style: ElevatedButton.styleFrom(
                      primary: kBackgroundColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0))),
                  onPressed: () {},
                )),
          ],
        ),
      ),
    );
  }
}

DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
      value: item,
      child: Text(
        item,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      ),
    );
