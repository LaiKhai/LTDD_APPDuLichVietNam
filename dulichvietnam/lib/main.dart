import 'package:VietNamTravel/UserProfile.dart/User_Profile.dart';
import 'package:VietNamTravel/screen/home/homescreen.dart';
import 'package:VietNamTravel/screen/login/loginscreen.dart';
import 'package:VietNamTravel/screen/accommodation/accommodation.dart';
import 'package:flutter/material.dart';
import 'screen/splash/splashscreen.dart';
import 'package:VietNamTravel/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Du Lịch Việt Nam',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: kBackgroundColor,
          selectionColor: kBackgroundColor,
          selectionHandleColor: kBackgroundColor,
        ),
      ),
      home: LoginScreen(),
    );
  }
}
