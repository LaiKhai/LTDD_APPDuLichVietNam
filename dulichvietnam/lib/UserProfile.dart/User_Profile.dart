import 'package:VietNamTravel/UserProfile.dart/User_childBody_1.dart';
import 'package:VietNamTravel/UserProfile.dart/User_headerBody.dart';
import 'package:VietNamTravel/constants.dart';
import 'package:VietNamTravel/screen/home/components/Home_ListTitle.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kBackgroundColor,
        actions: [
          Row(
            children: [
              Text(
                'Thông tin tài khoản',
                style: GoogleFonts.quicksand(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(
                width: 45,
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.logout_rounded, color: Colors.white),
              )
            ],
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            UserHeaderBody(size: size),
            Container(
              padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
              child: Text(
                'Lai Khải',
                textAlign: TextAlign.center,
                style: GoogleFonts.quicksand(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            User_childbody(),
            Container(
                padding: EdgeInsets.only(top: 31),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(20, 0, 80, 5),
                      child: TextButton(
                          onPressed: () {},
                          child: Text('Thông tin cá nhân',
                              style: GoogleFonts.quicksand(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black))),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.edit,
                          color: Colors.black,
                          size: 24,
                        ))
                  ],
                )),
            Container(
              margin: EdgeInsets.fromLTRB(15, 0, 80, 10),
              child: Column(
                children: [
                  ListTile(
                    title: Text(
                      'tên tài khoản',
                      style: GoogleFonts.quicksand(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                    ),
                    subtitle: Text(
                      'Lai Khải',
                      style: GoogleFonts.quicksand(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                  ListTile(
                    title: Text(
                      'Email',
                      style: GoogleFonts.quicksand(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                    ),
                    subtitle: Text(
                      '0306191036@caothang.edu.vn',
                      style: GoogleFonts.quicksand(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                  ListTile(
                    title: Text(
                      'Số điện thoại',
                      style: GoogleFonts.quicksand(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                    ),
                    subtitle: Text(
                      '0703756499',
                      style: GoogleFonts.quicksand(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
