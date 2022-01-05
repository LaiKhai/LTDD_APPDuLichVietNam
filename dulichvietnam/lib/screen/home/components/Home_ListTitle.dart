import 'package:flutter/material.dart';

import 'Home_Title.dart';

class Home_ListTitle extends StatelessWidget {
  final String title;
  final EdgeInsets size;
  const Home_ListTitle({Key? key, required this.title, required this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Home_Title(
          title: title,
          size: size,
        ),
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.navigate_next_rounded,
              color: Colors.black,
              size: 40,
            ))
      ],
    );
  }
}
