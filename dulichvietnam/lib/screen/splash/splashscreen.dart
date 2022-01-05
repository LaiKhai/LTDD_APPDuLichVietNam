import 'package:VietNamTravel/constants.dart';
import 'package:VietNamTravel/screen/home/homescreen.dart';
import 'package:VietNamTravel/screen/login/loginscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();
    var duration = Duration(seconds: 3);
    Future.delayed(duration, () {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
          (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: BoxDecoration(color: kBackgroundColor),
            child: Center(
                child: Column(
              children: [
                Expanded(
                  flex: 8,
                  child: SvgPicture.asset(
                    assetName,
                    color: Colors.white,
                  ),
                ),
              ],
            ))));
  }
}
