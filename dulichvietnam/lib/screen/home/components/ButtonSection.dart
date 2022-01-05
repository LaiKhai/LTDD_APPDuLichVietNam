import 'package:VietNamTravel/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonSection extends StatelessWidget {
  const ButtonSection(
      {Key? key,
      required this.title,
      required this.icon,
      required this.navigator})
      : super(key: key);
  final Widget navigator;
  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (ctx) => navigator));
      },
      child: Column(
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 50,
          ),
          Text(
            title,
            softWrap: true,
            style: GoogleFonts.quicksand(
                fontWeight: FontWeight.bold, color: Colors.white),
          )
        ],
      ),
      style: ElevatedButton.styleFrom(
          primary: kBackgroundColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 50)),
    );
  }
}
