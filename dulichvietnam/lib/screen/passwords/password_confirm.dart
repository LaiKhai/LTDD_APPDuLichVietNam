import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:VietNamTravel/constants.dart';

class PasswordConfirm extends StatefulWidget {
  const PasswordConfirm({Key? key}) : super(key: key);

  @override
  _PasswordConfirmState createState() => _PasswordConfirmState();
}

class _PasswordConfirmState extends State<PasswordConfirm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Nhập mã xác nhận',
            style: GoogleFonts.quicksand(
              fontWeight: FontWeight.w600,
              color: Colors.black,
              fontSize: 17,
            ),
          ),
        ),
        backgroundColor: kBackgroundColor,
        elevation: 0,
      ),
      body: Container(
          child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 20),
            alignment: Alignment.bottomCenter,
            child: Text(
              'Hệ thống gửi xác nhận\n   vào email của bạn',
              style: GoogleFonts.quicksand(
                fontWeight: FontWeight.w300,
                color: Colors.black,
                fontSize: 17,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(40),
            child: TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(27)),
                ),
                labelText: 'Nhập mã xác nhận',
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(40),
            child: ElevatedButton(
              onPressed: () {},
              child: Text('Xác nhận',
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
      )),
    );
  }
}
