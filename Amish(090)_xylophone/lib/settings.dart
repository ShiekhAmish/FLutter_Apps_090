import 'package:flutter/material.dart';
import 'package:xylophone_app/main.dart';
import 'package:string_to_hex/string_to_hex.dart';
class settings extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.lightBlueAccent,
        appBar: AppBar(
          title: Text("Settings"),
          leading: Icon(
            Icons.app_settings_alt_rounded,
          ),
          backgroundColor: Colors.lightGreen,
        ),

        body:
        setting(),


      ),
    );
  }
}

class setting extends StatefulWidget {


  @override
  _settingState createState() => _settingState();
}

class _settingState extends State<setting> {
  List<String> _Colors = ['sky', 'orange', 'yellow', 'green','teal','blue','purple'];
  List<String> _Colors1 = ['sky', 'orange', 'yellow', 'green','teal','blue','purple'];
  List<String> _Colors2 = ['sky', 'orange', 'yellow', 'green','teal','blue','purple'];
  List<String> _Colors3 = ['sky', 'orange', 'yellow', 'green','teal','blue','purple'];
  List<String> _Colors4 = ['sky', 'orange', 'yellow', 'green','teal','blue','purple'];
  List<String> _Colors5 = ['sky', 'orange', 'yellow', 'green','teal','blue','purple'];
  List<String> _Colors6 = ['sky', 'orange', 'yellow', 'green','teal','blue','purple'];
  List<String> _Colors7 = ['sky', 'orange', 'yellow', 'green','teal','blue','purple'];
  List<String> _Notes = ['1', '2', '3', '4','5','6','7'];
  List<String> _Notes1 = ['1', '2', '3', '4','5','6','7'];
  List<String> _Notes2 = ['1', '2', '3', '4','5','6','7'];
  List<String> _Notes3 = ['1', '2', '3', '4','5','6','7'];
  List<String> _Notes4 = ['1', '2', '3', '4','5','6','7'];
  List<String> _Notes5 = ['1', '2', '3', '4','5','6','7'];
  List<String> _Notes6 = ['1', '2', '3', '4','5','6','7'];
  List<String> _Notes7 = ['1', '2', '3', '4','5','6','7'];

