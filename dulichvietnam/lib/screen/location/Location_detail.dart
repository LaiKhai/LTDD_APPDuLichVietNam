import 'package:VietNamTravel/constants.dart';
import 'package:VietNamTravel/screen/home/components/Home_ListTitle.dart';
import 'package:VietNamTravel/screen/home/components/Home_Title.dart';
import 'package:VietNamTravel/screen/location/ChildCard.dart';
import 'package:VietNamTravel/screen/location/LocationObject.dart';
import 'package:VietNamTravel/screen/location/LocationProvider.dart';
import 'package:VietNamTravel/screen/location/Location_Demand.dart';
import 'package:VietNamTravel/screen/location/demand_Card.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'carousel.dart';

class Location_Details extends StatelessWidget {
  final int locationID;
  const Location_Details({Key? key, required this.locationID})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final int activeIndex = 0;

    final List<String> lstimg = [
      'https://image.freepik.com/free-photo/vertical-beautiful-buildings-boats-hoi-vietnam_181624-23720.jpg',
      'https://image.freepik.com/free-photo/vacation-stone-vietnam-fresh-green-china_1417-1360.jpg',
      'https://image.freepik.com/free-photo/beautiful-shot-kissing-rocks-ha-long-bay-vietnam_181624-22125.jpg'
    ];

    Size size = MediaQuery.of(context).size;

    return Scaffold(
        body: FutureBuilder<LocationObject>(
            future: LocationProvider.fetchLocationDetail(locationID),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text("Có lỗi xảy ra !"),
                );
              } else if (snapshot.hasData) {
                LocationObject lc = snapshot.data!;
                return SingleChildScrollView(
                  child: Container(
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            //---------------------------Slide Hình Ảnh ----------------------------------//
                            Carousel_Location(
                              location: lc,
                            ),

                            Positioned(
                                top: 30,
                                child: Container(
                                    child: IconButton(
                                  icon: Icon(
                                    Icons.keyboard_arrow_left,
                                    color: Colors.white,
                                    size: 40,
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ))),
                          ],
                        ),
                        //---------------------------Slide Hình Ảnh - End ----------------------------------//
                        Container(
                            margin: EdgeInsets.fromLTRB(15, 20, 230, 5),
                            child: Text(lc.tendiadanh,
                                style: GoogleFonts.quicksand(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green[500]))),
                        Container(
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(20, 0, 5, 0),
                                child: Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                ),
                              ),
                              Container(
                                child: Text(lc.likes_count.toString(),
                                    style: GoogleFonts.quicksand(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black)),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(20, 0, 5, 0),
                                child: Icon(
                                  Icons.remove_red_eye,
                                  color: Colors.black,
                                ),
                              ),
                              Container(
                                child: Text(lc.views_count.toString(),
                                    style: GoogleFonts.quicksand(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black)),
                              )
                            ],
                          ),
                        ),
                        //---------------------------Mô Tả----------------------------------//
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0)),
                          margin: EdgeInsets.fromLTRB(15, 20, 15, 20),
                          child: ListTile(
                            title: Container(
                              padding: EdgeInsets.fromLTRB(15, 20, 20, 5),
                              child: Text(
                                "Mô Tả",
                                style: GoogleFonts.quicksand(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green[500]),
                              ),
                            ),
                            subtitle: Container(
                                margin: EdgeInsets.all(10),
                                width: 400,
                                height: 400,
                                child: SingleChildScrollView(
                                  child: Text(
                                    lc.mota,
                                    softWrap: true,
                                    style: GoogleFonts.quicksand(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                )),
                          ),
                        ),

                        //---------------------------Mô Tả - End ----------------------------------//
                        //--------------------------- Vùng Miền ----------------------------------//
                        Card(
                          margin: EdgeInsets.fromLTRB(15, 10, 15, 20),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0)),
                          color: kBackgroundColor,
                          child: ListTile(
                            title: Container(
                              margin: EdgeInsets.fromLTRB(15, 15, 15, 10),
                              child: Text(
                                "Vùng Miền",
                                style: GoogleFonts.quicksand(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                            subtitle: Container(
                              margin: EdgeInsets.fromLTRB(20, 0, 15, 15),
                              child: Text(
                                lc.tenvungmien,
                                style: GoogleFonts.quicksand(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        //--------------------------- Vùng Miền - End ----------------------------------//
                        Card(
                          margin: EdgeInsets.fromLTRB(15, 10, 15, 20),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0)),
                          color: kBackgroundColor,
                          child: ListTile(
                            leading: Container(
                              margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                              child: Icon(
                                Icons.location_on,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                            title: Container(
                              child: Text(
                                "Google map",
                                style: GoogleFonts.quicksand(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        Home_Title(
                          title: "Nhu Cầu",
                          size: EdgeInsets.fromLTRB(10, 20, 10, 10),
                        ),
                        LocationDemand(),
                        Home_ListTitle(
                          title: 'Danh sách Lưu trú',
                          size: EdgeInsets.fromLTRB(10, 20, 10, 10),
                        ),
                        ChildCard(size: size),
                        ChildCard(size: size),
                        Home_ListTitle(
                          title: 'Danh sách Quán Ăn',
                          size: EdgeInsets.fromLTRB(10, 20, 10, 10),
                        ),
                        ChildCard(size: size),
                        ChildCard(size: size),
                        Home_ListTitle(
                          title: 'Danh sách Món Ăn',
                          size: EdgeInsets.fromLTRB(10, 20, 10, 10),
                        ),
                        ChildCard(size: size),
                        ChildCard(size: size),
                      ],
                    ),
                  ),
                );
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            }));
  }
}
