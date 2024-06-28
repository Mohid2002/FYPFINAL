import 'package:flutter/material.dart';
import 'package:fyptemp/GeneralManagnment/Natyfication.dart';
import '../SupportManagnmet/HelpCenter.dart';
import '../GeneralManagnment/Privacy&Security.dart';
import '../GeneralManagnment/Profile_Screen.dart';
import '../SupportManagnmet/TOC.dart';
import '../SupportManagnmet/about_app.dart';

class MainSettings extends StatefulWidget {
  const MainSettings({Key? key}) : super(key: key);

  @override
  State<MainSettings> createState() => _MainSettingsState();
}

class _MainSettingsState extends State<MainSettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: _appBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          _sectionHeader('General'),
          SizedBox(height: 10),
          _settingsItem('My Account', Icons.account_circle),
          _settingsItem('Notifications', Icons.notifications),
          _settingsItem('Settings & Privacy', Icons.privacy_tip_outlined),
          SizedBox(height: 5),
          _sectionHeader('Support'),
          _supportItem('About this app'),
          _supportItem('Terms and Conditions'),
          _supportItem('Help Center'),
        ],
      ),
    );
  }

  Widget _sectionHeader(String title) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontSize: 28,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _settingsItem(String title, IconData icon) {
    return InkWell(
      onTap: () {
        switch (title) {
          case 'My Account':
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => MyProfile()),
            );
            break;
          case 'Notifications':
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => Notify()),
            );
            break;
          case 'Settings & Privacy':
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => PrivacySecurity()),
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

  Widget _supportItem(String title) {
    return InkWell(
      onTap: () {
        switch (title) {
          case 'About this app':
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => AboutApp()),
            );
            break;
          case 'Terms and Conditions':
            Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => TOC()),
            );
            break;
          case 'Help Center':
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => HelpMenu()),
            );
            break;
        }
      },

      child: Padding(
        padding: const EdgeInsets.only(left: 7, right: 7),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          margin: EdgeInsets.symmetric(vertical: 0),
          decoration: BoxDecoration(
            color: Colors.grey[900],
            borderRadius: BorderRadius.circular(2),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(width: 16),
                  Text(
                    title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _appBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(110),
      child: Container(
        decoration: _boxxDecoration(),
        child: const Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.black,
                    child: Icon(
                      Icons.person,
                      size: 60,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 16),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'John Doe',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'johndoe@gmail.com',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  BoxDecoration _boxxDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.vertical(bottom: Radius.circular(50)),
      color: Color(0xffffc107),
    );
  }
}