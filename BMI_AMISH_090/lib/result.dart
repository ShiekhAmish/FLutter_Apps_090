import 'package:bmi_amish_090/ConstantFile.dart';
import 'package:bmi_amish_090/ContainerCode.dart';
import 'package:bmi_amish_090/main.dart';
import 'package:flutter/material.dart';
import 'ConstantFile.dart';
import 'ConstantFile.dart';
import 'input.dart';
class ResultScreen extends StatelessWidget {

  ResultScreen({required this.Interpretation,required this.BMIResult,required this.ResultText});

  final String BMIResult;
   final String ResultText;
   final String Interpretation;


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
                children: [
                  Text(
                    ResultText.toUpperCase(),
                    style: ResultStyle,
                  ),
                  Text(
                    BMIResult,
                    style: BMIStyle,
                  ),
                  Text(
                    Interpretation,
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
              Navigator.push(context, MaterialPageRoute(builder: (context)=>BMI()));
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
