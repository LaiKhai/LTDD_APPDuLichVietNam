import 'package:VietNamTravel/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:VietNamTravel/screen/login/components/inputText.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kBackgroundColor,
          elevation: 0,
        ),
        body: Container(
          decoration: BoxDecoration(color: kBackgroundColor),
          child: Column(
            children: [
              Expanded(
                child: SvgPicture.asset(
                  assetName,
                  color: Colors.white,
                ),
                flex: 2,
              ),
              Expanded(
                child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(59),
                        topRight: Radius.circular(59),
                      ),
                    ),
                    child: InputText()),
                flex: 3,
              )
            ],
          ),
        ));
  }
}
