import 'package:VietNamTravel/screen/location/LocationObject.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../constants.dart';

class Carousel_Location extends StatefulWidget {
  final LocationObject location;
  const Carousel_Location({Key? key, required this.location}) : super(key: key);

  @override
  _Carousel_LocationState createState() => _Carousel_LocationState();
}

int activeIndex = 0;

Widget listImage(String lstImg, int index) => ClipRRect(
        child: Image.network(
      lstImg,
      fit: BoxFit.cover,
      width: 500,
      height: 500,
    ));

class _Carousel_LocationState extends State<Carousel_Location> {
  @override
  Widget build(BuildContext context) {
    LocationObject? location;
    int id = location!.id;
    return CarouselSlider.builder(
        itemCount: location.hinh_anhs.length,
        itemBuilder: (context, index, realIndex) {
          final imageUrl = imgUrl + "/$id" + location.hinh_anhs[index].hinhanh;
          return listImage(imageUrl, index);
        },
        options: CarouselOptions(
            autoPlay: false,
            aspectRatio: 1.5,
            viewportFraction: 1,
            onPageChanged: (index, reason) =>
                setState(() => activeIndex = index)));
  }
}
