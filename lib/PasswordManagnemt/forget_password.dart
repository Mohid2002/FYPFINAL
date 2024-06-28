import 'package:flutter/material.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Center(
              child: Image(
                image: AssetImage('assets/lock.png'),
                // height: 500,
                // width: 300,
              ),
            ),
          ),
          SizedBox(height: 10),
          Center(
            child: Text('Forgot',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'ArchivoBlack',
                fontSize: 50,
              ),
            ),
          ),
          Center(
            child: Text('Password',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'ArchivoBlack',
                fontSize: 50,
              ),
            ),
          ),
          Center(
            child: Text('Provide your Account E-mail that you want',
              style: TextStyle(
                color: Color(0xfffcb404),
                fontSize: 20,
              ),
            ),
          ),
          SizedBox(height: 5),
          Center(
            child: Text('to reset your Password',
              style: TextStyle(
                color: Color(0xfffcb404),
                fontSize: 20,
              ),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 3,right: 3),
            child: TextField(
              obscureText: false,
              style: TextStyle(
                color: Colors.white,
              ),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20)
                ),
                prefixIcon: Icon(Icons.alternate_email,color: Colors.white.withOpacity(.3),),
                hintText: 'Enter Email/Username',
                hintStyle: TextStyle(color: Colors.white.withOpacity(.7)),
              ),
            ),
          ),
          SizedBox(height: 10),
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
                  'Forgot Password',
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

    );
  }
}
