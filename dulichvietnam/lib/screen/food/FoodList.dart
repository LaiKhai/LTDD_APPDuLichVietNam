import 'package:VietNamTravel/screen/food/MealObject.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FoodList extends StatelessWidget {
  final List<MealObject> lstMeal;
  const FoodList({Key? key, required this.lstMeal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListView.builder(
      itemCount: lstMeal.length,
      itemBuilder: (context, index) => Container(
          child: Stack(
        alignment: Alignment.centerLeft,
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(10),
            height: 160,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 4),
                      blurRadius: 4,
                      color: Colors.black38)
                ]),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  'https://image.freepik.com/free-photo/high-angle-shot-beautiful-forest-with-lot-green-trees-enveloped-fog-new-zealand_181624-19717.jpg',
                  fit: BoxFit.cover,
                  width: 140,
                  height: 160,
                )),
          ),
          Positioned(
              top: 20,
              left: 160,
              child: Container(
                height: 136,
                width: size.width - 170,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      lstMeal[index].ten,
                      style: GoogleFonts.quicksand(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 5),
                      child: Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: Colors.pink[600],
                            size: 20,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 5),
                            child: Text(
                              'Đà Lạt',
                              style: GoogleFonts.quicksand(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[350]),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(top: 8),
                        height: 74,
                        width: 200,
                        child: SingleChildScrollView(
                          child: Text(
                            lstMeal[index].mota,
                            softWrap: true,
                            style: GoogleFonts.quicksand(
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ))
                  ],
                ),
              ))
        ],
      )),
    );
  }
}

// Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Container(
//               padding: EdgeInsets.zero,
//               width: 200,
//               height: 150,
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(11),
//                 child: Image.asset(
//                   'assets/restaurent/image1.jpg',
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//             Container(
//               padding: EdgeInsets.only(left: 5),
//               child: Text(
//                 lstMeal[index].ten,
//                 style: GoogleFonts.quicksand(
//                     color: Colors.black,
//                     fontSize: 17,
//                     fontWeight: FontWeight.bold),
//               ),
//             ),
//             Container(
//               padding: EdgeInsets.only(left: 5),
//               child: Text(
//                 lstMeal[index].mota,
//                 style: GoogleFonts.quicksand(
//                   color: Colors.black,
//                   fontSize: 15,
//                 ),
//               ),
//             ),
//           ],
//         ),