import 'package:VietNamTravel/screen/posts/dropdown/dropdown.dart';
import 'package:flutter/material.dart';

class NarbarPost extends StatefulWidget {
  const NarbarPost({Key? key}) : super(key: key);

  @override
  _NarbarPostState createState() => _NarbarPostState();
}

class _NarbarPostState extends State<NarbarPost> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Image.network(
          'https://i0.wp.com/s3.anhdep24.net/images/2018/02/27/5735aafb0b4a4.jpg',
        ),
      ),
      title: Text(
        'Như Quỳnh',
        style: TextStyle(color: Colors.black),
        textAlign: TextAlign.left,
      ),
      subtitle: DropdownButtonExample(),
    );
  }
}
