import 'package:flutter/material.dart';
import 'package:flutter_etuku/komoditas.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'apiservices.dart';
import 'dataclass.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp_daging(),
    ));

class MyApp_daging extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp_daging> {
  Future<List<dynamic>> _fecthDataUsers() async {
    var result = await http.get(Uri.parse(
        'https://restserver.cirebonkota.go.id/etuku/perkomoditas/appkey/8wc4oog48ocow4kso040os0skk4sgc04/id/3'));
    return json.decode(result.body)['data'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Daging, Ikan, & Telur",
            style: new TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return MyApp_komoditas();
              }));
            },
            icon: Icon(Icons.arrow_back_ios),
          ),
          backgroundColor: Color(0xFF6777EF),
        ),
        backgroundColor: Color(0xFFF5F5F5),
        body: Container(
          child: FutureBuilder<List<dynamic>>(
            future: _fecthDataUsers(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List isiData = snapshot.data!;
                return ListView.builder(
                  itemCount: isiData.length,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 2,
                      child: Stack(
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 5),
                            alignment: Alignment.topLeft,
                            child: Text(
                              snapshot.data![index]['komoditas'],
                              style: TextStyle(
                                  fontSize: 14.0, fontWeight: FontWeight.w600),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 20, left: 5),
                            alignment: Alignment.centerLeft,
                            child: Text(
                                'Rp ' + (snapshot.data![index]['harga']),
                                style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF6777EF))),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 25, left: 110),
                            alignment: Alignment.centerLeft,
                            child: Text('/' + (snapshot.data![index]['satuan']),
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFF858585))),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 50, left: 5),
                            alignment: Alignment.centerLeft,
                            child: Text((snapshot.data![index]['tanggal']),
                                style: TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w300,
                                    color: Color(0xFF858585))),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 10, right: 5),
                            alignment: Alignment.topRight,
                            child: Text((snapshot.data![index]['status']),
                                style: TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF858585))),
                          ),
                          Container(
                            padding: EdgeInsets.only(right: 5),
                            alignment: Alignment.topRight,
                            child: Text('Status:',
                                style: TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF6777EF))),
                          ),
                        ],
                      ),
                    );
                  },
                );
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }

              return Center(
                child: const CircularProgressIndicator(),
              );
            },
          ),
        ));
  }
}
