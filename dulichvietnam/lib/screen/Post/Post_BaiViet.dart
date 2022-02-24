import 'dart:io';

import 'package:VietNamTravel/constants.dart';
import 'package:VietNamTravel/screen/Post/Baiviet_object.dart';
import 'package:VietNamTravel/screen/Post/api_response.dart';
import 'package:VietNamTravel/screen/login/loginscreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import 'baiViet_provider.dart';

class PostBaiviet extends StatefulWidget {
  final BaiVietObject? post;
  final String? title;

  PostBaiviet({this.post, this.title});

  @override
  _PostBaivietState createState() => _PostBaivietState();
}

class _PostBaivietState extends State<PostBaiviet> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _txtMota = TextEditingController();
  bool _loading = false;
  final _picker = ImagePicker();
  File? _imageFile;

  Future getImage() async {
    final pickedFile = await _picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  void _createPost() async {
    String? image = _imageFile == null ? null : getStringImage(_imageFile);
    ApiResponse response = await createPost(_txtMota.text, image);

    if (response.error == null) {
      Navigator.of(context).pop();
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('${response.error}')));
      setState(() {
        _loading = !_loading;
      });
    }
  }

  void initState() {
    if (widget.post != null) {
      _txtMota.text = widget.post!.mota ?? '';
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
            'Đăng bài chia sẻ',
            style: GoogleFonts.quicksand(
                color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: ListTile(
              leading: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.asset(
                    'assets/images/avatar_test.jpg',
                    fit: BoxFit.cover,
                    width: 50,
                    height: 50,
                  )),
              title: Text('Lai Khải',
                  style: GoogleFonts.quicksand(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
              subtitle: Text('Địa danh',
                  style:
                      GoogleFonts.quicksand(fontSize: 12, color: Colors.black)),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 10),
            child: Form(
              child: TextFormField(
                controller: _txtMota,
                cursorColor: const Color(0XFF0066FF),
                cursorWidth: 1.5,
                decoration: const InputDecoration(
                    hintText: "Hãy viết cảm nhận của bạn về địa danh này...",
                    border: InputBorder.none),
                keyboardType: TextInputType.multiline,
                maxLines: null,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Nội dung không được bỏ trống";
                  } else {
                    return null;
                  }
                },
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 20, right: 20),
            width: 350,
            height: 300,
            decoration: BoxDecoration(
                image: _imageFile == null
                    ? null
                    : DecorationImage(
                        image: FileImage(_imageFile ?? File('')),
                        fit: BoxFit.cover)),
            child: Center(
              child: IconButton(
                icon: Icon(
                  Icons.image,
                  size: 40,
                  color: Colors.black54,
                ),
                onPressed: () {
                  getImage();
                },
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(50),
            child: RaisedButton(
              onPressed: () {
                if (widget.post == null) {
                  _createPost();
                }
              },
              shape: StadiumBorder(),
              color: kBackgroundColor,
              textColor: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Text(
                "Đăng Bài",
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }

  getStringImage(File? imageFile) {}
}
