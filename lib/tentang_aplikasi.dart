import 'package:flutter/material.dart';
import 'package:flutter_etuku/main.dart';

void main(List<String> args) {
  runApp(new MaterialApp(
    home: MyApp_info(),
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      fontFamily: 'Inter',
    ),
  ));
}

class MyApp_info extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp_info> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text(
          "Tentang e-Tuku",
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.w600, fontFamily: 'Inter'),
        ),
        backgroundColor: Color(0xFF6777EF),
        leading: IconButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return MyApp();
            }));
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      backgroundColor: Color(0xFFF5F5F5),
      body: Center(
        child: Container(
          margin: EdgeInsets.only(left: 44, bottom: 200, right: 44),
          width: 302,
          height: 252,
          child: Text(
            'e-TUKU (Telusuri Harga Komoditas Kotaku), merupakan aplikasi milik TPID (Tim Pengendali Inflasi Daerah) Kota Cirebon yang memberikan informasi harga berbagai komoditas yang ada di seluruh pasar tradisional di Kota Cirebon.\n\nAplikasi ini diharapkan berguna bagi masyarakat Kota Cirebon yang membutuhkan informasi harga komoditas sekaligus sebagai salah satu alat monitoring bagi TPID Kota Cirebon dalam mengendalikan inflasi daerah di Kota Cirebon.\n\nSumber data pada aplikasi ini didukung oleh pengelola pasar dibawah pengawasan Perusahaan Umum Daerah Pasar Berintan.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12),
          ),
        ),
      ),
    );
  }
}
