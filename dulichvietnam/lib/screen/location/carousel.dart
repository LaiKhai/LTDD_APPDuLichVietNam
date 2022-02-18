import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Carousel_Location extends StatefulWidget {
  const Carousel_Location({Key? key}) : super(key: key);

  @override
  _Carousel_LocationState createState() => _Carousel_LocationState();
}

int activeIndex = 0;

final List<String> lstimg = [
  'https://image.freepik.com/free-photo/vertical-beautiful-buildings-boats-hoi-vietnam_181624-23720.jpg',
  'https://image.freepik.com/free-photo/vacation-stone-vietnam-fresh-green-china_1417-1360.jpg',
  'https://image.freepik.com/free-photo/beautiful-shot-kissing-rocks-ha-long-bay-vietnam_181624-22125.jpg'
];

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
    return CarouselSlider.builder(
        itemCount: lstimg.length,
        itemBuilder: (context, index, realIndex) {
          final imageUrl = lstimg[index];
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
