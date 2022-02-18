import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChildCard extends StatelessWidget {
  final Size size;
  const ChildCard({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerLeft,
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(20),
          height: 160,
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
                height: 160,
              )),
        ),
        Positioned(
            top: 30,
            left: 180,
            child: Container(
              height: 136,
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
                    height: 74,
                    width: 200,
                    child: Text(
                      'Trong các điểm du lịch có một số doanh nghiệp đủ điều kiện được phép đón khách du lịch quốc tế, như: Công ty cổ phần thương',
                      softWrap: true,
                      style: GoogleFonts.quicksand(
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  )
                ],
              ),
            ))
      ],
    );
  }
}
