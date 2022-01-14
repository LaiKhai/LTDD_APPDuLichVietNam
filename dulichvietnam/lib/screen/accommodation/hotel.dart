import 'package:flutter/material.dart';
import 'package:VietNamTravel/screen/accommodation/hotel_object.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:VietNamTravel/constants.dart';

class Hotel extends StatelessWidget {
  final List<LuuTru> lsLuuTru;
  const Hotel({Key? key, required this.lsLuuTru}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      child: ListView.builder(
          itemCount: lsLuuTru.length,
          itemBuilder: (context, index) => Card(
                child: Container(
                  margin: EdgeInsets.all(5),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Load hình ảnh
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.zero,
                        width: 150,
                        height: 100,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(11),
                          child: Image.network(lsLuuTru[index].hinhanh),
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
                          Text(
                            lsLuuTru[index].ten,
                            style: GoogleFonts.quicksand(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
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
                              Text(
                                lsLuuTru[index].diachi,
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
                          //Load số điện thoại
                          Row(
                            children: [
                              Icon(
                                Icons.phone,
                                color: Colors.greenAccent[400],
                                size: 10,
                              ),
                              Text(
                                lsLuuTru[index].sdt,
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
                      SizedBox(
                        width: 2,
                        height: 4,
                      ),
                      Container(
                        child: IconButton(
                            icon: Icon(
                              Icons.more_horiz,
                              size: 10,
                            ),
                            onPressed: () {}),
                      ),
                    ],
                  ),
                ),
              )),
    );
  }
}
