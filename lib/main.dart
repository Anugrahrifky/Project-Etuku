import 'package:flutter/material.dart';
import 'package:flutter_etuku/tentang_aplikasi.dart';
import 'package:flutter_etuku/akun.dart';
import 'package:flutter_etuku/komoditas.dart';
import 'package:flutter_etuku/homepage.dart';
import 'package:flutter_etuku/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'e-Tuku',
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Inter'),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int _pilihanbottom = 0;
  final List<Widget> _children = [
    MyApp_home(),
    MyApp_komoditas(),
    MyApp_info(),
    MyApp_login(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _pilihanbottom = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _children.elementAt(_pilihanbottom),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _pilihanbottom,
        selectedItemColor: Color(0xFF6777EF),
        items: [
          BottomNavigationBarItem(
            label: "Home",
            icon: Icon(
              Icons.home_outlined,
            ),
          ),
          BottomNavigationBarItem(
            label: "Komoditas",
            icon: Icon(
              Icons.shopping_bag_outlined,
            ),
          ),
          BottomNavigationBarItem(
              label: "Info", icon: Icon(Icons.info_outline)),
          BottomNavigationBarItem(
              label: "Login", icon: Icon(Icons.person_2_outlined)),
        ],
        onTap: _onItemTapped,
      ),
    );
  }
}
