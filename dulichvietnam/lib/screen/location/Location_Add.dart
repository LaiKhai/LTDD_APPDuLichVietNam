import 'package:flutter/material.dart';

class Location_Add extends StatefulWidget {
  const Location_Add({Key? key}) : super(key: key);

  @override
  _Location_AddState createState() => _Location_AddState();
}

class _Location_AddState extends State<Location_Add> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Thêm Địa Danh"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
