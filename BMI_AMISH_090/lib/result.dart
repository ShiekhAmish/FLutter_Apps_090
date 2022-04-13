import 'package:bmi_amish_090/ConstantFile.dart';
import 'package:bmi_amish_090/ContainerCode.dart';
import 'package:flutter/material.dart';
import 'ConstantFile.dart';
import 'ConstantFile.dart';
import 'input.dart';
class ResultScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Results'),

      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(child: Container(
            child: Center(
              child: Text(
                'Your Result',
                style: TitleStyle,
              ),
            ),
          ),),
          Expanded(
            flex: 5,
            child: RepeatContainer(
              colors: activeColor,
              cardWidget: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Normal',
                    style: ResultStyle,
                  ),
                  Text(
                    '18.3',
                    style: BMIStyle,
                  ),
                  Text(
                    'BMI is Low You should have to work More',
                    textAlign: TextAlign.center,
                    style: BodyStyle,
                  ),
                ],
              ),
            ),
          ),
          Expanded(child: GestureDetector(
            onTap: ()
            {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>ResultScreen()));
            },

            child:   Container(

              child:const Center(

                child:Text('Re-Calculate',style: LargeButton,),

              ),
              color: Colors.red,
              margin: EdgeInsets.only(top:10.0),
              width: double.infinity,
              height: 80.0,
            ),
          ),),
        ],
      ),
    );
  }
}
