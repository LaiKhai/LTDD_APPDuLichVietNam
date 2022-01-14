import 'package:VietNamTravel/constants.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:VietNamTravel/screen/login/components/inputText.dart';
import 'package:google_fonts/google_fonts.dart';

class InputUsers extends StatefulWidget {
  const InputUsers({Key? key}) : super(key: key);

  @override
  _InputUsersState createState() => _InputUsersState();
}

class _InputUsersState extends State<InputUsers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  'Thông tin cá nhân',
                  style: GoogleFonts.quicksand(
                      fontWeight: FontWeight.bold, fontSize: 22),
                )),
            Padding(
              padding: EdgeInsets.fromLTRB(40, 10, 40, 0),
              child: Stack(
                alignment: AlignmentDirectional.centerEnd,
                children: [
                  TextField(
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: kBackgroundColor),
                      ),
                      labelText: 'Tên tài khoản',
                      labelStyle: TextStyle(fontSize: 18, color: kTextColor),
                    ),
                  ),
                  IconButton(onPressed: () {}, icon: Icon(Icons.lock)),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(40, 10, 40, 0),
              child: Stack(
                alignment: AlignmentDirectional.centerEnd,
                children: [
                  TextField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: kBackgroundColor),
                      ),
                      labelText: 'Email',
                      labelStyle: TextStyle(fontSize: 18, color: kTextColor),
                    ),
                  ),
                  IconButton(onPressed: () {}, icon: Icon(Icons.lock)),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(40, 10, 40, 0),
              child: Stack(
                alignment: AlignmentDirectional.centerEnd,
                children: [
                  TextField(
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: kBackgroundColor),
                      ),
                      labelText: 'Số điện thoại',
                      labelStyle: TextStyle(fontSize: 18, color: kTextColor),
                    ),
                  ),
                  IconButton(onPressed: () {}, icon: Icon(Icons.lock)),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'Lưu thay đổi',
                        style: GoogleFonts.quicksand(
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            fontSize: 18),
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(27),
                        ),
                        primary: kBackgroundColor,
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        '      Hủy      ',
                        style: GoogleFonts.quicksand(
                            fontWeight: FontWeight.w600,
                            color: kTextColor,
                            fontSize: 18),
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(27),
                        ),
                        primary: Colors.white,
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
