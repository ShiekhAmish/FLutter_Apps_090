import 'package:flutter/material.dart';

class Screen0 extends StatelessWidget {
  const Screen0({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text('Screen 0'),
      ),
      body: Center(
        child: Column(

          children: [
          RaisedButton(
          color: Colors.red,
          child: Text('Go  to Screen 1'),
          onPressed: () {
Navigator.pushNamed(context, '/first');
          },
          ),
SizedBox(
  height: 10,
),
        RaisedButton(
          color: Colors.blueAccent,
          child: Text('Go  to Screen 2'),
          onPressed: () {
            Navigator.pushNamed(context, '/second');
          },
        ),
          ],
        ),

      ),
    );
  }
}