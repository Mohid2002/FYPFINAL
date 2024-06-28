import 'package:flutter/material.dart';

import 'forget_password.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
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
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTermsPoint(
              boldHeading: 'ChangePassword',
              content:
              'When creating a password for Instagram or any other online platform, ensure it is a strong combination of at least 8 characters, including uppercase and lowercase letters, numbers, and special characters. Avoid common patterns, personal information, and dictionary words. Consider using a passphrase or a combination of unrelated words for added security. Regularly update your password, enable two-factor authentication if possible, and never use the same password across multiple accounts.',
            ),
        
            Padding(
              padding: const EdgeInsets.only(left: 3, right: 3),
              child: TextFormField(
                //controller: passwordController,
                onChanged: (value) {},
                obscureText: true,
                style: TextStyle(
                  color: Colors.white,
                ),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  prefixIcon: Icon(
                    Icons.lock_outline_rounded,
                    color: Colors.white.withOpacity(.3),
                  ),
                  hintText: 'Current password',
                  hintStyle: TextStyle(color: Colors.white.withOpacity(.7)),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(left: 3, right: 3),
              child: TextFormField(
                //controller: passwordController,
                onChanged: (value) {},
                obscureText: true,
                style: TextStyle(
                  color: Colors.white,
                ),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  prefixIcon: Icon(
                    Icons.lock_outline_rounded,
                    color: Colors.white.withOpacity(.3),
                  ),
                  hintText: 'New password',
                  hintStyle: TextStyle(color: Colors.white.withOpacity(.7)),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(left: 3, right: 3),
              child: TextFormField(
                //controller: passwordController,
                onChanged: (value) {},
                obscureText: true,
                style: TextStyle(
                  color: Colors.white,
                ),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  prefixIcon: Icon(
                    Icons.lock_outline_rounded,
                    color: Colors.white.withOpacity(.3),
                  ),
                  hintText: 'Re-type new password',
                  hintStyle: TextStyle(color: Colors.white.withOpacity(.7)),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
            ),
            SizedBox(height: 15),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ForgetPassword()),
                );
              },
              child: Center(
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Forgot Password?',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      TextSpan(
                        text: ' Reset Here',
                        style: TextStyle(
                          color: Color(0xffffc107),
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(
                  left: 40,right: 40, top: 20, bottom: 20),
              child: Container(
                height: 50,
                width: 340,
                decoration: BoxDecoration(
                  color: Color(0xfffcb404),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: const Center(
                  child: Text(
                    'Change Password',
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Rubik Regular',
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
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
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.left,
        ),
        SizedBox(height: 10),
        Text(
          content,
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
            letterSpacing: 1,
            height: 1.2,
          ),
          textAlign: TextAlign.justify,
        ),
      ],
    ),
  );
}
