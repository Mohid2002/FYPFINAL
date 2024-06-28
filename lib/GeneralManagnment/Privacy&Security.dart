import 'package:flutter/material.dart';
import '../PasswordManagnemt/Change_Password.dart';
import 'Profile_Screen.dart';

class PrivacySecurity extends StatefulWidget {
  const PrivacySecurity({Key? key});

  @override
  State<PrivacySecurity> createState() => _PrivacySecurityState();
}

class _PrivacySecurityState extends State<PrivacySecurity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Color(0xffffc107),
        automaticallyImplyLeading: false,
        title: Center(
          child: Text(
            'Settings and Privacy',
            style: TextStyle(
              color: Colors.black,
              fontSize: 25,
            ),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 30),
          _settingsItem(context, 'Password and Security', Icons.lock_clock_rounded),
          _settingsItem(context, 'My Account', Icons.lock_clock_rounded),
        ],
      ),
    );
  }
}

Widget _settingsItem(BuildContext context, String title, IconData icon) {
  return InkWell(
    onTap: () {
      switch (title) {
        case 'Password and Security':
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => ChangePassword()),
          );
          break;

        case 'My Account':
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => MyProfile()),
          );
          break;
      }
    },
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      margin: EdgeInsets.symmetric(vertical: 5),
      color: Colors.grey[900],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                icon,
                color: Colors.white,
                size: 24,
              ),
              SizedBox(width: 16),
              Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ],
          ),
          Icon(
            Icons.arrow_forward_ios,
            color: Colors.white,
          ),
        ],
      ),
    ),
  );
}
