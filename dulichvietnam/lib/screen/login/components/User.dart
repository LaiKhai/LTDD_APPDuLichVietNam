import 'package:VietNamTravel/screen/login/loginscreen.dart';

class User {
  final int? id;
  final String? email;
  final String? hoten;
  final String token;

  User(this.id, this.email, this.hoten, this.token);

  User.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        email = json['email'],
        hoten = json['hoten'],
        token = json['token'];
}
