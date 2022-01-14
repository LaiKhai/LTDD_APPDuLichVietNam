import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Post_UserProfile extends StatelessWidget {
  const Post_UserProfile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: ListTile(
        leading: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.asset(
              'assets/images/avatar_test.jpg',
              fit: BoxFit.cover,
              width: 50,
              height: 50,
            )),
        title: Text('Lai Khải',
            style: GoogleFonts.quicksand(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.black)),
        trailing: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.more_vert_rounded,
            )),
      ),
    );
  }
}
