import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class User_ProfileChild extends StatelessWidget {
  const User_ProfileChild({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(15, 0, 0, 0),
      child: Column(
        children: [
          ListTile(
            title: Text(
              'tên tài khoản',
              style: GoogleFonts.quicksand(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey),
            ),
            subtitle: Text(
              'Lai Khải',
              style: GoogleFonts.quicksand(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(15, 0, 30, 10),
            child: Divider(
              color: Colors.black,
            ),
          ),
          ListTile(
            title: Text(
              'Email',
              style: GoogleFonts.quicksand(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey),
            ),
            subtitle: Text(
              '0306191036@caothang.edu.vn',
              style: GoogleFonts.quicksand(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(15, 0, 30, 10),
            child: Divider(
              color: Colors.black,
            ),
          ),
          ListTile(
            title: Text(
              'Số điện thoại',
              style: GoogleFonts.quicksand(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey),
            ),
            subtitle: Text(
              '0703756499',
              style: GoogleFonts.quicksand(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(15, 0, 30, 10),
            child: Divider(
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
