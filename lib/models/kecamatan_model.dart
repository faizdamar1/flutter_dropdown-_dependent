class KecamatanModel {
  String? id;
  String? idKabupaten;
  String? name;

  KecamatanModel({this.id, this.idKabupaten, this.name});

  KecamatanModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idKabupaten = json['id_kabupaten'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['id_kabupaten'] = idKabupaten;
    data['name'] = name;
    return data;
  }
}
