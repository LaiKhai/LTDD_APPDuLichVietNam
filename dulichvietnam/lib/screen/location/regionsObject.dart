class regionsObject {
  final String tenvungmien;
  regionsObject(this.tenvungmien);
  regionsObject.fromJson(Map<String, dynamic> res)
      : tenvungmien = res['vung_miens']['tenvungmien'];
}
