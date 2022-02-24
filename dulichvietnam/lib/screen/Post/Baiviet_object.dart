import 'package:VietNamTravel/screen/Post/AnhBaiViet.dart';

class BaiVietObject {
  final int id;
  final int user_id;
  final String hoten;
  final int dia_danhs_id;
  final String tendiadanh;
  final String tieude;
  final String mota;
  List<AnhbvObject> anh = [];
  BaiVietObject(this.id, this.user_id, this.hoten, this.dia_danhs_id,
      this.tendiadanh, this.tieude, this.mota, this.anh);
  BaiVietObject.fromjson(Map<String, dynamic> r)
      : id = r["id"],
        user_id = r["user_id"],
        hoten = r["hoten"],
        dia_danhs_id = r["dia_danhs_id"],
        tendiadanh = r["tendiadanh"],
        tieude = r["tieude"],
        mota = r["mota"],
        anh = r["anh"];
}
