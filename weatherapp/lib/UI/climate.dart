import 'package:flutter/material.dart';
import '../utils/apifile.dart' as util;
import 'package:http/http.dart' as http;
import 'dart:convert';
class Climate extends StatefulWidget {

  @override
  _ClimateState createState() => _ClimateState();
}

class _ClimateState extends State<Climate> {
  void showStuff() async {
    Map data = await getWeather(util.apiId, util.defaultCity);
    print(data.toString());
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(

        title: Text('Climate App'),
        backgroundColor: Colors.blueAccent,
        actions: [
          IconButton(onPressed: () => showStuff(), icon: Icon(Icons.menu),),
        ],
      ),
      body: Stack(
        children:  [
          Center(
            child: Expanded(
              child: Image(
              image: AssetImage('images/img1.webp'),
              width: 500,
              fit: BoxFit.fill,
            ),),
          ),
          Container(
            alignment: Alignment.topRight,
            margin: EdgeInsets.fromLTRB(0.0, 10.9, 20.9, 0.0),
            child: Text(
              'Vehari',
              style: cityStyle(),
            ),
          ),
        ],
      ),
    );
  }
  Future<Map> getWeather(String appId, String city)async
  {
    String apiUrl = 'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=${util.apiId}&units=imperial';
    http.Response response = await http.get(Uri.parse(apiUrl));

    return json.decode(response.body);
  }

}
TextStyle cityStyle() {
  return TextStyle(
    color: Colors.white,
    fontSize: 22.9,
    fontStyle: FontStyle.italic,
  );
}

TextStyle tempStyle() {
  return TextStyle(
      color: Colors.white,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w500,
      fontSize: 49.9);
}