import 'package:VietNamTravel/screen/posts/dropdown/narbar_post.dart';

import 'package:VietNamTravel/screen/posts/retaurent_intput.dart';
import 'package:flutter/material.dart';
import 'package:VietNamTravel/constants.dart';
import 'package:google_fonts/google_fonts.dart';

class RestaurentPost extends StatefulWidget {
  const RestaurentPost({Key? key}) : super(key: key);

  @override
  _RestaurentPostState createState() => _RestaurentPostState();
}

class _RestaurentPostState extends State<RestaurentPost> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Chia sẻ quán ăn',
            style: GoogleFonts.quicksand(
              fontWeight: FontWeight.w600,
              color: Colors.white,
              fontSize: 17,
            ),
          ),
        ),
        backgroundColor: kBackgroundColor,
        elevation: 0,
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          NarbarPost(),
          RetaurentIntput(),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'Lưu thay đổi',
                      style: GoogleFonts.quicksand(
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          fontSize: 18),
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(27),
                      ),
                      primary: kBackgroundColor,
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      '      Hủy      ',
                      style: GoogleFonts.quicksand(
                          fontWeight: FontWeight.w600,
                          color: kTextColor,
                          fontSize: 18),
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(27),
                      ),
                      primary: Colors.white,
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
