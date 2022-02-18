import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants.dart';

class demandcard extends StatelessWidget {
  final String title;
  const demandcard({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.fromLTRB(15, 10, 5, 20),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        color: kBackgroundColor,
        child: Container(
          margin: EdgeInsets.all(10),
          child: Text(
            title,
            style: GoogleFonts.quicksand(
                fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ));
  }
}
