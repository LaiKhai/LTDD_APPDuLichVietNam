import 'dart:io';

import 'package:VietNamTravel/screen/Post/Post_UserProfile.dart';
import 'package:VietNamTravel/screen/location/LocationProvider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
  resultImg != null
      ? filesImg = resultImg.paths.map((path) => File(path!)).toList()
      : null;
}

final TextEditingController txt_tendiadanh = TextEditingController();
final TextEditingController txt_mota = TextEditingController();

String? selectValue = '--Vùng Miền--';

class _Location_AddState extends State<Location_Add> {
  postLocation() async {
    LocationProvider.addLocation(
        context, txt_tendiadanh.text, txt_mota.text, selectValue!, filesImg);
  }

  @override
  Widget build(BuildContext context) {
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
            Container(
                padding: EdgeInsets.fromLTRB(10, 20, 210, 10),
                child: Text(
                  'Tên Địa Danh',
                  style: GoogleFonts.quicksand(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                )),
            Container(
              margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
              child: TextField(
                controller: txt_tendiadanh,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)),
                    hintText: 'Tên địa danh'),
              ),
            ),
            Container(
                padding: EdgeInsets.fromLTRB(10, 20, 120, 10),
                child: Text(
                  'Thông Tin Địa Danh',
                  style: GoogleFonts.quicksand(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                )),
            Form(
                child: Padding(
                    padding: EdgeInsets.all(20),
                    child: TextFormField(
                      controller: txt_mota,
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
                padding: EdgeInsets.fromLTRB(10, 20, 250, 10),
                child: Text(
                  'Thêm Ảnh',
                  style: GoogleFonts.quicksand(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                )),
            filesImg.length == 0
                ? Container(
                    margin: EdgeInsets.fromLTRB(10, 5, 10, 20),
                    width: 500,
                    height: 300,
                    child: SvgPicture.asset('assets/images/Noimage.svg'))
                : Container(
                    height: 300,
                    width: 500,
                    child: PageView.builder(
                      controller:
                          PageController(viewportFraction: 0.8, initialPage: 0),
                      itemCount: filesImg.length, //đếm ảnh
                      itemBuilder: (context, index) => InkWell(
                        onTap: () {},
                        child: Container(
                          height: 200,
                          width: 200,
                          margin: EdgeInsets.only(right: 14),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: FileImage(filesImg[index]),
                                  fit: BoxFit.scaleDown)),
                        ),
                      ),
                    ),
                  ),
            Container(
                margin: EdgeInsets.fromLTRB(10, 20, 10, 0),
                width: 500,
                height: 50,
                child: ElevatedButton(
                  child: Text(
                    'Thêm Ảnh',
                    style: GoogleFonts.quicksand(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: kBackgroundColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0))),
                  onPressed: () {
                    addImg();
                  },
                )),
            Container(
                margin: EdgeInsets.fromLTRB(10, 5, 10, 20),
                width: 500,
                height: 50,
                child: ElevatedButton(
                  child: Text(
                    'Đăng Bài',
                    style: GoogleFonts.quicksand(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: kBackgroundColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0))),
                  onPressed: () {
                    postLocation();
                  },
                ))
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
