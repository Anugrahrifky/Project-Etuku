// menjalankan data yng dibutuhkan, GET, POST, dll//
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'dataclass.dart';

class Service {
  Future<List<cData>> getAllData() async {
    final response = await http.get(Uri.parse(
      'https://restserver.cirebonkota.go.id/etuku/perkomoditas/appkey/8wc4oog48ocow4kso040os0skk4sgc04/id/2',
    ));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body)['data'];
      return jsonResponse.map((data) => cData.fromJson(data)).toList();
    } else {
      throw Exception('failed to load data');
    }
  }
}
