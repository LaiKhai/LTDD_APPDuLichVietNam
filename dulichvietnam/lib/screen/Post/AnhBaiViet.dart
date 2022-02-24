class AnhbvObject {
  final int id;
  final int bai_viets_id;
  final int dia_danhs_id;
  final String hinhanh;
  final int trangthai;
  AnhbvObject(this.id, this.bai_viets_id, this.dia_danhs_id, this.hinhanh,
      this.trangthai);
  AnhbvObject.fromjson(Map<String, dynamic> r)
      : id = r["id"],
        bai_viets_id = r["bai_viets_id"],
        dia_danhs_id = r["dia_danhs_id"],
        hinhanh = r["hinhanh"],
        trangthai = r["trangthai"];
}
