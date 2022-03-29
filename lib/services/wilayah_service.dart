import 'dart:convert';

import 'package:flutter_dropdown/configs/api.dart';
import 'package:flutter_dropdown/models/index.dart';
import 'package:http/http.dart' as http;

class WilayahService {
  Future<List<ProvinsiModel>> getProvinsi() async {
    try {
      var response = await http.get(Uri.parse(apiprovinsi));

      var data = json.decode(response.body)['value'] as List;

      if (response.statusCode == 200) {
        return data.map((e) => ProvinsiModel.fromJson(e)).toList();
      }

      return [];
    } catch (e) {
      return [];
    }
  }

  Future<List<KabkotModel>> getKabkot(String idProvinsi) async {
    try {
      var response = await http.get(Uri.parse("$apikabkot=$idProvinsi"));

      var data = json.decode(response.body)['value'] as List;

      if (response.statusCode == 200) {
        return data.map((e) => KabkotModel.fromJson(e)).toList();
      }

      return [];
    } catch (e) {
      return [];
    }
  }

  Future<List<KecamatanModel>> getKecamatan(String idKabkota) async {
    try {
      var response = await http.get(Uri.parse("$apikecamatan=$idKabkota"));

      var data = json.decode(response.body)['value'] as List;

      if (response.statusCode == 200) {
        return data.map((e) => KecamatanModel.fromJson(e)).toList();
      }

      return [];
    } catch (e) {
      return [];
    }
  }

  Future<List<KelurahanModel>> getKelurahan(String idKecamatan) async {
    try {
      var response = await http.get(Uri.parse("$apikelurahan=$idKecamatan"));

      var data = json.decode(response.body)['value'] as List;

      if (response.statusCode == 200) {
        return data.map((e) => KelurahanModel.fromJson(e)).toList();
      }

      return [];
    } catch (e) {
      return [];
    }
  }
}
