String url = "https://api.binderbyte.com/wilayah";
String key =
    "api_key=6355b79cbc5f79b2d297a6724566c7ca263028ee0074b015b4161a14d7af27e0";

String apiprovinsi = "$url/provinsi?$key";

String apikabkot = "$url/kabupaten?$key&id_provinsi";

String apikecamatan = "$url/kecamatan?$key&id_kabupaten";

String apikelurahan = "$url/kelurahan?$key&id_kecamatan";
