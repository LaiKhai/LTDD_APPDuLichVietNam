import 'package:VietNamTravel/constants.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:google_fonts/google_fonts.dart';

class PassWords extends StatefulWidget {
  const PassWords({Key? key}) : super(key: key);

  @override
  _PassWordsState createState() => _PassWordsState();
}

class _PassWordsState extends State<PassWords> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Đổi mật khẩu',
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
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(40),
              child: TextField(
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(27)),
                  ),
                  labelText: 'Nhập mật khẩu mới',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 40, right: 40),
              child: TextField(
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(27)),
                  ),
                  labelText: 'Xác nhận mật khẩu mới',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(40),
              child: ElevatedButton(
                onPressed: () {},
                child: Text('Tiếp Theo',
                    style: GoogleFonts.quicksand(
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        fontSize: 18)),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(27)),
                  primary: kBackgroundColor,
                  padding: EdgeInsets.symmetric(horizontal: 130, vertical: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
