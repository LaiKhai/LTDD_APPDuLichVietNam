import 'package:VietNamTravel/UserProfile.dart/User_Profile.dart';
import 'package:VietNamTravel/constants.dart';
import 'package:VietNamTravel/screen/Post/PostScreen.dart';
import 'package:VietNamTravel/screen/home/Body.dart';
import 'package:VietNamTravel/screen/location/Location_HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentindex = 0;
  @override
  Widget build(BuildContext context) {
    final tabs = [
      Body(),
      PostScreen(),
      Location_HomeScreen(),
      Center(
        child: Text('Hello3'),
      )
    ];
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kBackgroundColor,
        actions: [
          Padding(
            padding: EdgeInsets.fromLTRB(20, 0, 90, 0),
            child: SvgPicture.asset(
              assetLogo,
              color: Colors.white,
              width: 100,
            ),
          ),
          SizedBox(
            width: 50,
          ),
          Container(
              padding: EdgeInsets.fromLTRB(5, 20, 5, 10),
              child: MaterialButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => UserProfile()));
                  },
                  child: Row(
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Image.asset(
                            'assets/images/avatar_test.jpg',
                          )),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Lai Khải",
                        style: GoogleFonts.quicksand(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ],
                  ))),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentindex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                (_currentindex == 0 ? Icons.home : Icons.home_outlined),
                color: Colors.black,
              ),
              title: Text(
                'Trang Chủ',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: _currentindex == 0
                        ? FontWeight.bold
                        : FontWeight.normal),
              )),
          BottomNavigationBarItem(
              icon: Icon(
                  (_currentindex == 1
                      ? Icons.receipt_long
                      : Icons.receipt_long_outlined),
                  color: Colors.black),
              title: Text('Bài Viết',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: _currentindex == 1
                          ? FontWeight.bold
                          : FontWeight.normal))),
          BottomNavigationBarItem(
              icon: Icon(
                  (_currentindex == 2
                      ? Icons.location_on
                      : Icons.location_on_outlined),
                  color: Colors.black),
              title: Text('Địa Danh',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: _currentindex == 2
                          ? FontWeight.bold
                          : FontWeight.normal))),
          BottomNavigationBarItem(
              icon: Icon(
                  (_currentindex == 3
                      ? Icons.sports_motorsports_rounded
                      : Icons.sports_motorsports_outlined),
                  color: Colors.black),
              title: Text('Nhu Cầu',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: _currentindex == 3
                          ? FontWeight.bold
                          : FontWeight.normal))),
        ],
        onTap: (index) {
          setState(() {
            _currentindex = index;
          });
        },
      ),
      body: tabs[_currentindex],
    );
  }
}
