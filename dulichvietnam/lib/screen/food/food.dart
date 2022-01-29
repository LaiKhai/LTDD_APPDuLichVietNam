import 'package:VietNamTravel/screen/food/FoodList.dart';
import 'package:VietNamTravel/screen/food/FoodProvider.dart';
import 'package:VietNamTravel/screen/food/MealObject.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:VietNamTravel/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FoodPage extends StatefulWidget {
  const FoodPage({Key? key}) : super(key: key);

  @override
  _FoodPageState createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  @override
  Widget build(BuildContext context) {
    Widget timkiem = Expanded(
      child: Container(
        padding: EdgeInsets.all(10),
        child: TextField(
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(27)),
              ),
              prefixIcon: IconButton(
                onPressed: () {},
                icon: Icon(Icons.search),
                color: Colors.grey,
              )),
        ),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        title: Container(
          margin: EdgeInsets.only(left: 50),
          child: Text(
            'Danh sách món ăn',
            style: GoogleFonts.quicksand(
                color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: FutureBuilder<List<MealObject>>(
        future: FoodProvider.fetchMeal(context),
        builder: (context, snapshot) {
          print(FoodProvider.fetchMeal(context));
          if (snapshot.hasData) {
            return FoodList(lstMeal: snapshot.data!);
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
      floatingActionButton: new FloatingActionButton(
        backgroundColor: kBackgroundColor,
        child: new Icon(
          Icons.add_circle,
        ),
        onPressed: () {},
      ),
    );
  }
}
