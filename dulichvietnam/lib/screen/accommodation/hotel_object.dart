class LuuTru {
  final int id;
  final String ten;
  final String diachi;
  final String sdt;
  final String hinhanh;

  LuuTru(this.id, this.ten, this.diachi, this.sdt, this.hinhanh);
  LuuTru.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        ten = json['ten'],
        diachi = json['diachi'],
        sdt = json['sdt'],
        hinhanh = json['hinhanh'];
}
