import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Home_Emoji.dart';
import 'Home_gps.dart';

class CardSection_Carousel extends StatelessWidget {
  final String img;
  const CardSection_Carousel({Key? key, required this.img}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        child: Column(
          children: [
            Stack(
              children: [
                //Ảnh nền của slideshow địa điểm nổi bật
                ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                    child: Image.network(
                      img,
                      fit: BoxFit.cover,
                      width: 350,
                      height: 168,
                      color: Colors.black.withOpacity(0.5),
                      colorBlendMode: BlendMode.darken,
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 110),
                      child: Row(
                        children: [
                          Icon(
                            Icons.map,
                            color: Colors.white,
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(10, 10, 20, 0),
                            width: 250,
                            child: Text(
                              '7b Hoàng Hoa Thám, Phường 10, Thành phố Đà Lạt, Lâm Đồng, Việt Nam',
                              softWrap: true,
                              style: GoogleFonts.quicksand(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
            Container(
              padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
              child: Row(
                children: [
                  emoji(icon: Icons.favorite_rounded, color: Colors.red),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: emoji(
                      icon: Icons.remove_red_eye_rounded,
                      color: Colors.black,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: GpsLocation(
                      icon: Icons.location_on,
                      size: EdgeInsets.fromLTRB(10, 10, 0, 0),
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
