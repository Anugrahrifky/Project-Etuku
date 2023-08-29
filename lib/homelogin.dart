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
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePagel(title: 'Flutter Demo Home Page'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePagel extends StatefulWidget {
  const MyHomePagel({super.key, required this.title});

  final String title;

  @override
  State<MyHomePagel> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePagel> {
  int _counter = 0;
  int _pilihanbottom = 0;
  final List<Widget> _children = [
    MyApp_home(),
    MyApp_komoditas(),
    MyApp_info(),
    MyApp_akun(),
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
              label: "Akun", icon: Icon(Icons.person_2_outlined)),
        ],
        onTap: _onItemTapped,
      ),
    );
  }
}
