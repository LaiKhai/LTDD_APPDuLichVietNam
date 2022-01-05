import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:VietNamTravel/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SitesScreen extends StatefulWidget {
  const SitesScreen({Key? key}) : super(key: key);

  @override
  _SitesScreenState createState() => _SitesScreenState();
}

class _SitesScreenState extends State<SitesScreen> {
  Widget timkiem = Expanded(
    child: Container(
      padding: EdgeInsets.all(10),
      child: TextField(
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(27)),
            ),
            prefixIcon: IconButton(
              onPressed: () {},
              icon: Icon(Icons.search),
              color: Colors.grey,
            )),
      ),
    ),
  );

  Widget site1 = Expanded(
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
                  'assets/restaurent/image1.jpg',
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
                  'Eo gió',
                  style: GoogleFonts.quicksand(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 4,
                  height: 4,
                ),

                Text(
                  'Một eo biển xanh, đẹp hình vòng cung được\nnhững rặng núi đá cao uốn cong ôm trọn\nvào lòng....',
                  style: GoogleFonts.quicksand(
                      color: kTextColor,
                      fontSize: 9,
                      fontWeight: FontWeight.bold),
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
                      'Duyên hải miền Trung',
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
              padding: EdgeInsets.only(left: 20),
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
    ),
  );
  Widget site2 = Expanded(
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
                  'assets/restaurent/image1.jpg',
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
                  'Kỳ Co',
                  style: GoogleFonts.quicksand(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 4,
                  height: 4,
                ),

                Text(
                  'Một eo biển xanh, đẹp hình vòng cung được\nnhững rặng núi đá cao uốn cong ôm trọn\nvào lòng....',
                  style: GoogleFonts.quicksand(
                      color: kTextColor,
                      fontSize: 9,
                      fontWeight: FontWeight.bold),
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
                      'Duyên hải miền Trung',
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
              padding: EdgeInsets.only(left: 20),
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
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child: Text(
            'Danh sách địa danh',
            style: GoogleFonts.quicksand(
                color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Container(
        child: ListView(
          padding: EdgeInsets.all(30),
          children: [
            timkiem,
            SizedBox(
              height: 10,
            ),
            site1,
            SizedBox(
              height: 10,
            ),
            site2,
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
