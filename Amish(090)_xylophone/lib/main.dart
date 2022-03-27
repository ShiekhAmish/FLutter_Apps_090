import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:xylophone_app/welcome.dart';
import 'package:xylophone_app/settings.dart';
void main() => runApp(welcome());


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override

  Widget build(BuildContext context) {

    return SplashScreen(

      seconds: 40,
      navigateAfterSeconds: XylophoneApp(),
      title: Text(
        'Welcome In SplashScreen',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
      ),
      image: Image.network(
          'https://flutter.io/images/catalog-widget-placeholder.png'),
      backgroundColor: Colors.white,
      loaderColor: Colors.red,
    );
  }
}

class XylophoneApp extends StatelessWidget {
  var selectedLocation3,selectedLocation5,selectedLocation7,selectedLocation9,selectedLocation11,selectedLocation13,selectedLocation2,selectedLocation4,selectedLocation6,selectedLocation8,selectedLocation10,selectedLocation12,selectedLocation14,selectedLocation1;
  XylophoneApp({this.selectedLocation1,this.selectedLocation3,this.selectedLocation5,this.selectedLocation7,this.selectedLocation9,this.selectedLocation11,this.selectedLocation13,this.selectedLocation2,this.selectedLocation4, this.selectedLocation6, this.selectedLocation8, this.selectedLocation10, this.selectedLocation12, this.selectedLocation14});

  void playSound(int soundNumber) {
    final player = AudioCache();
    player.play('note$soundNumber.wav');
  }

  Expanded buildKey({Color color, int soundNumber}) {
    return Expanded(
      child: FlatButton(
        color: color,
        onPressed: () {
          playSound(soundNumber);
        },
      ),
    );
  }
  String colors(String value ){

    if( value =='sky' )
    {

      selectedLocation1=0xFF42A5F5;
      return selectedLocation1;
    }

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(

            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              buildKey(color: Color(selectedLocation1), soundNumber: selectedLocation2),
              buildKey(color: Color(selectedLocation3), soundNumber: selectedLocation4),
              buildKey(color: Color(selectedLocation5), soundNumber: selectedLocation6),
              buildKey(color: Color(selectedLocation7), soundNumber: selectedLocation8),
              buildKey(color: Color(selectedLocation9), soundNumber: selectedLocation10),
              buildKey(color: Color(selectedLocation11), soundNumber: selectedLocation12),
              buildKey(color: Color(selectedLocation13), soundNumber: selectedLocation14),
            ],
          ),
        ),
      ),
    );
  }
}
