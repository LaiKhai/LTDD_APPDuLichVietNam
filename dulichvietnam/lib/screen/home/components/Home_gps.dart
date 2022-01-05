import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GpsLocation extends StatelessWidget {
  final IconData icon;
  final EdgeInsets size;
  const GpsLocation({Key? key, required this.icon, required this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: size,
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.pink[600],
            size: 30,
          ),
          Padding(
            padding: EdgeInsets.only(left: 5),
            child: Text(
              'Đà Lạt',
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
