import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropdown/models/index.dart';
import 'package:flutter_dropdown/services/wilayah_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ProvinsiModel? selectedProv;
  KabkotModel? selectedKabkot;
  KecamatanModel? selectedKec;
  KelurahanModel? selectedKel;

  Future<List<ProvinsiModel>> getProvinsi() async {
    var provinsi = await WilayahService().getProvinsi();
    return provinsi;
  }

  Future<List<KabkotModel>> getKabkot() async {
    if (selectedProv != null) {
      var kabkota = await WilayahService().getKabkot(selectedProv!.id!);
      return kabkota;
    }

    return [];
  }

  Future<List<KecamatanModel>> getKecamatan() async {
    if (selectedKabkot != null) {
      var kecamatan = await WilayahService().getKecamatan(selectedKabkot!.id!);
      return kecamatan;
    }

    return [];
  }

  Future<List<KelurahanModel>> getKelurahan() async {
    if (selectedKec != null) {
      var kelurahan = await WilayahService().getKelurahan(selectedKec!.id!);
      return kelurahan;
    }

    return [];
  }

  // testApi() async {
  //   print('get provinsi');
  //   var prov = await WilayahService().getProvinsi();
  //   inspect(prov);

  //   print('get kabupaten');
  //   var kab = await WilayahService().getKabkot("35");
  //   inspect(kab);

  //   print('get kecamatan');
  //   var kec = await WilayahService().getKecamatan("3578");
  //   inspect(kec);

  //   print('get kelurahan');
  //   var kel = await WilayahService().getKelurahan("357819");
  //   inspect(kel);
  // }

  // @override
  // void initState() {
  //   testApi();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    // provinsi
    Widget provinsi = DropdownSearch<ProvinsiModel>(
      showSearchBox: true,
      validator: (v) => v == null ? "required field" : null,
      dropdownSearchDecoration: const InputDecoration(
        hintText: "Pilih Provinsi",
        contentPadding: EdgeInsets.fromLTRB(12, 12, 0, 0),
        border: OutlineInputBorder(),
      ),
      mode: Mode.DIALOG,
      onFind: (value) async {
        List<ProvinsiModel> provinsi;
        provinsi = await getProvinsi();

        return provinsi;
      },
      popupItemBuilder: (context, item, isSelected) {
        return ListTile(
          title: Text(item.name!),
        );
      },
      dropdownBuilder: (context, item) {
        if (item?.name == null) {
          return const Text('Belum memilih provinsi');
        }
        return Text(item!.name!);
      },
      onChanged: (value) {
        setState(() {
          selectedProv = value;
        });
      },
      clearButtonSplashRadius: 20,
    );

    // kabkot
    Widget kabkot = DropdownSearch<KabkotModel>(
      showSearchBox: true,
      validator: (v) => v == null ? "required field" : null,
      dropdownSearchDecoration: const InputDecoration(
        hintText: "Pilih Kabupaten/Kota",
        contentPadding: EdgeInsets.fromLTRB(12, 12, 0, 0),
        border: OutlineInputBorder(),
      ),
      mode: Mode.DIALOG,
      onFind: (value) async {
        List<KabkotModel> kabkot;
        kabkot = await getKabkot();

        return kabkot;
      },
      popupItemBuilder: (context, item, isSelected) {
        return ListTile(
          title: Text(item.name!),
        );
      },
      dropdownBuilder: (context, item) {
        if (item?.name == null) {
          return const Text('Belum memilih kabupaten/kota');
        }
        return Text(item!.name!);
      },
      onChanged: (value) {
        setState(() {
          selectedKabkot = value;
        });
      },
      clearButtonSplashRadius: 20,
    );

    // kecamatan
    Widget kecamatan = DropdownSearch<KecamatanModel>(
      showSearchBox: true,
      validator: (v) => v == null ? "required field" : null,
      dropdownSearchDecoration: const InputDecoration(
        hintText: "Pilih Kecamatan",
        contentPadding: EdgeInsets.fromLTRB(12, 12, 0, 0),
        border: OutlineInputBorder(),
      ),
      mode: Mode.DIALOG,
      onFind: (value) async {
        List<KecamatanModel> kecamatan;
        kecamatan = await getKecamatan();

        return kecamatan;
      },
      popupItemBuilder: (context, item, isSelected) {
        return ListTile(
          title: Text(item.name!),
        );
      },
      dropdownBuilder: (context, item) {
        if (item?.name == null) {
          return const Text('Belum memilih kecamatan');
        }
        return Text(item!.name!);
      },
      onChanged: (value) {
        setState(() {
          selectedKec = value;
        });
      },
      clearButtonSplashRadius: 20,
    );

    //kelurahan
    Widget kelurahan = DropdownSearch<KelurahanModel>(
      showSearchBox: true,
      validator: (v) => v == null ? "required field" : null,
      dropdownSearchDecoration: const InputDecoration(
        hintText: "Pilih Kelurahan",
        contentPadding: EdgeInsets.fromLTRB(12, 12, 0, 0),
        border: OutlineInputBorder(),
      ),
      mode: Mode.DIALOG,
      onFind: (value) async {
        List<KelurahanModel> kelurahan;
        kelurahan = await getKelurahan();

        return kelurahan;
      },
      popupItemBuilder: (context, item, isSelected) {
        return ListTile(
          title: Text(item.name!),
        );
      },
      dropdownBuilder: (context, item) {
        if (item?.name == null) {
          return const Text('Belum memilih kelurahan');
        }
        return Text(item!.name!);
      },
      onChanged: (value) {
        setState(() {
          selectedKel = value;
        });
      },
      clearButtonSplashRadius: 20,
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text("Wilayah Indonesia"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          provinsi,
          const SizedBox(height: 20),
          kabkot,
          const SizedBox(height: 20),
          kecamatan,
          const SizedBox(height: 20),
          kelurahan
        ],
      ),
    );
  }
}
