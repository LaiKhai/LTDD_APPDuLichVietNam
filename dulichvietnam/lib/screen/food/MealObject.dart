class MealObject {
  final int id;
  final String ten;
  final String mota;
  final String trangthai;

  MealObject(this.id, this.ten, this.mota, this.trangthai);
  MealObject.fromJson(Map<String, dynamic> res)
      : id = res['id'],
        ten = res['ten'],
        mota = res['mota'],
        trangthai = res['trangthai'];
}
