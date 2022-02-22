import 'package:flutter/material.dart';
import 'package:VietNamTravel/screen/accommodation/hotel_object.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:VietNamTravel/constants.dart';

class Hotel extends StatelessWidget {
  final List<LuuTru> lsLuuTru;
  const Hotel({Key? key, required this.lsLuuTru}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
                        padding: EdgeInsets.only(left: 5, right: 5),
                        width: 100,
                        height: 90,
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          child: Image.network(
                            lsLuuTru[index].hinhanh,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      // Tên nơi lưu trú
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 10),
                            child: Text(
                              lsLuuTru[index].ten,
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
                              Container(
                                padding: EdgeInsets.only(left: 10),
                                child: Icon(
                                  Icons.loyalty,
                                  color: Colors.orange,
                                  size: 15,
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 5),
                                child: Text(
                                  lsLuuTru[index].diachi,
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
                              Container(
                                padding: EdgeInsets.only(left: 10),
                                child: Icon(
                                  Icons.phone,
                                  color: Colors.greenAccent[400],
                                  size: 15,
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 5),
                                child: Text(
                                  lsLuuTru[index].sdt,
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
                          // dữ liệu tĩnh
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.only(left: 10),
                                child: Icon(
                                  Icons.location_on,
                                  color: Colors.red,
                                  size: 15,
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 5),
                                child: Text(
                                  lsLuuTru[index].tendiadanh,
                                  style: GoogleFonts.quicksand(
                                      color: kTextColor,
                                      fontSize: 9,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

                      // Container(
                      //   padding: EdgeInsets.only(left: 100),
                      //   child: IconButton(
                      //       icon: Icon(
                      //         Icons.more_horiz,
                      //         size: 18,
                      //       ),
                      //       onPressed: () {}),
                      // ),
                    ],
                  ),
                ),
              )),
    );
  }
}
