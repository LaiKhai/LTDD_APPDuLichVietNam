import 'package:VietNamTravel/screen/location/ImageLocation.dart';

class LocationObject {
  int id;
  String tendiadanh;
  String mota;
  String kinhdo;
  String vido;
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
    var list = (json['data']['hinh_anhs'] ?? []) as List;
    List<ImageLocation> lstImageLocation =
        list.map((e) => ImageLocation.fromJson(e)).toList();
    return LocationObject(
        id: json['data']['id'],
        tendiadanh: json['data']['tendiadanh'],
        mota: json['data']['mota'],
        kinhdo: json['data']['kinhdo'],
        vido: json['data']['vido'],
        vung_miens_id: json['data']['vung_miens_id'],
        tenvungmien: json['vung_miens']['tenvungmien'],
        likes_count: json['data']['likes_count'],
        views_count: json['data']['views_count'],
        hinh_anhs: lstImageLocation);
  }
}
