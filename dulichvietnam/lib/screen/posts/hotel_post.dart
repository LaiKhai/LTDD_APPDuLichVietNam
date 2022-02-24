import 'package:VietNamTravel/screen/posts/dropdown/dropdown.dart';
import 'package:VietNamTravel/screen/posts/dropdown/narbar_post.dart';
import 'package:VietNamTravel/screen/posts/hotel_input.dart';
import 'package:flutter/material.dart';
import 'package:VietNamTravel/constants.dart';
import 'package:google_fonts/google_fonts.dart';

class HotelPost extends StatefulWidget {
  const HotelPost({Key? key}) : super(key: key);

  @override
  _HotelPostState createState() => _HotelPostState();
}

class _HotelPostState extends State<HotelPost> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Chia sẻ nơi lưu trú',
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
          // NarbarPost(),
          HotelInput(),
        ],
      ),
    );
  }
}
