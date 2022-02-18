import 'package:flutter/material.dart';

import 'LocationObject.dart';
import 'LocationProvider.dart';
import 'Location_ListLocation.dart';

class LocationFuture extends StatefulWidget {
  const LocationFuture({Key? key}) : super(key: key);

  @override
  _LocationFutureState createState() => _LocationFutureState();
}

class _LocationFutureState extends State<LocationFuture> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return FutureBuilder<List<LocationObject>>(
        future: LocationProvider.fetchLocation(context),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Location_ListLocation(lsLocation: snapshot.data!);
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Có lỗi rồi'),
            );
          }
          return Center(child: CircularProgressIndicator());
        });
  }
}
