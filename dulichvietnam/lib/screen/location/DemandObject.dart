class DemandObject {
  final int id;
  final String tennhucau;
  DemandObject(this.id, this.tennhucau);
  DemandObject.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        tennhucau = json['tennhucau'];
}
