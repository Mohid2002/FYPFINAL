import 'package:flutter/material.dart';

class TOC extends StatefulWidget {
  const TOC({Key? key});

  @override
  State<TOC> createState() => _TOCState();
}

class _TOCState extends State<TOC> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Color(0xffffc107),
        automaticallyImplyLeading: false,
        title: Center(
          child: Text(
            'Terms and Conditions',
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
            _buildTermsPoint(
              boldHeading: '1) User Eligibility:',
              content:
              'You must be at least 18 years old or have the consent of a legal guardian to use OrcharSenseX. By using the app, you confirm that you meet these eligibility requirements.',
            ),
            _buildTermsPoint(
              boldHeading: '2) License and Restrictions:',
              content:
              'OrcharSenseX grants you a limited, non-exclusive, non-transferable, and revocable license to use the app for personal, non-commercial purposes. You agree not to modify, reverse engineer, or attempt to gain unauthorized access to the app.',
            ),
            _buildTermsPoint(
              boldHeading: '3) User Content:',
              content:
              'Users may generate or contribute content within the app. By doing so, you grant OrcharSenseX a worldwide, royalty-free, and non-exclusive license to use, reproduce, modify, adapt, publish, translate, and distribute your content.',
            ),
            _buildTermsPoint(
              boldHeading: '4) Privacy Policy:',
              content:
              'Our Privacy Policy outlines the collection, use, and protection of your personal information. By using OrcharSenseX, you acknowledge and agree to the terms outlined in our Privacy Policy.',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTermsPoint({required String boldHeading, required String content}) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.0),
      child: Column(
        children: [
          Text(
            boldHeading,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.left,
          ),
          SizedBox(height: 10),
          Text(
            content,
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
    );
  }
}
