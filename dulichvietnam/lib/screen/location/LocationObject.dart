class LocationObject {
  final int id;
  final String tendiadanh;
  final String mota;
  final String kinhdo;
  final String vido;
  final int vung_miens_id;
  final String tenvungmien;
  LocationObject(this.id, this.tendiadanh, this.mota, this.kinhdo, this.vido,
      this.vung_miens_id, this.tenvungmien);
  LocationObject.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        tendiadanh = json['tendiadanh'],
        mota = json['mota'],
        kinhdo = json['kinhdo'],
        vido = json['vido'],
        vung_miens_id = json['vung_miens_id'],
        tenvungmien = json['tenvungmien'];
}
