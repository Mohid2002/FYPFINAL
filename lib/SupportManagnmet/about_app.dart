import 'package:flutter/material.dart';

class AboutApp extends StatefulWidget {
  const AboutApp({super.key});

  @override
  State<AboutApp> createState() => _AboutAppState();
}

class _AboutAppState extends State<AboutApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Color(0xffffc107),
        automaticallyImplyLeading: false,
        title: Center(
          child: Text(
            'About Us',
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
              'The BSCS Final Project, titled "Orchard SenseX - Mango Disease Detection Using Image Processing and ML," is a comprehensive initiative aimed at addressing mango disease issues prevalent in Pakistan. The project utilizes advanced Machine Learning (ML) techniques, including Support Vector Machines (SVM), K-MEANS, and Convolutional Neural Networks (CNN), coupled with a mobile app.',
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
