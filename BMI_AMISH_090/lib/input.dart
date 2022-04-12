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
            children:  [
              Expanded(child: RepeatContainer(
                colors: Colors.red,
              ),),
              Expanded(child: RepeatContainer(
                colors: Colors.amber,
              ),),
            ],
          ),),
          Expanded(child: Row(
            children: [
              Expanded(child: RepeatContainer(
                colors: Colors.green,
              ),),
            ],
          ),),
          Expanded(child: Row(
            children: [
              Expanded(child: RepeatContainer(
                colors: Colors.blueAccent,
              ),),
              Expanded(child: RepeatContainer(
                colors: Colors.purple,
              ),),
            ],
          ),),

      ],
    ),
    );
  }
}

class RepeatContainer extends StatelessWidget {
  RepeatContainer({required this.colors});
  final Color colors;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: colors,
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}