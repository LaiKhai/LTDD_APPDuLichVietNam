import 'package:VietNamTravel/screen/login/loginscreen.dart';

class User {
  final int id;
  final String email;
  final String hoten;
  final String sdt;
  final String hinhanh;

  User(this.id, this.email, this.hoten, this.sdt, this.hinhanh);

  User.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        email = json['email'],
        hoten = json['hoten'],
        sdt = json['sdt'],
        hinhanh = json['hinhanh'];
}
