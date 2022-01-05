import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Home_ListLocationChild.dart';

class Home_ListLocation extends StatelessWidget {
  const Home_ListLocation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Home_ListLocationChild(), Home_ListLocationChild()],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Home_ListLocationChild(), Home_ListLocationChild()],
            )
          ],
        )
      ],
    );
  }
}
