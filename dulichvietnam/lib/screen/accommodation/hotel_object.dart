import 'package:path/path.dart';

class LuuTru {
  final int id;
  final String ten;
  final String diachi;
  final String sdt;
  final String hinhanh;
  final int dia_danhs_id;
  final String tendiadanh;
  LuuTru(this.id, this.ten, this.diachi, this.sdt, this.hinhanh,
      this.dia_danhs_id, this.tendiadanh);
  LuuTru.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        ten = json['ten'],
        diachi = json['diachi'],
        sdt = json['sdt'],
        hinhanh = json['hinhanh'],
        dia_danhs_id = json['dia_danhs_id'],
        tendiadanh = json['tendiadanh'];
}
