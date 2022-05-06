import 'package:flutter/material.dart';
import 'package:random_password_generator/random_password_generator.dart';
import 'dart:math';
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
  final TextEditingController _passwordLength = TextEditingController();
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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Simple Password Generator'),
        ),
        body: Center(
            child: Column(
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
                    keyboardType: TextInputType.number,
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
            )),
      ),
    );
  }
}
