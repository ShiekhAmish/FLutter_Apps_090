import 'package:amish_090_mid_term_app/View  Screens/PasswordsList.dart';
import 'package:flutter/material.dart';
import 'package:amish_090_mid_term_app/View  Screens/Update.dart';
import 'package:random_password_generator/random_password_generator.dart';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class Simple extends StatefulWidget {


  @override
  _SimpleState createState() => _SimpleState();
}

class _SimpleState extends State<Simple> {

  bool _isWithLetters = true;
  bool _isWithUppercase = false;
  bool _isWithNumbers = false;
  bool _isWithSpecial = false;
  double _numberCharPassword = 4;
  String newPassword = '';
  String newPassword1 = '';
  String newPassword2 = '';
  Color _color = Colors.blue;
  String isOk = '';

double _passwordChars=4;
  double _passwordDigits=4;
  final password = RandomPasswordGenerator();
  static const MaxNumericDigits = 8;
  static final _random = Random();

  static String getString(int digitCount) {
    final letterUpperCase = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    String s = "";
    for (var i = 0; i < digitCount; i++) {
      s += _random.nextInt(10).toString();
    }
    return s;
  }
  final _formKey = GlobalKey<FormState>();

  var name = "";
  var pass = "";

  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final nameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    nameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  clearText() {
    nameController.clear();
    passwordController.clear();
  }

  // Adding Student
  // CollectionReference students =
  // FirebaseFirestore.instance.collection('students');
  CollectionReference students =
  FirebaseFirestore.instance.collection('students');
  Future<void> addUser() {
    return students
        .add({'name': name, 'pass': pass})
        .then((value) => print('User Added'))
        .catchError((error) => print('Failed to Add user: $error'));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Simple Password Generator'),
        ),
        body: Form(
          key: _formKey,
          child: Center(

                child: ListView(
                  children: [
                     Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),

                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: TextField(
                            controller: nameController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0),
                                borderSide: const BorderSide(),
                              ),
                              filled: true,
                              fillColor: Colors.grey[300],
                              labelText: 'Enter Your Password Hint',
                              labelStyle: const TextStyle(color: Colors.blue),
                            ),
                            keyboardType: TextInputType.text,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: TextField(
                            controller: passwordController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0),
                                borderSide: const BorderSide(),
                              ),
                              filled: true,
                              fillColor: Colors.grey[300],
                              labelText: 'Enter Your Password',
                              labelStyle: const TextStyle(color: Colors.blue),
                            ),
                            keyboardType: TextInputType.text,
                          ),
                        ),


                        const SizedBox(
                          height: 20,
                        ),
                        FlatButton(
                            onPressed: () {


                              newPassword1 = password.randomPassword(
                                  letters: _isWithLetters=true,
                                  numbers: _isWithNumbers=false,
                                  passwordLength: _passwordChars,
                                  specialChar: _isWithSpecial=false,
                                  uppercase: _isWithUppercase=true);
                              newPassword2 = password.randomPassword(
                                  letters: _isWithLetters=false,
                                  numbers: _isWithNumbers=true,
                                  passwordLength:_passwordDigits,
                                  specialChar: _isWithSpecial=false,
                                  uppercase: _isWithUppercase=false);
                              newPassword = newPassword1+ newPassword2;
                              List<String> result = newPassword.split('');
                              result.shuffle();
                              var stringList = result.join("");
                              newPassword=stringList;
                              print(newPassword);
                              double passwordStrength =
                              password.checkPassword(password: newPassword);


                              setState(() {});
                            },
                            child: Container(
                              color: Colors.red,
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  'Generator Password',
                                  style: TextStyle(color: Colors.white, fontSize: 20),
                                ),
                              ),
                            )),
                        const SizedBox(
                          height: 10,
                        ),
                        FlatButton(
                            onPressed: () {
                              if (_formKey.currentState.validate()) {
                                setState(() {
                                  name = nameController.text;
                                  pass = passwordController.text;
                                  addUser();
                                  clearText();
                                });
                              }

                              setState(() {});
                            },
                            child: Container(
                              color: Colors.red,
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  'Save',
                                  style: TextStyle(color: Colors.white, fontSize: 20),
                                ),
                              ),
                            )),
                        const SizedBox(
                          height: 10,
                        ),
                        if (newPassword.isNotEmpty)
                          Center(
                              child: SingleChildScrollView(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Hint:',
                                    style: TextStyle(color: _color, fontSize: 25),
                                  ),
                                ),
                              )),
                        if (newPassword.isNotEmpty)
                          Center(
                              child: SingleChildScrollView(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    newPassword,
                                    style: TextStyle(color: _color, fontSize: 25),
                                  ),
                                ),
                              )),
                      ],
                    ),
                  ],
                ),

              ),
        ),
      ),
    );
  }
}
