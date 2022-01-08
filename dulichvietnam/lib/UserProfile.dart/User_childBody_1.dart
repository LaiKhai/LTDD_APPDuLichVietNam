import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class User_childbody extends StatelessWidget {
  const User_childbody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.center,
            child: Column(
              children: [
                Container(
                  child: Text(
                    '12',
                    style: GoogleFonts.quicksand(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
                Container(
                  child: Text('bài viết',
                      style: GoogleFonts.quicksand(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey)),
                )
              ],
            ),
          ),
          SizedBox(
            width: 60,
          ),
          Align(
            alignment: Alignment.center,
            child: Column(
              children: [
                Container(
                  child: Text(
                    '20',
                    style: GoogleFonts.quicksand(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
                Container(
                  child: Text('địa điểm đã đi',
                      style: GoogleFonts.quicksand(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey)),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
