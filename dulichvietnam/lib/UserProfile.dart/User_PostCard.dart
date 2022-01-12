import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class User_PostCard extends StatelessWidget {
  const User_PostCard({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerLeft,
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(20),
          height: 180,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    offset: Offset(0, 4), blurRadius: 10, color: Colors.black38)
              ]),
        ),
        Container(
          margin: EdgeInsets.all(20),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                'https://image.freepik.com/free-photo/high-angle-shot-beautiful-forest-with-lot-green-trees-enveloped-fog-new-zealand_181624-19717.jpg',
                fit: BoxFit.cover,
                width: 140,
                height: 180,
              )),
        ),
        Positioned(
            top: 30,
            left: 180,
            child: Container(
              height: 200,
              width: size.width - 170,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Chiều Hoàng Hôn',
                    style: GoogleFonts.quicksand(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 5),
                    child: Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: Colors.pink[600],
                          size: 20,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 5),
                          child: Text(
                            'Đà Lạt',
                            style: GoogleFonts.quicksand(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[350]),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 8),
                    height: 68,
                    width: 200,
                    child: Text(
                      'Trong các điểm du lịch có một số doanh nghiệp đủ điều kiện được phép đón khách du lịch quốc tế, như: Công ty cổ phần thương',
                      softWrap: true,
                      style: GoogleFonts.quicksand(
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.only(right: 10),
                        child: Row(
                          children: [
                            Icon(
                              Icons.favorite_rounded,
                              color: Colors.red,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              '20k',
                              style: GoogleFonts.quicksand(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(right: 10),
                        child: Row(
                          children: [
                            Icon(
                              Icons.remove_red_eye_rounded,
                              color: Colors.black,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              '20k',
                              style: GoogleFonts.quicksand(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(5),
                        width: 100,
                        height: 30,
                        child: Row(
                          children: [
                            ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: Image.asset(
                                  'assets/images/avatar_test.jpg',
                                )),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Lai Khải",
                              style: GoogleFonts.quicksand(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ))
      ],
    );
  }
}
