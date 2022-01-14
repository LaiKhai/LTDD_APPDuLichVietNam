import 'package:VietNamTravel/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Alert extends StatelessWidget {
  final String title;
  const Alert({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Text(title,
          style: GoogleFonts.quicksand(
              fontWeight: FontWeight.bold, color: Colors.black)),
      title: Row(
        children: [
          Icon(
            Icons.warning_rounded,
            color: kBackgroundColor,
          ),
          SizedBox(
            width: 10,
          ),
          Text('Thông báo',
              style: GoogleFonts.quicksand(
                fontWeight: FontWeight.bold,
                color: kBackgroundColor,
              ))
        ],
      ),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              'OK',
              style: GoogleFonts.quicksand(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ))
      ],
    );
  }
}
