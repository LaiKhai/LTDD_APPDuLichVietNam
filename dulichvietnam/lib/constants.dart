import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

const kBackgroundColor = Color(0xff41B649);
const kTextColor = Color(0xffA2A4A6);
const String assetName = 'assets/DLVN2.svg';
const String assetLogo = 'assets/images/logoDLVN.svg';
const String baseUrl = "http://192.168.1.3:80";
const String loginUrl = baseUrl + "/api/login";
const String logoutUrl = baseUrl + "/api/logout";
const String registerUrl = baseUrl + "/api/register";
const String restaurantUrl = baseUrl + "/api/quanan";
const String foodUrl = baseUrl + "/api/monan";
const String hotelUrl = baseUrl + "/api/luutru";
const String locationlUrl = baseUrl + "/api/diadanh";

Future<String?> getToken() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  return pref.getString("token");
}
