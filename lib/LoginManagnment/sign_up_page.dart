import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; // Add this import
import 'dart:convert'; // Add this import

import 'package:fyptemp/LoginManagnment/login_page.dart';
import '../Main_file/mango_scanner_screen1.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController emailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController reenterPasswordController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  String dropdownValue = 'Male';

  Future<void> _signUp() async {
    final response = await http.post(
      Uri.parse('http://127.0.0.1:8000/registration'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': emailController.text,
        'username': usernameController.text,
        'password': passwordController.text,
        'gender': dropdownValue,
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print('Registration successful: $data');
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MangoiMainScreen()),
      );
    } else {
      print('Failed to register: ${response.body}');
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Registration Failed'),
          content: Text('Failed to register. Please try again.'),
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
              Container(
                height: 200,
                width: 500,
                child: Image.asset('assets/signup.png'),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Text(
                  'Sign Up',
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
                    hintText: 'Enter Email',
                    hintStyle: TextStyle(color: Colors.white.withOpacity(.7)),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    // Email validation using regular expression
                    String emailPattern =
                        r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$';
                    RegExp regex = RegExp(emailPattern);
                    if (!regex.hasMatch(value)) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 3, right: 3),
                child: TextFormField(
                  controller: usernameController,
                  onChanged: (value) {
                    //updateSignUpButtonState();
                  },
                  obscureText: false,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    prefixIcon: Icon(
                      Icons.person,
                      color: Colors.white.withOpacity(.3),
                    ),
                    hintText: 'Enter Username',
                    hintStyle: TextStyle(color: Colors.white.withOpacity(.7)),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your username';
                    }
                    // Add username validation logic if needed
                    return null;
                  },
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 3, right: 3),
                child: Container(
                  child: TextFormField(
                    controller: passwordController,
                    onChanged: (value) {
                      //updateSignUpButtonState();
                    },
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
                      hintText: 'Enter Password',
                      hintStyle: TextStyle(color: Colors.white.withOpacity(.7)),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }

                      if (value.length < 5) {
                        return 'Password must be at least 5 characters long';
                      }

                      return null;
                    },
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 3, right: 3),
                child: DropdownButtonFormField<String>(
                  value: dropdownValue,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    prefixIcon: Icon(
                      Icons.person_outline,
                      color: Colors.white.withOpacity(.3),
                    ),
                    hintText: 'Select Gender',
                    hintStyle: TextStyle(color: Colors.white.withOpacity(.7)),
                  ),
                  dropdownColor: Colors.black,
                  icon: Icon(Icons.arrow_drop_down, color: Colors.white.withOpacity(.7)),
                  style: TextStyle(color: Colors.white),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                    });
                  },
                  items: <String>['Male', 'Female']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select your gender';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    _signUp(); // Call the sign up function here
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 40, right: 40, top: 20, bottom: 20),
                  child: Container(
                    height: 50,
                    width: 340,
                    decoration: BoxDecoration(
                      color: Color(0xffffc107),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: const Center(
                      child: Text(
                        'Sign Up',
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
              SizedBox(height: 15),
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
                        'Sign Up with Google',
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
                    MaterialPageRoute(builder: (context) => Loginpage()),
                  );
                },
                child: Center(
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Already Have an Account?',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        TextSpan(
                          text: ' Login',
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
