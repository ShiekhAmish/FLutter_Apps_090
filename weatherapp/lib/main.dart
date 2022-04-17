import 'package:flutter/material.dart';
import 'package:weatherapp/screen1.dart';
import 'screen0.dart';
import 'screen2.dart';
void main() {
  runApp( MaterialApp(
    title: 'Climate',
    initialRoute: '/',
    routes: {
      '/': (context) => Screen0(),
      '/first': (context) => Screen1(),
      '/second': (context) => Screen2(),
    },
  ));
}