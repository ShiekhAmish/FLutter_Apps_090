import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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

        title: Text(" BMI Calculator"),
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

class RepeatIcon extends StatelessWidget {
RepeatIcon({required this.icon, required this.label});
  final IconData icon;
  final String label;


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
        children:  [
         Icon(
            icon,
            size: 80.0,
          ),
          const SizedBox(
            height: 15.0,
          ),
          Text(
            label,
            style: const TextStyle(fontSize: 18.0,
              color: Colors.white),),
        ],
    );
  }
}

class RepeatContainer extends StatelessWidget {

   RepeatContainer({required this.colors, required this.cardWidget});
   final Color colors;
   final Widget cardWidget;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardWidget,
      margin: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: colors,
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}