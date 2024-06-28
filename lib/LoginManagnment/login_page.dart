import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:fyptemp/PasswordManagnemt/forget_password.dart';
import 'package:fyptemp/LoginManagnment/sign_up_page.dart';
import '../Main_file/mango_scanner_screen1.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({Key? key}) : super(key: key);

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  Future<void> _login() async {
    final response = await http.post(
      Uri.parse('http://127.0.0.1:8000/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'username': emailController.text,
        'password': passwordController.text,
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print('Login successful: $data');
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MangoiMainScreen()),
      );
    } else {

      print('Failed to login: ${response.body}');
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Login Failed'),
          content: Text('Invalid username or password'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40),
              Image.asset('assets/olaia.png'),
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Text(
                  'Sign In',
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Color(0xffffc107),
                  ),
                ),
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.only(left: 3, right: 3),
                child: TextFormField(
                  controller: emailController,
                  onChanged: (value) {},
                  obscureText: false,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    prefixIcon: Icon(
                      Icons.alternate_email,
                      color: Colors.white.withOpacity(.3),
                    ),
                    hintText: 'Enter Email/Username',
                    hintStyle: TextStyle(color: Colors.white.withOpacity(.7)),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 3, right: 3),
                child: TextFormField(
                  controller: passwordController,
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
                    hintText: 'Password',
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
              SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    _login(); // Perform the login request
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 40, right: 40, top: 20, bottom: 20),
                  child: Container(
                    height: 50,
                    width: 340,
                    decoration: BoxDecoration(
                      color: Color(0xfffcb404),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: const Center(
                      child: Text(
                        'Sign In',
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Rubik Regular',
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
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
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      'OR',
                      style: TextStyle(
                        fontSize: 15,
                        color: Color(0xffffc107),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        height: 45,
                        child: Image.asset('assets/googleicon.png'),
                      ),
                      Text(
                        'Sign In with Google',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignUp()),
                  );
                },
                child: Center(
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'New On OrchardSenseX?',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        TextSpan(
                          text: ' Sign Up',
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
            ],
          ),
        ),
      ),
    );
  }
}
