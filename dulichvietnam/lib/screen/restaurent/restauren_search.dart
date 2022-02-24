import 'package:VietNamTravel/constants.dart';
import 'package:VietNamTravel/screen/restaurent/restauren_object.dart';
import 'package:VietNamTravel/screen/restaurent/restauren_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RestaurenSearch extends StatefulWidget {
  const RestaurenSearch({Key? key}) : super(key: key);

  @override
  _RestaurenSearchState createState() => _RestaurenSearchState();
}

class _RestaurenSearchState extends State<RestaurenSearch> {
  List<RestaurentObject> lstRes = [];
  List<RestaurentObject> lstResTemp = [];
  TextEditingController _txtSearch = TextEditingController();
  ScrollController _scrollController = ScrollController();
  int _currentMax = 11;

  _loadHotels() async {
    final data = await RestaurentProvider.getAllRestaurent();
    setState(() {
      lstResTemp = data;
      _currentMax = lstResTemp.length;
    });
    for (int i = 0; i < _currentMax; i++) {
      lstRes.add(lstResTemp[i]);
    }
  }

  void _searchRes() async {
    setState(() {});
    if (_txtSearch.text.isEmpty) {
      lstRes = lstResTemp;
    } else {
      lstRes = [];
      for (var item in lstResTemp) {
        if (item.ten.toUpperCase().contains(_txtSearch.text.toUpperCase())) {
          lstRes.add(item);
        }
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _loadHotels();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _getData();
      }
    });
  }

  _getData() {
    if (_currentMax + 1 <= lstResTemp.length) {
      for (int i = _currentMax; i < _currentMax + 1; i++) {
        lstRes.add(lstResTemp[i]);
      }
      _currentMax += 1;
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          child: TextField(
            controller: _txtSearch,
            autofocus: true,
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.search,
              ),
              hintText: "Nhập nhà hàng cần tìm?",
              border: InputBorder.none,
            ),
            onChanged: (text) {
              _searchRes();
            },
          ),
        ),
        backgroundColor: kBackgroundColor,
        elevation: 0,
      ),
      body: Container(
        child: ListView.builder(
          itemCount: lstRes.length,
          itemBuilder: (context, index) => Card(
            child: Container(
              margin: EdgeInsets.all(5),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Load hình ảnh
                  Container(
                    padding: EdgeInsets.only(left: 5, right: 5),
                    width: 100,
                    height: 90,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(lstRes[index].hinhanh),
                        fit: BoxFit.cover, // -> 02
                      ),
                    ),
                  ),

                  SizedBox(
                    width: 4,
                    height: 4,
                  ),
                  // Tên nơi lưu trú
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Text(
                          lstRes[index].ten,
                          softWrap: true,
                          style: GoogleFonts.quicksand(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ),

                      SizedBox(
                        width: 4,
                        height: 4,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.loyalty,
                            color: Colors.orange,
                            size: 15,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Container(
                            child: Text(
                              lstRes[index].diachi,
                              softWrap: true,
                              style: GoogleFonts.quicksand(
                                  color: kTextColor,
                                  fontSize: 9,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 4,
                        height: 4,
                      ),
                      //Load số điện thoại
                      Row(
                        children: [
                          Icon(
                            Icons.phone,
                            color: Colors.greenAccent[400],
                            size: 15,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Text(
                            lstRes[index].sdt,
                            style: GoogleFonts.quicksand(
                                color: kTextColor,
                                fontSize: 9,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 4,
                        height: 4,
                      ),
                      // dữ liệu tĩnh
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: Colors.red,
                            size: 15,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Text(
                            lstRes[index].tendiadanh,
                            style: GoogleFonts.quicksand(
                                color: kTextColor,
                                fontSize: 9,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
