import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'screen/login/components/User.dart';

const kBackgroundColor = Color(0xff41B649);
const kTextColor = Color(0xffA2A4A6);
final String assetName = 'assets/DLVN2.svg';
final String assetLogo = 'assets/images/logoDLVN.svg';

Future<Object?> getToken() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  return pref.getString("token");
}
