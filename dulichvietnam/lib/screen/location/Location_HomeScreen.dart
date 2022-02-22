import 'package:VietNamTravel/screen/Post/HeaderBodyPost.dart';
import 'package:VietNamTravel/screen/home/components/Carousel_CardSection.dart';
import 'package:VietNamTravel/screen/home/components/Home_ListTitle.dart';
import 'package:VietNamTravel/screen/home/components/Home_Title.dart';
import 'package:VietNamTravel/screen/location/LocationObject.dart';
import 'package:VietNamTravel/screen/location/LocationProvider.dart';
import 'package:VietNamTravel/screen/location/Location_Add.dart';
import 'package:VietNamTravel/screen/location/Location_List.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants.dart';
import 'Location_ListLocation.dart';

class Location_HomeScreen extends StatefulWidget {
  const Location_HomeScreen({Key? key}) : super(key: key);

  @override
  _Location_HomeScreenState createState() => _Location_HomeScreenState();
}

class _Location_HomeScreenState extends State<Location_HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final List<String> lstimg = [
      'https://image.freepik.com/free-photo/vertical-beautiful-buildings-boats-hoi-vietnam_181624-23720.jpg',
      'https://image.freepik.com/free-photo/vacation-stone-vietnam-fresh-green-china_1417-1360.jpg',
      'https://image.freepik.com/free-photo/beautiful-shot-kissing-rocks-ha-long-bay-vietnam_181624-22125.jpg'
    ];
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                children: [
                  HeaderBodyPost(size: size, title: 'Địa Danh'),
                  Home_Title(
                      title: 'Địa danh nổi bật',
                      size: EdgeInsets.fromLTRB(10, 10, 120, 10)),
                  CarouselSlider(
                      items: lstimg
                          .map((item) => CardSection_Carousel(img: item))
                          .toList(),
                      options: CarouselOptions(
                        autoPlay: false,
                        aspectRatio: 1.5,
                      )),
                  Home_ListTitle(
                    title: 'Danh sách địa danh',
                    size: EdgeInsets.fromLTRB(10, 20, 10, 10),
                  ),
                  Column(
                    children: [LocationFuture()],
                  )
                ],
              )
            ],
          ),
        ),
        floatingActionButton: SizedBox(
          height: 60,
          width: 60,
          child: FloatingActionButton(
            backgroundColor: kBackgroundColor,
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (ctx) => Location_Add()));
            },
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ));
  }
}
