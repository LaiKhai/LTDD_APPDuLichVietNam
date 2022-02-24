import 'package:VietNamTravel/screen/accommodation/hotel.dart';
import 'package:VietNamTravel/screen/accommodation/hotel_search.dart';
import 'package:VietNamTravel/screen/posts/hotel_post.dart';
import 'package:VietNamTravel/screen/accommodation/hotel_object.dart';
import 'package:VietNamTravel/screen/accommodation/hotel_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:VietNamTravel/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AccommationScreen extends StatefulWidget {
  const AccommationScreen({Key? key}) : super(key: key);

  @override
  _AccommationScreenState createState() => _AccommationScreenState();
}

class _AccommationScreenState extends State<AccommationScreen> {
  String? _valueChoose;
  List<Map> listItem = [
    {'id': '1', 'name': 'Bình Định'},
    {'id': '2', 'name': 'Bạc Liêu'},
    {'id': '3', 'name': 'Vĩnh Long'},
    {'id': '4', 'name': 'Đắk Lắk'},
    {'id': '5', 'name': 'Đồng Nai'},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        title: Center(
          child: Text(
            'Danh sách nơi lưu trú',
            style: GoogleFonts.quicksand(
                color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        actions: [
          Container(
            child: IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HotelSearch()));
              },
              icon: Icon(Icons.search),
            ),
          ),
        ],
      ),
      body: FutureBuilder<List<LuuTru>>(
          future: LuuTruProvider.getAllHotel(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Hotel(lsLuuTru: snapshot.data!);
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Có lỗi rồi'),
              );
            }
            return Center(child: CircularProgressIndicator());
          }),
      floatingActionButton: new FloatingActionButton(
        backgroundColor: kBackgroundColor,
        child: new Icon(
          Icons.add_circle,
        ),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => HotelPost()));
        },
      ),
    );
  }
}
