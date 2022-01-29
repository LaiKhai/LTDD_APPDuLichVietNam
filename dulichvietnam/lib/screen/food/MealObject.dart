class MealObject {
  final int id;
  final String ten;
  final String mota;
  final String hinhanh;
  final String trangthai;

  MealObject(this.id, this.ten, this.mota, this.hinhanh, this.trangthai);
  MealObject.fromJson(Map<String, dynamic> res)
      : id = res['id'],
        ten = res['ten'],
        mota = res['mota'],
        hinhanh = res['hinhanh'],
        trangthai = res['trangthai'];
}
