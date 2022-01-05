import 'dart:convert';
import 'package:http/http.dart' as http;

class RegisterProvider {
  register(String email, password, confirm_password, name) async {
    Map data = {
      'email': email,
      'password': password,
      'confirm_password': confirm_password,
      'hoten': name,
    };
    print(data);

    String body = json.encode(data);
    var url = 'http://192.168.1.5:80/api/register';
    var response = await http.post(
      Uri.parse(url),
      body: body,
      headers: {
        "Content-Type": "application/json",
        "accept": "application/json",
        "Access-Control-Allow-Origin": "*"
      },
    );
    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      //Or put here your next screen using Navigator.push() method
      print('success');
    } else {
      print('error');
    }
  }
}
