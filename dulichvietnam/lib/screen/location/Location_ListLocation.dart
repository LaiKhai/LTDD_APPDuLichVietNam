import 'package:VietNamTravel/constants.dart';
import 'package:VietNamTravel/screen/location/LocationObject.dart';
import 'package:VietNamTravel/screen/location/Location_detail.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Location_ListLocation extends StatelessWidget {
  const Location_ListLocation({Key? key, required this.lsLocation})
      : super(key: key);

  final List<LocationObject> lsLocation;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListView.builder(
        shrinkWrap: true,
        itemCount: lsLocation.length,
        itemBuilder: (context, index) => Container(
                child: Stack(
              alignment: Alignment.centerLeft,
              children: <Widget>[
                Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    margin: EdgeInsets.all(10),
                    child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Location_Details(
                                      locationID: lsLocation[index].id)));
                        },
                        child: Container(
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.network(
                                baseUrl +
                                    lsLocation[index].hinh_anhs[0].hinhanh,
                                fit: BoxFit.cover,
                                width: 400,
                                height: 160,
                                color: Colors.black.withOpacity(0.4),
                                colorBlendMode: BlendMode.darken,
                              )),
                        ))),
                Positioned(
                    top: 110,
                    right: 100,
                    child: Container(
                      height: 136,
                      width: size.width - 170,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: 5),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.location_on,
                                  color: Colors.white,
                                  size: 30,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 5),
                                  child: Text(
                                    lsLocation[index].tendiadanh,
                                    style: GoogleFonts.quicksand(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ))
              ],
            )));
  }
}
