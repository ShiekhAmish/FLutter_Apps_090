import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xylophone_app/main.dart';
import 'package:xylophone_app/settings.dart';
void main() => runApp(welcome());
class welcome extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(

        body: welcomepage(),
      ),
    );
  }
}
class welcomepage extends StatefulWidget {

  @override
  _welcomepageState createState() => _welcomepageState();
}

class _welcomepageState extends State<welcomepage> {
  String _selectedLocation1='green',_selectedLocation2='1',_selectedLocation3,_selectedLocation4='2',_selectedLocation5,_selectedLocation6='3'
  ,_selectedLocation7,_selectedLocation8='4',_selectedLocation9,_selectedLocation10='5',_selectedLocation11,_selectedLocation12='6'
  ,_selectedLocation13,_selectedLocation14='7';
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/child.webp"),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 100,),
          Row(

            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/bear.gif'),

                  ),
                ),


              ),

            ],
          ),
          SizedBox(height: 50,),

           Column(
            children: [
               Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      child: TextButton(
                        child: Image.asset("images/play.png"),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>  XylophoneApp(selectedLocation1:0xFF42A5F5,selectedLocation3:0xFFFFA500,selectedLocation5:0xFFFFFF00,selectedLocation7:0xFF00FF00,selectedLocation9:0xFF008080,selectedLocation11:0xFF0000FF,selectedLocation13:0xFF6a0dad,selectedLocation2:int.parse(_selectedLocation2),selectedLocation4:int.parse(_selectedLocation4),selectedLocation6:int.parse(_selectedLocation6),selectedLocation8:int.parse(_selectedLocation8),selectedLocation10:int.parse(_selectedLocation10),selectedLocation12:int.parse(_selectedLocation12),selectedLocation14:int.parse(_selectedLocation14))),
                          );
                        },
                      )


                  ),

                ],

              ),



               Row(

                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      child: TextButton(
                        child: Image.asset("images/setting.png"),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => settings()),

                      );
                        },
                  )
                  ),
                ],
              ),

            ],
          ),
        ],
      ),
    );
  }
}
