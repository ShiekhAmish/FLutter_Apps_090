import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'input.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
void main() {
  runApp(const BMI());
}

class BMI extends StatelessWidget {
  const BMI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Input(),
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
    );
  }
}

