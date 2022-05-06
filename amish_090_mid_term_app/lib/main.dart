import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Colors.deepPurple,
                Colors.deepPurpleAccent,
              ],
            )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
          SizedBox(height: 20,),
        Row(

          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              child: Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(

                    image: AssetImage("img/simple.png"),

                    alignment: Alignment.topCenter,
                  ),

                ),
                child: Text("Simple Password"),
              ),

            ),
          ],
        ),
        SizedBox(height: 120,),
        Column(
          children: [
          Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                child: TextButton(
                  child: Image.asset("img/strong.png"),
                  onPressed: null,

                )


            ),

          ],

        ),
        Row(

          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                child: TextButton(
                  child: Image.asset("img/view.png"),
                  onPressed: null,
                )
            ),
          ],
        ),
        ],
        ),
      ],
      ),
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
