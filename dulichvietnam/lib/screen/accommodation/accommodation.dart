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
    Widget resort = Expanded(
        child: Card(
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
                child: Image.asset(
                  'assets/anh1.png',
                  fit: BoxFit.cover,
                ),
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
                  'Resort ngàn mây',
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
                      'Bãi biển, Khu 4, Cát Tiến\n'
                      'Quy Nhơn, Bình Định',
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
                      size: 15,
                    ),
                    Text(
                      '+84 3202 13184',
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
    ));
    Widget resort1 = Expanded(
        child: Card(
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
                child: Image.asset(
                  'assets/anh2.png',
                  fit: BoxFit.cover,
                ),
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
                  'Resort ngàn sao',
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
                      'Bãi biển, Khu 4, Cát Tiến\n'
                      'Quy Nhơn, Bình Định',
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
                      '+84 3202 13184',
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
    ));

    Widget resort2 = Expanded(
        child: Card(
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
                child: Image.asset(
                  'assets/anh2.png',
                  fit: BoxFit.cover,
                ),
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
                  'Resort hoàng hôn',
                  style: GoogleFonts.quicksand(
                      color: Colors.black,
                      fontSize: 14,
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
                      size: 10,
                    ),
                    Text(
                      'Bãi biển, Khu 4, Cát Tiến\n'
                      'Quy Nhơn, Bình Định',
                      overflow: TextOverflow.clip,
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
                      '+84 3202 13184',
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
                      size: 10,
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
              width: 4,
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
    ));

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
        //Thanh dropdownbutton về nơi lưu trú
        child: ListView(
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
                  if (newValue != null) setState(() => _valueChoose = newValue);
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
            resort,
            SizedBox(
              height: 10,
            ),
            resort1,
            SizedBox(
              height: 10,
            ),
            resort2,
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        backgroundColor: kBackgroundColor,
        child: new Icon(
          Icons.add_circle,
        ),
        onPressed: () {},
      ),
    );
  }
}
