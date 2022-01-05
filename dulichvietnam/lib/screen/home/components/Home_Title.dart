import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home_Title extends StatelessWidget {
  final String title;
  final EdgeInsets size;
  const Home_Title({Key? key, required this.title, required this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: size,
      child: TextButton(
          onPressed: () {},
          child: Text(title,
              style: GoogleFonts.quicksand(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black))),
    );
  }
}
