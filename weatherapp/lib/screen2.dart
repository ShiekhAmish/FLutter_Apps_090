import 'package:flutter/material.dart';

class Screen2 extends StatefulWidget {


  @override
  _Screen2State createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  @override
  void initState()
  {
    print('Init Called');
    super.initState();
  }
  void deactivate()
  {
    print("Deactivate Called");
    super.deactivate();
  }
  Widget build(BuildContext context) {
    print("bulid Called");
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
