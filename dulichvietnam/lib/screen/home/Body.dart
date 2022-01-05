import 'package:VietNamTravel/constants.dart';
import 'package:VietNamTravel/screen/home/components/ButtonSection.dart';
import 'package:VietNamTravel/screen/home/components/Home_gps.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:VietNamTravel/screen/home/components/Carousel_CardSection.dart';
import 'package:VietNamTravel/screen/home/components/Home_Emoji.dart';
import 'package:VietNamTravel/screen/home/components/Home_HotCard.dart';
import 'package:VietNamTravel/screen/home/components/Home_ListLocation.dart';
import 'package:VietNamTravel/screen/home/components/Home_ListTitle.dart';
import 'package:VietNamTravel/screen/home/components/Home_Title.dart';
import 'package:VietNamTravel/screen/home/components/Home_navigatorButton.dart';
import 'package:VietNamTravel/screen/home/components/headerBodyTab.dart';
import 'package:VietNamTravel/screen/home/components/Home_gps.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> lstimg = [
      'https://image.freepik.com/free-photo/vertical-beautiful-buildings-boats-hoi-vietnam_181624-23720.jpg',
      'https://image.freepik.com/free-photo/vacation-stone-vietnam-fresh-green-china_1417-1360.jpg',
      'https://image.freepik.com/free-photo/beautiful-shot-kissing-rocks-ha-long-bay-vietnam_181624-22125.jpg'
    ];
    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: [
          HeaderBodyTab(
            size: size,
            title: 'Trang chủ',
          ),
          Home_NavigatorButton(),
          Home_Title(
              title: 'Bài viết nổi bật',
              size: EdgeInsets.fromLTRB(10, 20, 120, 10)),
          CarouselSlider(
              items: lstimg
                  .map((item) => CardSection_Carousel(img: item))
                  .toList(),
              options: CarouselOptions(
                autoPlay: false,
                aspectRatio: 1.5,
              )),
          Home_ListTitle(
            title: 'Danh sách bài viết',
            size: EdgeInsets.fromLTRB(20, 20, 30, 10),
          ),
          Home_HotCard(size: size),
          Home_HotCard(size: size),
          Home_HotCard(size: size),
          Home_ListTitle(
            title: 'Danh sách địa danh',
            size: EdgeInsets.fromLTRB(20, 20, 0, 10),
          ),
          Home_ListLocation()
        ],
      ),
    );
  }
}
