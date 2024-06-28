import 'package:flutter/material.dart';

class HelpMenu extends StatefulWidget {
  const HelpMenu({super.key});

  @override
  State<HelpMenu> createState() => _HelpMenuState();
}

class _HelpMenuState extends State<HelpMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Color(0xffffc107),
        automaticallyImplyLeading: false,
        title: Center(
          child: Text(
            'Help Center',
            style: TextStyle(
              color: Colors.black,
              fontSize: 25,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'For Any Kind of Query Contact:- muhammadmohid2110@gmail.com',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                letterSpacing: 1,
                height: 1.5,
              ),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}
