import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'IconText.dart';
import 'ContainerCode.dart';

const activeColor = Color(0xFF1D1E33);
const deActiveColor = Color(0xFF111328);
enum Gender{
  male,
  female,
}
class Input extends StatefulWidget {
  const Input({Key? key}) : super(key: key);

  @override
  _InputState createState() => _InputState();
}

class _InputState extends State<Input> {
   Gender SelectGender = Gender.values.first;

//   Color MaleColor = deActiveColor;
//   Color FeMaleColor = deActiveColor;
//   void updateColor(Gender gendertype)
//   {
// if(gendertype==Gender.male)
//   {
//      MaleColor = activeColor;
//     FeMaleColor = deActiveColor;
//   }
// if(gendertype==Gender.female)
// {
//   MaleColor = deActiveColor;
//   FeMaleColor = activeColor;
// }
//   }

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
              Expanded(

                child: RepeatContainer(
                  onPressed: ()
                  {
                    setState(() {
                      SelectGender=Gender.male;
                    });
                  },

                  colors: SelectGender==Gender.male?activeColor:deActiveColor,
                  cardWidget: RepeatIcon(
                    icon: FontAwesomeIcons.male,
                    label: 'MALE',
                  ),
                ),
              ),
              Expanded(
                child: RepeatContainer(
                  onPressed: ()
                  {
                    setState(() {
                      SelectGender=Gender.female;
                    });
                  },
                  colors: SelectGender==Gender.female?activeColor:deActiveColor,
                  cardWidget: RepeatIcon(
                    icon: FontAwesomeIcons.female,
                    label: 'FEMALE',
                  ),
                ),
              ),
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



