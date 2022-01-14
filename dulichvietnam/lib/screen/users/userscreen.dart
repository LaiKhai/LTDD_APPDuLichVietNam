import 'package:VietNamTravel/constants.dart';
import 'package:VietNamTravel/screen/users/inputUser.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              'Chỉnh sửa thông tin cá nhân',
              style: GoogleFonts.quicksand(
                fontWeight: FontWeight.w600,
                color: Colors.white,
                fontSize: 17,
              ),
            ),
          ),
          backgroundColor: kBackgroundColor,
          elevation: 0,
        ),
        body: Container(
          decoration: BoxDecoration(color: Colors.white),
          child: Column(
            children: [
              Expanded(
                child: Container(
                    width: 500,
                    height: 250,
                    decoration: BoxDecoration(
                      color: kBackgroundColor,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(59),
                        bottomRight: Radius.circular(59),
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.network(
                        'https://pdp.edu.vn/wp-content/uploads/2021/01/hinh-anh-cute-de-thuong.jpg',
                        height: 150.0,
                        width: 100.0,
                      ),
                    )),
                flex: 1,
              ),
              Expanded(
                child: Container(child: InputUsers()),
                flex: 4,
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 10, bottom: 20, right: 10),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'Đổi mật khẩu',
                      style: GoogleFonts.quicksand(
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          fontSize: 18),
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(27)),
                      primary: kBackgroundColor,
                      padding:
                          EdgeInsets.symmetric(horizontal: 110, vertical: 15),
                    ),
                  ),
                ),
                flex: 1,
              ),
            ],
          ),
        ));
  }
}
