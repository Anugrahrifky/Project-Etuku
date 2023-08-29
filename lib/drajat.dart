import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_etuku/tentang_aplikasi.dart';
import 'package:flutter_etuku/akun.dart';
import 'package:flutter_etuku/komoditas.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'apiservices.dart';
import 'dataclass.dart';
import 'package:flutter_etuku/perumnas.dart';
import 'package:flutter_etuku/jagasatru.dart';
import 'package:flutter_etuku/Kanoman.dart';
import 'package:flutter_etuku/perumnas.dart';
import 'package:flutter_etuku/main.dart';

void main(List<String> args) {
  runApp(new MaterialApp(
    home: MyApp_drajat(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp_drajat extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp_drajat> {
  var tgl = DateFormat("EEEEE, dd MMMM yyyy").format(DateTime.now());
  @override
  String? SelectedValue;

  Future<List<dynamic>> _fecthDataUsers() async {
    var result = await http.get(Uri.parse(
        'https://restserver.cirebonkota.go.id/etuku/perkomoditas/appkey/8wc4oog48ocow4kso040os0skk4sgc04/id/1'));
    return json.decode(result.body)['data'];
  }

  Widget build(BuildContext context) {
    SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      body: Center(
        child: FutureBuilder<List<dynamic>?>(
            future: _fecthDataUsers(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return Stack(
                      children: [
                        Stack(
                          children: [
                            Container(
                              alignment: Alignment.topCenter,
                              child: Image.asset(
                                'images/output.png',
                                color: Color(0xFF6777EF).withOpacity(0.7),
                                colorBlendMode: BlendMode.modulate,
                                height: 162,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 204, left: 28),
                              child: Text(
                                'harga komoditas di:',
                                style: TextStyle(
                                    fontWeight: FontWeight.w300, fontSize: 12),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 226, left: 28),
                              child: Text(
                                'Pasar Drajat',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 20),
                              ),
                            ),
                            Container(
                                padding: EdgeInsets.only(
                                    top: 134, left: 47, right: 47),
                                alignment: Alignment.topCenter,
                                child: DropdownButtonFormField<String?>(
                                    decoration: InputDecoration(
                                        labelText: 'Pilih Pasar',
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Colors.white,
                                              width: 2,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0)),
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.black, width: 2),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        filled: true,
                                        fillColor: Colors.white),
                                    dropdownColor: Colors.white,
                                    value: SelectedValue,
                                    onChanged: (value) {
                                      if (value != SelectedValue) {
                                        switch (value) {
                                          case 'Pasar Jagasatru':
                                            Navigator.push(context,
                                                MaterialPageRoute(
                                                    builder: (context) {
                                              return MyApp_jagasatru();
                                            }));
                                            break;
                                          case 'Pasar Kanoman':
                                            Navigator.push(context,
                                                MaterialPageRoute(
                                                    builder: (context) {
                                              return MyApp_kanoman();
                                            }));
                                            break;
                                          case 'Pasar Perumnas':
                                            Navigator.push(context,
                                                MaterialPageRoute(
                                                    builder: (context) {
                                              return MyApp_perumnas();
                                            }));
                                            break;
                                        }
                                      }
                                      setState(() {
                                        SelectedValue = value;
                                      });
                                    },
                                    items: [
                                      "Pasar Kanoman",
                                      "Pasar Jagasatru",
                                      "Pasar Drajat",
                                      "Pasar Perumnas"
                                    ]
                                        .map<DropdownMenuItem<String?>>(
                                            (e) => DropdownMenuItem(
                                                  child: Text(e.toString()),
                                                  value: e,
                                                ))
                                        .toList())),
                            Container(
                                padding: EdgeInsets.only(top: 106),
                                alignment: Alignment.topCenter,
                                child: Text(
                                  '' + tgl.toString(),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12.0),
                                )),
                            Container(
                              child: IconButton(
                                  onPressed: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return MyApp();
                                    }));
                                  },
                                  icon: Icon(
                                    Icons.home_outlined,
                                    color: Colors.white,
                                  )),
                            ),
                            Container(
                                padding: EdgeInsets.only(top: 16, left: 40),
                                child: Text(
                                  'Back to home',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600),
                                )),
                            Padding(
                                padding: EdgeInsets.only(top: 278),
                                child: Column(
                                  children: [
                                    Container(
                                      width: double.infinity,
                                      height: 36,
                                      alignment: Alignment.center,
                                      color: Color(0xFF6777EF),
                                    ),
                                  ],
                                )),
                            Padding(
                              padding: EdgeInsets.only(top: 278),
                              child: Container(
                                width: double.infinity,
                                height: 36,
                                alignment: Alignment.center,
                                child: Text('Tepung & Beras',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600)),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 326, left: 13.5),
                              child: Row(
                                children: [
                                  Container(
                                    width: 115,
                                    height: 106,
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      elevation: 5,
                                      margin: EdgeInsets.only(right: 9),
                                      child: Stack(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.only(
                                                top: 14, left: 17),
                                            child: Text(
                                              snapshot.data![18]['komoditas'],
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.only(top: 10),
                                            alignment: Alignment.center,
                                            child: Text(
                                              'Rp ' +
                                                  snapshot.data![18]['harga'],
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w700,
                                                  color: Color(0xFF6777EF)),
                                            ),
                                          ),
                                          Container(
                                            padding:
                                                EdgeInsets.only(bottom: 17.88),
                                            alignment: Alignment.bottomCenter,
                                            child: Text(
                                              snapshot.data![18]['tanggal'],
                                              style: TextStyle(
                                                  fontSize: 8,
                                                  fontWeight: FontWeight.w700,
                                                  color: Color(0xFF858585)),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 115,
                                    height: 106,
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      elevation: 5,
                                      margin:
                                          EdgeInsets.only(right: 9, left: 9),
                                      child: Stack(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.only(top: 14),
                                            child: Text(
                                              snapshot.data![26]['komoditas'],
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.only(top: 10),
                                            alignment: Alignment.center,
                                            child: Text(
                                              'Rp ' +
                                                  snapshot.data![26]['harga'],
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w700,
                                                  color: Color(0xFF6777EF)),
                                            ),
                                          ),
                                          Container(
                                            padding:
                                                EdgeInsets.only(bottom: 17.88),
                                            alignment: Alignment.bottomCenter,
                                            child: Text(
                                              snapshot.data![26]['tanggal'],
                                              style: TextStyle(
                                                  fontSize: 8,
                                                  fontWeight: FontWeight.w700,
                                                  color: Color(0xFF858585)),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 115,
                                    height: 106,
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      elevation: 5,
                                      margin:
                                          EdgeInsets.only(right: 9, left: 9),
                                      child: Stack(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.only(
                                                top: 14, left: 10),
                                            child: Text(
                                              snapshot.data![62]['komoditas'],
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.only(top: 10),
                                            alignment: Alignment.center,
                                            child: Text(
                                              'Rp ' +
                                                  snapshot.data![62]['harga'],
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w700,
                                                  color: Color(0xFF6777EF)),
                                            ),
                                          ),
                                          Container(
                                            padding:
                                                EdgeInsets.only(bottom: 17.88),
                                            alignment: Alignment.bottomCenter,
                                            child: Text(
                                              snapshot.data![62]['tanggal'],
                                              style: TextStyle(
                                                  fontSize: 8,
                                                  fontWeight: FontWeight.w700,
                                                  color: Color(0xFF858585)),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                                padding: EdgeInsets.only(top: 455),
                                child: Column(
                                  children: [
                                    Container(
                                      width: double.infinity,
                                      height: 36,
                                      alignment: Alignment.center,
                                      color: Color(0xFF6777EF),
                                    ),
                                  ],
                                )),
                            Padding(
                              padding: EdgeInsets.only(top: 455),
                              child: Container(
                                width: double.infinity,
                                height: 36,
                                alignment: Alignment.center,
                                child: Text('Sayur & Buah',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600)),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 503, left: 13.5),
                              child: Row(
                                children: [
                                  Container(
                                    width: 115,
                                    height: 106,
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      elevation: 5,
                                      margin: EdgeInsets.only(right: 9),
                                      child: Stack(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.only(
                                                top: 14, left: 23),
                                            child: Text(
                                              'Cabe Merah',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.only(top: 10),
                                            alignment: Alignment.center,
                                            child: Text(
                                              'Rp 60.000',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w700,
                                                  color: Color(0xFF6777EF)),
                                            ),
                                          ),
                                          Container(
                                            padding:
                                                EdgeInsets.only(bottom: 17.88),
                                            alignment: Alignment.bottomCenter,
                                            child: Text(
                                              '14-02-2020',
                                              style: TextStyle(
                                                  fontSize: 8,
                                                  fontWeight: FontWeight.w700,
                                                  color: Color(0xFF858585)),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 115,
                                    height: 106,
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      elevation: 5,
                                      margin:
                                          EdgeInsets.only(right: 9, left: 9),
                                      child: Stack(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.only(
                                                top: 14, left: 18),
                                            child: Text(
                                              'Cabe Merah',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.only(top: 10),
                                            alignment: Alignment.center,
                                            child: Text(
                                              'Rp 50.000',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w700,
                                                  color: Color(0xFF6777EF)),
                                            ),
                                          ),
                                          Container(
                                            padding:
                                                EdgeInsets.only(bottom: 17.88),
                                            alignment: Alignment.bottomCenter,
                                            child: Text(
                                              '14-02-2020',
                                              style: TextStyle(
                                                  fontSize: 8,
                                                  fontWeight: FontWeight.w700,
                                                  color: Color(0xFF858585)),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 115,
                                    height: 106,
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      elevation: 5,
                                      margin:
                                          EdgeInsets.only(right: 9, left: 9),
                                      child: Stack(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.only(
                                                top: 14, left: 30),
                                            child: Text(
                                              'Pisang',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.only(top: 10),
                                            alignment: Alignment.center,
                                            child: Text(
                                              'Rp 15.000',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w700,
                                                  color: Color(0xFF6777EF)),
                                            ),
                                          ),
                                          Container(
                                            padding:
                                                EdgeInsets.only(bottom: 17.88),
                                            alignment: Alignment.bottomCenter,
                                            child: Text(
                                              '16-08-2023',
                                              style: TextStyle(
                                                  fontSize: 8,
                                                  fontWeight: FontWeight.w700,
                                                  color: Color(0xFF858585)),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                                padding: EdgeInsets.only(top: 633),
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.vertical,
                                  child: Column(
                                    children: [
                                      Container(
                                        width: double.infinity,
                                        height: 36,
                                        alignment: Alignment.center,
                                        color: Color(0xFF6777EF),
                                      ),
                                    ],
                                  ),
                                )),
                            Padding(
                              padding: EdgeInsets.only(top: 633),
                              child: Container(
                                width: double.infinity,
                                height: 36,
                                alignment: Alignment.center,
                                child: Text('Daging, Ikan & Telur',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600)),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 681, left: 13.5),
                              child: Row(
                                children: [
                                  Container(
                                    width: 115,
                                    height: 106,
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      elevation: 5,
                                      margin: EdgeInsets.only(right: 9),
                                      child: Stack(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.only(top: 14),
                                            child: Text(
                                              'Daging Ayam Kampung',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.only(top: 10),
                                            alignment: Alignment.center,
                                            child: Text(
                                              'Rp 75.000',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w700,
                                                  color: Color(0xFF6777EF)),
                                            ),
                                          ),
                                          Container(
                                            padding:
                                                EdgeInsets.only(bottom: 17.88),
                                            alignment: Alignment.bottomCenter,
                                            child: Text(
                                              '16-08-2023',
                                              style: TextStyle(
                                                  fontSize: 8,
                                                  fontWeight: FontWeight.w700,
                                                  color: Color(0xFF858585)),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 115,
                                    height: 106,
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      elevation: 5,
                                      margin:
                                          EdgeInsets.only(right: 9, left: 9),
                                      child: Stack(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.only(top: 14),
                                            child: Text(
                                              'Telur Ayam Kampung',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.only(top: 10),
                                            alignment: Alignment.center,
                                            child: Text(
                                              'Rp 45.000',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w700,
                                                  color: Color(0xFF6777EF)),
                                            ),
                                          ),
                                          Container(
                                            padding:
                                                EdgeInsets.only(bottom: 17.88),
                                            alignment: Alignment.bottomCenter,
                                            child: Text(
                                              '16-08-2023',
                                              style: TextStyle(
                                                  fontSize: 8,
                                                  fontWeight: FontWeight.w700,
                                                  color: Color(0xFF858585)),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 115,
                                    height: 106,
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      elevation: 5,
                                      margin:
                                          EdgeInsets.only(right: 9, left: 9),
                                      child: Stack(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.only(
                                                top: 14, left: 13),
                                            child: Text(
                                              'Ikan Kembung',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.only(top: 10),
                                            alignment: Alignment.center,
                                            child: Text(
                                              'Rp 35.000',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w700,
                                                  color: Color(0xFF6777EF)),
                                            ),
                                          ),
                                          Container(
                                            padding:
                                                EdgeInsets.only(bottom: 17.88),
                                            alignment: Alignment.bottomCenter,
                                            child: Text(
                                              '14-08-2023',
                                              style: TextStyle(
                                                  fontSize: 8,
                                                  fontWeight: FontWeight.w700,
                                                  color: Color(0xFF858585)),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                                padding: EdgeInsets.only(top: 813),
                                child: Column(
                                  children: [
                                    Container(
                                      width: double.infinity,
                                      height: 36,
                                      alignment: Alignment.center,
                                      color: Color(0xFF6777EF),
                                    ),
                                  ],
                                )),
                            Padding(
                              padding: EdgeInsets.only(top: 813),
                              child: Container(
                                width: double.infinity,
                                height: 36,
                                alignment: Alignment.center,
                                child: Text('Lain-lain',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600)),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 865, left: 13.5),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(bottom: 5),
                                      width: 115,
                                      height: 106,
                                      child: Card(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        elevation: 5,
                                        margin: EdgeInsets.only(right: 9),
                                        child: Stack(
                                          children: [
                                            Container(
                                              padding: EdgeInsets.only(
                                                  top: 14, left: 23),
                                              child: Text(
                                                'Mie Instan',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontSize: 11,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            ),
                                            Container(
                                              padding: EdgeInsets.only(top: 10),
                                              alignment: Alignment.center,
                                              child: Text(
                                                'Rp 2.500',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w700,
                                                    color: Color(0xFF6777EF)),
                                              ),
                                            ),
                                            Container(
                                              padding: EdgeInsets.only(
                                                  bottom: 17.88),
                                              alignment: Alignment.bottomCenter,
                                              child: Text(
                                                '14-02-2020',
                                                style: TextStyle(
                                                    fontSize: 8,
                                                    fontWeight: FontWeight.w700,
                                                    color: Color(0xFF858585)),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(bottom: 5),
                                      width: 115,
                                      height: 106,
                                      child: Card(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        elevation: 5,
                                        margin:
                                            EdgeInsets.only(right: 9, left: 9),
                                        child: Stack(
                                          children: [
                                            Container(
                                              padding: EdgeInsets.only(
                                                  top: 14, left: 23),
                                              child: Text(
                                                'Mie Instan',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontSize: 11,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            ),
                                            Container(
                                              padding: EdgeInsets.only(top: 10),
                                              alignment: Alignment.center,
                                              child: Text(
                                                'Rp 3.000',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w700,
                                                    color: Color(0xFF6777EF)),
                                              ),
                                            ),
                                            Container(
                                              padding: EdgeInsets.only(
                                                  bottom: 17.88),
                                              alignment: Alignment.bottomCenter,
                                              child: Text(
                                                '24-07-2023',
                                                style: TextStyle(
                                                    fontSize: 8,
                                                    fontWeight: FontWeight.w700,
                                                    color: Color(0xFF858585)),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(bottom: 5),
                                      width: 115,
                                      height: 106,
                                      child: Card(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        elevation: 5,
                                        margin:
                                            EdgeInsets.only(right: 9, left: 9),
                                        child: Stack(
                                          children: [
                                            Container(
                                              padding: EdgeInsets.only(
                                                  top: 14, left: 30),
                                              child: Text(
                                                'Tempe',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontSize: 11,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            ),
                                            Container(
                                              padding: EdgeInsets.only(top: 10),
                                              alignment: Alignment.center,
                                              child: Text(
                                                'Rp 5.000',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w700,
                                                    color: Color(0xFF6777EF)),
                                              ),
                                            ),
                                            Container(
                                              padding: EdgeInsets.only(
                                                  bottom: 17.88),
                                              alignment: Alignment.bottomCenter,
                                              child: Text(
                                                '24-07-2023',
                                                style: TextStyle(
                                                    fontSize: 8,
                                                    fontWeight: FontWeight.w700,
                                                    color: Color(0xFF858585)),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                                padding: EdgeInsets.only(top: 970),
                                child: Column(
                                  children: [
                                    Container(
                                      width: double.infinity,
                                      height: 25,
                                      alignment: Alignment.center,
                                      color: Color(0xFFF5F5F5),
                                    ),
                                  ],
                                )),
                          ],
                        ),
                      ],
                    );
                  },
                );
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return Center(
                child: const CircularProgressIndicator(),
              );
            }),
      ),
    );
  }
}
