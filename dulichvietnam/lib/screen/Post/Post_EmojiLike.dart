import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Post_EmojiLike extends StatefulWidget {
  const Post_EmojiLike({Key? key}) : super(key: key);

  @override
  _Post_EmojiLikeState createState() => _Post_EmojiLikeState();
}

class _Post_EmojiLikeState extends State<Post_EmojiLike> {
  bool like = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.zero,
      child: Row(
        children: [
          IconButton(
              onPressed: () {
                setState(() {
                  like = !like;
                });
              },
              icon: Icon(
                like == true
                    ? Icons.favorite_outline_rounded
                    : Icons.favorite_rounded,
                color: Colors.black,
                size: 25,
              )),
          Text(
            '20',
            style: GoogleFonts.quicksand(
                fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
