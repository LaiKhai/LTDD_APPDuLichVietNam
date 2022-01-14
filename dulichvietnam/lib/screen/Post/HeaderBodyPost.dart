import 'package:VietNamTravel/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeaderBodyPost extends StatelessWidget {
  const HeaderBodyPost({Key? key, required this.size, required this.title})
      : super(key: key);

  final Size size;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
        //Lấy chiều cao theo 20% tổng chiều cao màn hình
        height: size.height * 0.25,
        child: Stack(
          children: [
            Container(
              height: size.height * 0.2 - 27,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 20,
                      offset: Offset(0, -4), // changes position of shadow
                    ),
                  ],
                  color: kBackgroundColor,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(38),
                      bottomRight: Radius.circular(38))),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(150, 40, 30, 20),
              child: Text(title,
                  style: GoogleFonts.quicksand(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
            ),
            Positioned(
                left: 68,
                top: 120,
                child: Container(
                  width: 280,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 1,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: TextButton(
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ))),
                    child: ListTile(
                      title: Text(
                        'Tìm kiếm bài viết...',
                        style: GoogleFonts.quicksand(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                      ),
                      trailing: Icon(Icons.search),
                    ),
                    onPressed: () {},
                  ),
                ))
          ],
        ));
  }
}
