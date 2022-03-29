class KabkotModel {
  String? id;
  String? idProvinsi;
  String? name;

  KabkotModel({this.id, this.idProvinsi, this.name});

  KabkotModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idProvinsi = json['id_provinsi'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['id_provinsi'] = idProvinsi;
    data['name'] = name;
    return data;
  }

  bool isEqual(KabkotModel model) {
    return id == model.id;
  }

  @override
  String toString() => name!;
}
