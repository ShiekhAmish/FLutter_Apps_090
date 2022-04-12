import 'package:flutter/material.dart';


class Input extends StatefulWidget {
  const Input({Key? key}) : super(key: key);

  @override
  _InputState createState() => _InputState();
}

class _InputState extends State<Input> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(

        title: Text("BMI Calculator"),
      ),
          body: Column(
        children: [
          Expanded(child: Row(
            children: [
              Expanded(child: Container(
                margin: EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  color: Colors.blueAccent.shade200,
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),),
              Expanded(child: Container(
                margin: EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  color: Colors.blueAccent.shade200,
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),),
            ],
          ),),
          Expanded(child: Row(
            children: [
              Expanded(child: Container(
                margin: EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  color: Colors.blueAccent.shade200,
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),),
            ],
          ),),
          Expanded(child: Row(
            children: [
              Expanded(child: Container(
                margin: EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  color: Colors.blueAccent.shade200,
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),),
              Expanded(child: Container(
                margin: EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  color: Colors.blueAccent.shade200,
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),),
            ],
          ),),

      ],
    ),
    );
  }
}