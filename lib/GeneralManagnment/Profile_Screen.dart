import 'package:flutter/material.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Color(0xffffc107),
        automaticallyImplyLeading: false,
        title: Center(
          child: Text(
            'User Profile',
            style: TextStyle(
              color: Colors.black,
              fontSize: 25,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            SizedBox(height: 40),
            Center(
              child: Container(
                height: 130,
                width: 130,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.asset(
                    'assets/mg1.png',
                  fit: BoxFit.cover,
                  ),
                ),
              ),
            ),

            _Data(title: 'Username',name: 'Mohid',icondata: Icons.person_outline,),
            _Data(title: 'Phone',name: '6969696969',icondata: Icons.phone,),
            _Data(title: 'Email',name: 'sawan69@gmail.vom',icondata: Icons.email_rounded,),
          ],
        ),
      ),
    );
  }
}

class _Data extends StatelessWidget {
  final String title, name;
  final IconData icondata;

  const _Data({Key? key, required this.title, required this.name, required this.icondata}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        children: [
          ListTile(
            title: Text(title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            trailing: Text(name,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            leading: Icon(icondata,
              color: Colors.white,
              size: 24,
            ),
          ),
        ],
      ),
    );
  }
}


