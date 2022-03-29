class KelurahanModel {
  String? id;
  String? idKecamatan;
  String? name;

  KelurahanModel({this.id, this.idKecamatan, this.name});

  KelurahanModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idKecamatan = json['id_kecamatan'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['id_kecamatan'] = idKecamatan;
    data['name'] = name;
    return data;
  }

  bool isEqual(KelurahanModel model) {
    return id == model.id;
  }

  @override
  String toString() => name!;
}
