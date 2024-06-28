import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:fyptemp/Main_Camera.dart';
import 'package:fyptemp/Main_file/main_home.dart';
import 'package:fyptemp/Main_file/main_settings.dart';

class MangoiMainScreen extends StatefulWidget {
  const MangoiMainScreen({Key? key}) : super(key: key);

  @override
  State<MangoiMainScreen> createState() => _MangoiMainScreenState();
}

class _MangoiMainScreenState extends State<MangoiMainScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    MainHome(),
    MainCamera(),
    MainSettings(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: _pages[_currentIndex],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.black,
        color: Color(0xffffc107),
        animationDuration: Duration(milliseconds: 400),
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          Icon(Icons.home, color: Colors.white,),
          Icon(Icons.camera_alt_sharp, color: Colors.white,),
          Icon(Icons.settings, color: Colors.white,),
        ],
      ),
    );
  }
}