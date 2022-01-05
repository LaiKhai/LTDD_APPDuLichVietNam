import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:VietNamTravel/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FoodPage extends StatefulWidget {
  const FoodPage({Key? key}) : super(key: key);

  @override
  _FoodPageState createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  Widget food1 = Row(
    children: [
      Column(
        children: [
          Container(
            padding: EdgeInsets.only(right: 10),
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.zero,
                    width: 200,
                    height: 150,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(11),
                      child: Image.asset(
                        'assets/restaurent/image1.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 5),
                    child: Text(
                      'Bánh xèo',
                      style: GoogleFonts.quicksand(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 5),
                    child: Text(
                      'Bánh xèo beo\nbéo thơm ngon....',
                      style: GoogleFonts.quicksand(
                        color: Colors.black,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      Column(
        children: [
          Container(
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.zero,
                    width: 200,
                    height: 150,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(11),
                      child: Image.asset(
                        'assets/restaurent/image1.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 5),
                    child: Text(
                      'Bánh xèo',
                      style: GoogleFonts.quicksand(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 5),
                    child: Text(
                      'Bánh xèo beo béo\nthơm ngon....',
                      style: GoogleFonts.quicksand(
                        color: Colors.black,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      )
    ],
  );
  Widget food2 = Row(
    children: [
      Column(
        children: [
          Container(
            padding: EdgeInsets.only(right: 10),
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.zero,
                    width: 200,
                    height: 150,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(11),
                      child: Image.asset(
                        'assets/restaurent/image1.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 5),
                    child: Text(
                      'Bánh xèo',
                      style: GoogleFonts.quicksand(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 5),
                    child: Text(
                      'Bánh xèo beo\nbéo thơm ngon....',
                      style: GoogleFonts.quicksand(
                        color: Colors.black,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      Column(
        children: [
          Container(
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.zero,
                    width: 200,
                    height: 150,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(11),
                      child: Image.asset(
                        'assets/restaurent/image1.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 5),
                    child: Text(
                      'Bánh xèo',
                      style: GoogleFonts.quicksand(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 5),
                    child: Text(
                      'Bánh xèo beo béo\nthơm ngon....',
                      style: GoogleFonts.quicksand(
                        color: Colors.black,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      )
    ],
  );

  @override
  Widget build(BuildContext context) {
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

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child: Text(
            'Danh sách món ăn',
            style: GoogleFonts.quicksand(
                color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Center(
        child: ListView(
          padding: EdgeInsets.all(30),
          children: [
            timkiem,
            SizedBox(
              width: 10,
            ),
            food1,
            SizedBox(
              height: 10,
            ),
            food2,
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
