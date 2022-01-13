import 'package:VietNamTravel/screen/login/loginscreen.dart';

class User {
  final int id;
  final String email;
  final String hoten;
  final String sdt;
  final String hinhanh;
  final String token;

  User(this.id, this.email, this.hoten, this.sdt, this.hinhanh, this.token);

  User.fromJson(Map<String, dynamic> json)
      : id = json['data']['id'],
        email = json['data']['email'],
        hoten = json['data']['hoten'],
        sdt = json['data']['sdt'],
        hinhanh = json['data']['hinhanh'],
        token = json['token'];
}
