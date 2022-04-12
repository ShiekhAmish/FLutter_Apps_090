import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'IconText.dart';
import 'ContainerCode.dart';
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

        title: const Text("BMI Calculator"),
      ),
          body: Column(
        children: [
          Expanded(child: Row(
            children:  [
              Expanded(child: RepeatContainer(
                colors: Colors.red,
                cardWidget: RepeatIcon(
                  icon: FontAwesomeIcons.male,
                  label: 'MALE',
                ),
              ),),
              Expanded(child: RepeatContainer(
                colors: Colors.amber,
                cardWidget: RepeatIcon(
                  icon: FontAwesomeIcons.female,
                  label: 'FEMALE',
                ),
              ),),
            ],
          ),),
          Expanded(child: Row(
            children: [
              Expanded(child: RepeatContainer(
                colors: Colors.green,
                cardWidget: Container(),
              ),),
            ],
          ),),
          Expanded(child: Row(
            children: [
              Expanded(child: RepeatContainer(
                colors: Colors.blueAccent,
                cardWidget: Container(),
              ),),
              Expanded(child: RepeatContainer(
                colors: Colors.purple,
                cardWidget: Container(),
              ),),
            ],
          ),),

      ],
    ),
    );
  }
}



