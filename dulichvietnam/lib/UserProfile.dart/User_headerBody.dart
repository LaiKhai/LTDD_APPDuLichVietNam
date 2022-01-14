import 'package:VietNamTravel/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserHeaderBody extends StatelessWidget {
  const UserHeaderBody({Key? key, required this.size}) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
        //Lấy chiều cao theo 20% tổng chiều cao màn hình
        height: size.height * 0.3,
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
            Positioned(
              left: 100,
              right: 100,
              top: 40,
              child: Container(
                margin: EdgeInsets.all(10),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset(
                      'assets/images/avatar_test.jpg',
                      fit: BoxFit.cover,
                      width: 180,
                      height: 180,
                    )),
              ),
            )
          ],
        ));
  }
}
