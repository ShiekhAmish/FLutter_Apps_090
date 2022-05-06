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
          SizedBox(height: 50,),
       Row(

          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: null,
              child: Card(

                child: Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),

                      image: DecorationImage(
                          image: AssetImage('img/simple.png'))),

                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text('Simple Password', style: TextStyle(fontWeight: FontWeight.bold ),),
                    ],
                  ),
                ),

              ),
            ),
          ],
        ),
        SizedBox(height: 10,),


            Row(

              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: null,
                   child: Card(
                      child: Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            image: DecorationImage(
                                image: AssetImage('img/strong.png'))),

                        child: Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Text('Strong Password', style: TextStyle(fontWeight: FontWeight.bold ),),
                          ],
                        ),
                      ),

                    )
                ),
              ],
            ),
            Row(

              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: null,
                  child: Card(
                    child: Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          image: DecorationImage(
                              image: AssetImage('img/view.png'))),

                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Text('View', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                        ],
                      ),
                    ),

                  ),
                ),
              ],
            ),
        ],
        ),

      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
