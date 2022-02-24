import 'package:VietNamTravel/screen/location/ImageLocation.dart';

class LocationObject {
  int id;
  String tendiadanh;
  String mota;
  String? kinhdo;
  String? vido;
  int vung_miens_id;
  String tenvungmien;
  int likes_count;
  int views_count;
  List<ImageLocation> hinh_anhs = [];
  LocationObject(
      {required this.id,
      required this.tendiadanh,
      required this.mota,
      required this.kinhdo,
      required this.vido,
      required this.vung_miens_id,
      required this.tenvungmien,
      required this.likes_count,
      required this.views_count,
      required this.hinh_anhs});
  factory LocationObject.fromJson(Map<String, dynamic> json) {
    var list = (json['hinh_anhs'] ?? []) as List;
    List<ImageLocation> lstImageLocation =
        list.map((e) => ImageLocation.fromJson(e)).toList();
    return LocationObject(
        id: json['id'],
        tendiadanh: json['tendiadanh'],
        mota: json['mota'],
        kinhdo: json['kinhdo'],
        vido: json['vido'],
        vung_miens_id: json['vung_miens_id'],
        tenvungmien: json['tenvungmien'],
        likes_count: json['likes_count'],
        views_count: json['views_count'],
        hinh_anhs: lstImageLocation);
  }
}
