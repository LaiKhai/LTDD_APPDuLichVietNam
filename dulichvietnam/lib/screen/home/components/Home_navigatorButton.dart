import 'package:VietNamTravel/screen/accommodation/accommodation.dart';
import 'package:VietNamTravel/screen/food/food.dart';
import 'package:VietNamTravel/screen/home/homescreen.dart';
import 'package:VietNamTravel/screen/restaurent/retaurents.dart';
import 'package:flutter/material.dart';

import 'ButtonSection.dart';

class Home_NavigatorButton extends StatelessWidget {
  const Home_NavigatorButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ButtonSection(
                  navigator: RestaurentScreen(),
                  title: 'Quán Ăn',
                  icon: Icons.store_mall_directory_rounded),
              SizedBox(
                width: 40,
              ),
              ButtonSection(
                  navigator: FoodPage(),
                  title: 'Món Ăn',
                  icon: Icons.restaurant_menu_rounded)
            ],
          ),
          SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ButtonSection(
                  navigator: AccommationScreen(),
                  title: ' Lưu trú ',
                  icon: Icons.hotel_rounded),
              SizedBox(
                width: 40,
              ),
              ButtonSection(
                  navigator: HomeScreen(),
                  title: 'Đăng bài',
                  icon: Icons.add_rounded)
            ],
          ),
        ],
      ),
    );
  }
}
