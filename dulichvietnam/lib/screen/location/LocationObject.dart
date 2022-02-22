class LocationObject {
  final int id;
  final String tendiadanh;
  final String mota;
  final String kinhdo;
  final String vido;
  final int vung_miens_id;
  final String tenvungmien;
  final int likes_count;
  final int views_count;
  LocationObject(this.id, this.tendiadanh, this.mota, this.kinhdo, this.vido,
      this.vung_miens_id, this.tenvungmien, this.likes_count, this.views_count);
  LocationObject.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        tendiadanh = json['tendiadanh'],
        mota = json['mota'],
        kinhdo = json['kinhdo'],
        vido = json['vido'],
        vung_miens_id = json['vung_miens_id'],
        tenvungmien = json['tenvungmien'],
        likes_count = json['likes_count'],
        views_count = json['views_count'];
}
