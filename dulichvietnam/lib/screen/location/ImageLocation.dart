class ImageLocation {
  final int id;
  final String hinhanh;
  final int dia_danhs_id;
  ImageLocation(this.id, this.hinhanh, this.dia_danhs_id);
  ImageLocation.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        hinhanh = json['hinhanh'],
        dia_danhs_id = json['dia_danhs_id'];
}
