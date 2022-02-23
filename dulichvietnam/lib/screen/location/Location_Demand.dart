import 'package:flutter/material.dart';

import 'demand_Card.dart';

class LocationDemand extends StatelessWidget {
  const LocationDemand({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Wrap(
        alignment: WrapAlignment.start,
        children: <Widget>[
          demandcard(
            title: "Dã Ngoại",
          ),
          demandcard(
            title: "Phượt",
          ),
          demandcard(
            title: "Du lịch",
          ),
          demandcard(
            title: "Tham Quan",
          ),
          demandcard(
            title: "Tham Quan",
          ),
          demandcard(
            title: "Tham Quan",
          )
        ],
      ),
    );
  }
}
