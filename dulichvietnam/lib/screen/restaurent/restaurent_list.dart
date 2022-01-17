import 'package:VietNamTravel/screen/restaurent/restauren_object.dart';
import 'package:flutter/material.dart';
import 'package:VietNamTravel/constants.dart';
import 'package:google_fonts/google_fonts.dart';

class RestaurentList extends StatelessWidget {
  final List<RestaurentObject> lsRestaurent;
  const RestaurentList({Key? key, required this.lsRestaurent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: lsRestaurent.length,
      itemBuilder: (context, index) => Card(
        child: Container(
          margin: EdgeInsets.all(5),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Load hình ảnh
              Container(
                padding: EdgeInsets.only(left: 5, right: 5),
                width: 100,
                height: 90,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(lsRestaurent[index].hinhanh),
                    fit: BoxFit.cover, // -> 02
                  ),
                ),
              ),

              SizedBox(
                width: 4,
                height: 4,
              ),
              // Tên nơi lưu trú
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text(
                      lsRestaurent[index].ten,
                      softWrap: true,
                      style: GoogleFonts.quicksand(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),

                  SizedBox(
                    width: 4,
                    height: 4,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.loyalty,
                        color: Colors.orange,
                        size: 15,
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Container(
                        child: Text(
                          lsRestaurent[index].diachi,
                          softWrap: true,
                          style: GoogleFonts.quicksand(
                              color: kTextColor,
                              fontSize: 9,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 4,
                    height: 4,
                  ),
                  //Load số điện thoại
                  Row(
                    children: [
                      Icon(
                        Icons.phone,
                        color: Colors.greenAccent[400],
                        size: 15,
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        lsRestaurent[index].sdt,
                        style: GoogleFonts.quicksand(
                            color: kTextColor,
                            fontSize: 9,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 4,
                    height: 4,
                  ),
                  // dữ liệu tĩnh
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        color: Colors.red,
                        size: 15,
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        'Bình Định',
                        style: GoogleFonts.quicksand(
                            color: kTextColor,
                            fontSize: 9,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
