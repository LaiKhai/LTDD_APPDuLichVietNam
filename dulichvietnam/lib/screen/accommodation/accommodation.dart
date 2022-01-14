import 'package:VietNamTravel/screen/accommodation/hotel.dart';
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
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.keyboard_arrow_left,
            size: 40,
            color: Colors.black,
          ),
        ),
        title: Center(
          child: Text(
            'Danh sách nơi lưu trú',
            style: GoogleFonts.quicksand(
                color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Container(
        child: FutureBuilder<List<LuuTru>>(
            future: LuuTruProvider.fetchPosts(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  children: [
                    ListView(
                      padding: EdgeInsets.all(30),
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 20, right: 20),
                          decoration: BoxDecoration(
                            border: Border.all(width: 1, color: Colors.grey),
                            borderRadius: BorderRadius.circular(27),
                          ),
                          child: DropdownButton(
                            hint: Text('Chọn nơi lưu trú'),
                            dropdownColor: Colors.white,
                            icon: Icon(Icons.arrow_drop_down),
                            iconSize: 36,
                            isExpanded: true,
                            underline: SizedBox(),
                            style: GoogleFonts.quicksand(),
                            value: _valueChoose,
                            onChanged: (String? newValue) {
                              if (newValue != null)
                                setState(() => _valueChoose = newValue);
                            },
                            items: listItem.map((Map map) {
                              return DropdownMenuItem(
                                value: map['id'].toString(),
                                child: Text(map['name']),
                              );
                            }).toList(),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Hotel(lsLuuTru: snapshot.data!),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ],
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('Có lỗi rầu nha m'),
                );
              }
              return Center(child: CircularProgressIndicator());
            }),
      ),
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
