import 'package:VietNamTravel/constants.dart';
import 'package:VietNamTravel/screen/Post/HeaderBodyPost.dart';
import 'package:VietNamTravel/screen/Post/Post_BaiViet.dart';
import 'package:VietNamTravel/screen/home/components/Home_Emoji.dart';
import 'package:VietNamTravel/screen/home/components/headerBodyTab.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'Post_EmojiLike.dart';
import 'Post_UserProfile.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({Key? key}) : super(key: key);

  @override
  _PostScreenState createState() => _PostScreenState();
}

int activeIndex = 0;

final List<String> lstimg = [
  'https://image.freepik.com/free-photo/vertical-beautiful-buildings-boats-hoi-vietnam_181624-23720.jpg',
  'https://image.freepik.com/free-photo/vacation-stone-vietnam-fresh-green-china_1417-1360.jpg',
  'https://image.freepik.com/free-photo/beautiful-shot-kissing-rocks-ha-long-bay-vietnam_181624-22125.jpg'
];

class _PostScreenState extends State<PostScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
            child: Stack(
          children: [
            Column(
              children: [
                HeaderBodyPost(size: size, title: 'Bài Viết'),
                Card(
                  color: Colors.white,
                  shadowColor: Colors.grey.shade300,
                  child: Column(
                    children: [
                      Post_UserProfile(),
                      Container(
                        child: Column(
                          children: [
                            CarouselSlider.builder(
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
                                        setState(() => activeIndex = index))),
                            Container(
                                margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                                child: buildIndicator()),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(5),
                        child: Row(
                          children: [
                            Post_EmojiLike(),
                            Container(
                                margin: EdgeInsets.only(left: 25),
                                child: Row(children: [
                                  Icon(
                                    Icons.remove_red_eye,
                                    color: Colors.black,
                                    size: 25,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Text(
                                      '20k',
                                      style: GoogleFonts.quicksand(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                  )
                                ])),
                            Container(
                              margin: EdgeInsets.only(left: 20),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.location_on,
                                    color: Colors.black,
                                    size: 25,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 5),
                                    child: Text(
                                      'Đà Lạt',
                                      style: GoogleFonts.quicksand(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.all(10),
                          width: 400,
                          height: 100,
                          child: SingleChildScrollView(
                            child: Text(
                              'Sau gần 1 tháng diễn ra với nhiều bài thi xuất sắc, Qua nhiều vòng xét chọn Ban tổ chức xin được công bố kết quả cuộc thi như sau: Giải nhất thuộc về bài thi của bạn Lai Hồng Khải - Chi hội CĐ TH 19PMA. Giải nhất sẽ nhận được Giấy khen của Ban thư ký Hội Sinh viên trường và tiền thưởng 500.000đ',
                              softWrap: true,
                              style: GoogleFonts.quicksand(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ))
                    ],
                  ),
                ),
                Card(
                  color: Colors.white,
                  shadowColor: Colors.grey.shade300,
                  child: Column(
                    children: [
                      Post_UserProfile(),
                      Container(
                        child: Column(
                          children: [
                            CarouselSlider.builder(
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
                                        setState(() => activeIndex = index))),
                            Container(
                                margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                                child: buildIndicator()),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(5),
                        child: Row(
                          children: [
                            Post_EmojiLike(),
                            Container(
                                margin: EdgeInsets.only(left: 25),
                                child: Row(children: [
                                  Icon(
                                    Icons.remove_red_eye,
                                    color: Colors.black,
                                    size: 25,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Text(
                                      '20k',
                                      style: GoogleFonts.quicksand(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                  )
                                ])),
                            Container(
                              margin: EdgeInsets.only(left: 20),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.location_on,
                                    color: Colors.black,
                                    size: 25,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 5),
                                    child: Text(
                                      'Đà Lạt',
                                      style: GoogleFonts.quicksand(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.all(10),
                          width: 400,
                          height: 100,
                          child: SingleChildScrollView(
                            child: Text(
                              'Sau gần 1 tháng diễn ra với nhiều bài thi xuất sắc, Qua nhiều vòng xét chọn Ban tổ chức xin được công bố kết quả cuộc thi như sau: Giải nhất thuộc về bài thi của bạn Lai Hồng Khải - Chi hội CĐ TH 19PMA. Giải nhất sẽ nhận được Giấy khen của Ban thư ký Hội Sinh viên trường và tiền thưởng 500.000đ',
                              softWrap: true,
                              style: GoogleFonts.quicksand(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ))
                    ],
                  ),
                ),
              ],
            ),
          ],
        )),
        floatingActionButton: SizedBox(
          height: 60,
          width: 60,
          child: FloatingActionButton(
            backgroundColor: kBackgroundColor,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => PostBaiviet()));
            },
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ));
  }

  Widget listImage(String lstImg, int index) => ClipRRect(
          child: Image.network(
        lstImg,
        fit: BoxFit.cover,
        width: 400,
        height: 400,
      ));
}

Widget buildIndicator() => AnimatedSmoothIndicator(
      activeIndex: activeIndex,
      count: lstimg.length,
      effect: SlideEffect(
          dotHeight: 10,
          dotWidth: 10,
          activeDotColor: kBackgroundColor,
          dotColor: Colors.black38),
    );
