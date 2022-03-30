String url = "https://api.binderbyte.com/wilayah";

String key = "api_key=GET_KEY_IN_BINDER_BYTE";

String apiprovinsi = "$url/provinsi?$key";

String apikabkot = "$url/kabupaten?$key&id_provinsi";

String apikecamatan = "$url/kecamatan?$key&id_kabupaten";

String apikelurahan = "$url/kelurahan?$key&id_kecamatan";
