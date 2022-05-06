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
  Color _color = Colors.blue;
  String isOk = '';
  final TextEditingController _passwordLength = TextEditingController();
  final TextEditingController _passwordChars = TextEditingController();
  final TextEditingController _passwordDigits = TextEditingController();
  final TextEditingController _passwordSymbols = TextEditingController();
  final password = RandomPasswordGenerator();
  static const MaxNumericDigits = 17;
  static final _random = Random();

  static String getString(int digitCount) {

    String s = "";
    for (var i = 0; i < digitCount; i++) {
      s += _random.nextInt(10).toString();
    }
    return s;
  }
  String s= getString(4);
  String con =  '';
  @override
  void initState() {
    super.initState();
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
                            s+newPassword,
                            style: TextStyle(color: _color, fontSize: 25),
                          ),
                        ),
                      ))
              ],
            )),
      ),
    );
  }
}