  String _selectedLocation1='sky',_selectedLocation2='1',_selectedLocation3='orange',_selectedLocation4='2',_selectedLocation5='yellow',_selectedLocation6='3'
  ,_selectedLocation7='green',_selectedLocation8='4',_selectedLocation9='teal',_selectedLocation10='5',_selectedLocation11='blue',_selectedLocation12='6'
  ,_selectedLocation13='purple',_selectedLocation14='7';

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.green,
              Colors.amber,
            ],
          )
      ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Row(

        children: [
          Expanded(child: Text('Colors'),),
          Expanded(child: Text('Notes'),),
        ],
      ),
      SizedBox(
        height: 30,
      ),
      Row(
        children: [
          Expanded(child: DropdownButton(
            hint: Text('Colors'), // Not necessary for Option 1
            value: _selectedLocation1,
            onChanged: (newValue) {
              setState(() {
                _selectedLocation1 = newValue;
              });
            },
            items: _Colors1.map((location) {
              return DropdownMenuItem(
                child: new Text(location),
                value: location,
              );
            }).toList(),
          ),),
         Expanded(child:  DropdownButton(
           hint: Text('Notes'), // Not necessary for Option 1
           value: _selectedLocation2,
           onChanged: (newValue) {
             setState(() {
               _selectedLocation2 = newValue;
             });
           },
           items: _Notes1.map((location) {
             return DropdownMenuItem(
               child: new Text(location),
               value: location,
             );
           }).toList(),
         ),),
        ],
      ),
      Row(
        children: [
          Expanded(child: DropdownButton(
            hint: Text('Colors'), // Not necessary for Option 1
            value: _selectedLocation3,
            onChanged: (newValue) {
              setState(() {
                _selectedLocation3 = newValue;
              });
            },
            items: _Colors2.map((location) {
              return DropdownMenuItem(
                child: new Text(location),
                value: location,
              );
            }).toList(),
          ),),
          Expanded(child:  DropdownButton(
            hint: Text('Notes'), // Not necessary for Option 1
            value: _selectedLocation4,
            onChanged: (newValue) {
              setState(() {
                _selectedLocation4 = newValue;
              });
            },
            items: _Notes2.map((location) {
              return DropdownMenuItem(
                child: new Text(location),
                value: location,
              );
            }).toList(),
          ),),
        ],
      ),
      Row(
        children: [
          Expanded(child: DropdownButton(
            hint: Text('Colors'), // Not necessary for Option 1
            value: _selectedLocation5,
            onChanged: (newValue) {
              setState(() {
                _selectedLocation5 = newValue;
              });
            },
            items: _Colors3.map((location) {
              return DropdownMenuItem(
                child: new Text(location),
                value: location,
              );
            }).toList(),
          ),),
          Expanded(child:  DropdownButton(
            hint: Text('Notes'), // Not necessary for Option 1
            value: _selectedLocation6,
            onChanged: (newValue) {
              setState(() {
                _selectedLocation6 = newValue;
              });
            },
            items: _Notes3.map((location) {
              return DropdownMenuItem(
                child: new Text(location),
                value: location,
              );
            }).toList(),
          ),),
        ],
      ),
      Row(
        children: [
          Expanded(child: DropdownButton(
            hint: Text('Colors'), // Not necessary for Option 1
            value: _selectedLocation7,
            onChanged: (newValue) {
              setState(() {
                _selectedLocation7 = newValue;
              });
            },
            items: _Colors4.map((location) {
              return DropdownMenuItem(
                child: new Text(location),
                value: location,
              );
            }).toList(),
          ),),
          Expanded(child:  DropdownButton(
            hint: Text('Notes'), // Not necessary for Option 1
            value: _selectedLocation8,
            onChanged: (newValue) {
              setState(() {
                _selectedLocation8 = newValue;
              });
            },
            items: _Notes4.map((location) {
              return DropdownMenuItem(
                child: new Text(location),
                value: location,
              );
            }).toList(),
          ),),
        ],
      ),
      Row(
        children: [
          Expanded(child: DropdownButton(
            hint: Text('Colors'), // Not necessary for Option 1
            value: _selectedLocation9,
            onChanged: (newValue) {
              setState(() {
                _selectedLocation9 = newValue;
              });
            },
            items: _Colors5.map((location) {
              return DropdownMenuItem(
                child: new Text(location),
                value: location,
              );
            }).toList(),
          ),),
          Expanded(child:  DropdownButton(
            hint: Text('Notes'), // Not necessary for Option 1
            value: _selectedLocation10,
            onChanged: (newValue) {
              setState(() {
                _selectedLocation10 = newValue;
              });
            },
            items: _Notes5.map((location) {
              return DropdownMenuItem(
                child: new Text(location),
                value: location,
              );
            }).toList(),
          ),),
        ],
      ),
      Row(
        children: [
          Expanded(child: DropdownButton(
            hint: Text('Colors'), // Not necessary for Option 1
            value: _selectedLocation11,
            onChanged: (newValue) {
              setState(() {
                _selectedLocation11 = newValue;
              });
            },
            items: _Colors6.map((location) {
              return DropdownMenuItem(
                child: new Text(location),
                value: location,
              );
            }).toList(),
          ),),
          Expanded(child:  DropdownButton(
            hint: Text('Notes'), // Not necessary for Option 1
            value: _selectedLocation12,
            onChanged: (newValue) {
              setState(() {
                _selectedLocation12 = newValue;
              });
            },
            items: _Notes6.map((location) {
              return DropdownMenuItem(
                child: new Text(location),
                value: location,
              );
            }).toList(),
          ),),
        ],
      ),
      Row(
        children: [
          Expanded(child: DropdownButton(
            hint: Text('Colors'), // Not necessary for Option 1
            value: _selectedLocation13,
            onChanged: (newValue) {
              setState(() {
                _selectedLocation13 = newValue;
              });
            },
            items: _Colors7.map((location) {
              return DropdownMenuItem(
                child: new Text(location),
                value: location,
              );
            }).toList(),
          ),),
          Expanded(child:  DropdownButton(
            hint: Text('Notes'), // Not necessary for Option 1
            value: _selectedLocation14,
            onChanged: (newValue) {
              setState(() {
                _selectedLocation14 = newValue;
              });
            },
            items: _Notes7.map((location) {
              return DropdownMenuItem(
                child: new Text(location),
                value: location,
              );
            }).toList(),
          ),),
        ],
      ),

Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [

    Container(
        height: 100,
        width: 100,
        child: TextButton(

          child: Image.asset("images/play2.png"),
          onPressed: () {
            Navigator.push(
              context,

              MaterialPageRoute(builder: (context) =>  XylophoneApp(selectedLocation1:StringToHex.toColor(_selectedLocation1),selectedLocation3:StringToHex.toColor(_selectedLocation3),selectedLocation5:StringToHex.toColor(_selectedLocation5),selectedLocation7:StringToHex.toColor(_selectedLocation7),selectedLocation9:StringToHex.toColor(_selectedLocation9),selectedLocation11:StringToHex.toColor(_selectedLocation11),selectedLocation13:StringToHex.toColor(_selectedLocation13),selectedLocation2:int.parse(_selectedLocation2),selectedLocation4:int.parse(_selectedLocation4),selectedLocation6:int.parse(_selectedLocation6),selectedLocation8:int.parse(_selectedLocation8),selectedLocation10:int.parse(_selectedLocation10),selectedLocation12:int.parse(_selectedLocation12),selectedLocation14:int.parse(_selectedLocation14))));
          },
        )
    ),
  ],
),

    ],
   ),
    );
  }
}
