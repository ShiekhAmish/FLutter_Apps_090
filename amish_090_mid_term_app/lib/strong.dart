import 'package:amish_090_mid_term_app/View  Screens/PasswordsList.dart';
import 'package:flutter/material.dart';
import 'package:amish_090_mid_term_app/View  Screens/Update.dart';
import 'package:random_password_generator/random_password_generator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
class Strong extends StatefulWidget {


  @override
  _StrongState createState() => _StrongState();
}

class _StrongState extends State<Strong> {
  bool _isWithLetters = true;
  bool _isWithUppercase = false;
  bool _isWithNumbers = false;
  bool _isWithSpecial = false;
  double _numberCharPassword = 8;
  String newPassword = '';
  String newPassword1 = '';
  String newPassword2 = '';
  String newPassword3 = '';
  Color _color = Colors.blue;
  String isOk = '';
  final TextEditingController _passwordLength = TextEditingController();
  final TextEditingController _passwordLengthChar = TextEditingController();
  final TextEditingController _passwordLengthDigit = TextEditingController();
  final TextEditingController _passwordLengthSymbol = TextEditingController();
  double _passwordChars = 4;
  double _passwordDigits = 4;
  double _passwordSymbols = 4;
  final password = RandomPasswordGenerator();
  @override
  void initState() {
    super.initState();
  }

  checkBox(String name, Function onTap, bool value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(name),
        Checkbox(value: value, onChanged: onTap),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Strong Password Generator'),
        ),
        body: Center(
          child:ListView(
              children: [
                Column(
                  children: [
                    const SizedBox(
                      height: 3,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        checkBox('Upper Case', (bool value) {
                          _isWithUppercase = value;
                          setState(() {});
                        }, _isWithUppercase),
                        checkBox('Lower Case', (bool value) {
                          _isWithLetters = value;
                          setState(() {});
                        }, _isWithLetters)
                      ],
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        checkBox('Symbols', (bool value) {
                          _isWithSpecial = value;
                          setState(() {});
                        }, _isWithSpecial),
                        checkBox('Numbers', (bool value) {
                          _isWithNumbers = value;
                          setState(() {});
                        }, _isWithNumbers)
                      ],
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextField(

                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                            borderSide: const BorderSide(),
                          ),
                          filled: true,
                          fillColor: Colors.grey[300],
                          labelText: 'Enter Your Name',
                          labelStyle: const TextStyle(color: Colors.blue),
                        ),
                        keyboardType: TextInputType.text,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextField(

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
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextField(
                        controller: _passwordLength,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                            borderSide: const BorderSide(),
                          ),
                          filled: true,
                          fillColor: Colors.grey[300],
                          labelText: 'Enter Length',
                          labelStyle: const TextStyle(color: Colors.blue),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextField(
                        controller: _passwordLengthChar,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                            borderSide: const BorderSide(),
                          ),
                          filled: true,
                          fillColor: Colors.grey[300],
                          labelText: 'Enter No. of Charecters',
                          labelStyle: const TextStyle(color: Colors.blue),
                        ),
                        keyboardType: TextInputType.number,

                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextField(
                        controller: _passwordLengthDigit,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                            borderSide: const BorderSide(),
                          ),
                          filled: true,
                          fillColor: Colors.grey[300],
                          labelText: 'Enter No.of Digits',
                          labelStyle: const TextStyle(color: Colors.blue),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextField(
                        controller: _passwordLengthSymbol,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                            borderSide: const BorderSide(),
                          ),
                          filled: true,
                          fillColor: Colors.grey[300],
                          labelText: 'Enter No.symbols',
                          labelStyle: const TextStyle(color: Colors.blue),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),

                    const SizedBox(
                      height: 3,
                    ),
                    FlatButton(
                        onPressed: () {
                          if (_passwordLength.text.trim().isNotEmpty) {
                            _numberCharPassword =
                                double.parse(_passwordLength.text.trim());
                          }

                          newPassword = password.randomPassword(
                              letters: _isWithLetters,
                              numbers: _isWithNumbers,
                              passwordLength: _numberCharPassword,
                              specialChar: _isWithSpecial,
                              uppercase: _isWithUppercase);

                          print(newPassword);
                          double passwordStrength =
                          password.checkPassword(password: newPassword);
                          if (passwordStrength < 0.3) {
                            _color = Colors.red;
                            isOk = 'Hint: But this password is weak...! ';
                          } else if (passwordStrength < 0.7) {
                            _color = Colors.blue;
                            isOk = 'This password is Good, Hint:';
                          } else {
                            _color = Colors.green;
                            isOk = 'Hint: Strong Password';
                          }

                          setState(() {});
                        },
                        child: Container(
                          color: Colors.red,
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Generator Password',
                              style: TextStyle(color: Colors.white, fontSize: 15),
                            ),
                          ),
                        )),

                    const SizedBox(
                      height: 3,
                    ),
                    FlatButton(
                        onPressed: () {

                          _passwordChars =
                              double.parse(_passwordLengthChar.text.trim());
                          _passwordDigits =
                              double.parse(_passwordLengthDigit.text.trim());
                          _passwordSymbols =
                              double.parse(_passwordLengthSymbol.text.trim());


                          newPassword1 = password.randomPassword(
                            letters: _isWithLetters=true,

                            passwordLength: _passwordChars,
                            uppercase: _isWithUppercase=true,
                          );
                          newPassword2 = password.randomPassword(

                              letters: _isWithLetters=false,
                              numbers: _isWithNumbers=true,
                              passwordLength: _passwordDigits,
                              specialChar: _isWithSpecial=false,
                              uppercase: _isWithUppercase=false

                          );
                          newPassword3 = password.randomPassword(

                            letters: _isWithLetters=false,
                            numbers: _isWithNumbers=false,
                            passwordLength: _passwordSymbols,
                            specialChar: _isWithSpecial=true,
                            uppercase: _isWithUppercase=false,
                          );

                          newPassword = newPassword1+newPassword2+newPassword3;


                          print(newPassword);
                          double passwordStrength =
                          password.checkPassword(password: newPassword);
                          if (passwordStrength < 0.3) {
                            _color = Colors.red;
                            isOk = 'Hint: But this password is weak...! ';
                          } else if (passwordStrength < 0.7) {
                            _color = Colors.blue;
                            isOk = 'This password is Good, Hint:';
                          } else {
                            _color = Colors.green;
                            isOk = 'Hint: Strong Password';
                          }

                          setState(() {});
                        },
                        child: Container(
                          color: Colors.red,
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Generator Customize Password',
                              style: TextStyle(color: Colors.white, fontSize: 13),
                            ),
                          ),
                        )),
                    const SizedBox(
                      height: 3,
                    ),
                    FlatButton(
                        onPressed: () {


                          setState(() {});
                        },
                        child: Container(
                          color: Colors.red,
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Save',
                              style: TextStyle(color: Colors.white, fontSize: 13),
                            ),
                          ),
                        )),
                    const SizedBox(
                      height: 3,
                    ),
                    if (newPassword.isNotEmpty)
                      Center(
                          child: SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(
                                isOk,
                                style: TextStyle(color: _color, fontSize: 14),
                              ),
                            ),
                          )),
                    if (newPassword.isNotEmpty)
                      Center(
                          child: SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Text(
                                newPassword,
                                style: TextStyle(color: _color, fontSize: 13),
                              ),
                            ),
                          ))
                  ],
                )
              ],
          ),
            ),
      ),
    );
  }
}
