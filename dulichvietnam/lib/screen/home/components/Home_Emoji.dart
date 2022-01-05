//Số lượng tym và View của bài viết nổi bật

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class emoji extends StatelessWidget {
  final IconData icon;
  final Color color;
  const emoji({Key? key, required this.icon, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
      child: Row(
        children: [
          Icon(
            icon,
            color: color,
            size: 30,
          ),
          Padding(
            padding: EdgeInsets.only(left: 5),
            child: Text(
              '20k',
              style: GoogleFonts.quicksand(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          )
        ],
      ),
    );
  }
}
