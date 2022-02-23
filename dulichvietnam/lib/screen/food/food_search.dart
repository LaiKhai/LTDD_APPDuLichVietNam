import 'package:VietNamTravel/constants.dart';
import 'package:VietNamTravel/screen/food/FoodProvider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'MealObject.dart';

class FoodSearch extends StatefulWidget {
  const FoodSearch({Key? key}) : super(key: key);

  @override
  _FoodSearchState createState() => _FoodSearchState();
}

class _FoodSearchState extends State<FoodSearch> {
  List<MealObject> lstFoods = [];
  List<MealObject> lstFoodsTemp = [];
  TextEditingController _txtSearch = TextEditingController();
  ScrollController _scrollController = ScrollController();
  int _currentMax = 11;

  _loadFoods() async {
    final data = await FoodProvider.getAllFood();
    setState(() {
      lstFoodsTemp = data;
      _currentMax = lstFoodsTemp.length;
    });
    for (int i = 0; i < _currentMax; i++) {
      lstFoods.add(lstFoodsTemp[i]);
    }
  }

  void _searchFoods() async {
    setState(() {});
    if (_txtSearch.text.isEmpty) {
      lstFoods = lstFoodsTemp;
    } else {
      lstFoods = [];
      for (var item in lstFoodsTemp) {
        if (item.ten.toUpperCase().contains(_txtSearch.text.toUpperCase())) {
          lstFoods.add(item);
        }
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _loadFoods();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _getData();
      }
    });
  }

  _getData() {
    if (_currentMax + 1 <= lstFoodsTemp.length) {
      for (int i = _currentMax; i < _currentMax + 1; i++) {
        // if (_currentMax < lstFoodsTemp.length) {
        lstFoods.add(lstFoodsTemp[i]);
        // }
      }
      _currentMax += 1;
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
                border: InputBorder.none,
              ),
              onChanged: (text) {
                _searchFoods();
              },
            ),
          ),
          backgroundColor: kBackgroundColor,
          elevation: 0,
        ),
        body: Container(
            child: ListView.builder(
          itemCount: lstFoods.length,
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
                        lstFoods[index].hinhanh,
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
                            lstFoods[index].ten,
                            style: GoogleFonts.quicksand(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          Container(
                              margin: EdgeInsets.only(top: 8),
                              height: 74,
                              width: 200,
                              child: SingleChildScrollView(
                                child: Text(
                                  lstFoods[index].mota,
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
            ),
          ),
        )));
  }
}
