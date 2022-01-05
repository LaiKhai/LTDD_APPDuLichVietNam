import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home_ListLocationChild extends StatelessWidget {
  const Home_ListLocationChild({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.all(10),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                'https://image.freepik.com/free-photo/high-angle-shot-beautiful-forest-with-lot-green-trees-enveloped-fog-new-zealand_181624-19717.jpg',
                fit: BoxFit.cover,
                width: 180,
                height: 160,
              )),
        ),
        Positioned(
            top: 135,
            left: 20,
            child: Row(
              children: [
                Icon(
                  Icons.location_on,
                  color: Colors.white,
                  size: 25,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 5),
                  child: Text(
                    'Đà lạt',
                    style: GoogleFonts.quicksand(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                )
              ],
            )),
        Positioned(
            top: 135,
            left: 118,
            child: Row(
              children: [
                Icon(
                  Icons.library_books_rounded,
                  color: Colors.white,
                  size: 25,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 5),
                  child: Text(
                    '20k',
                    style: GoogleFonts.quicksand(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                )
              ],
            ))
      ],
    );
  }
}
