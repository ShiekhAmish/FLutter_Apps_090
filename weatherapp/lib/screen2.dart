import 'package:flutter/material.dart';

class Screen2 extends StatelessWidget {
  const Screen2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Screen 2'),
      ),
      body: Center(
        child: RaisedButton(
          color: Colors.blueAccent,
          child: Text('Go Backwards to Screen 1'),
          onPressed: () {
            Navigator.pop(context);
          },

        ),
      ),
    );
  }
}
