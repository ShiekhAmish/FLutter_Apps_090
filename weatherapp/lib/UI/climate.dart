import 'package:flutter/material.dart';
class Climate extends StatefulWidget {

  @override
  _ClimateState createState() => _ClimateState();
}

class _ClimateState extends State<Climate> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(

        title: Text('Climate App'),
        backgroundColor: Colors.blueAccent,
        actions: [
          IconButton(onPressed: () => print("Clicked"), icon: Icon(Icons.menu),),
        ],
      ),
      body: Stack(
        children: const [
          Center(
            child: Expanded(
              child: Image(
              image: AssetImage('images/img1.webp'),
              width: 500,
              fit: BoxFit.fill,
            ),),
          ),
        ],
      ),
    );
  }
}
