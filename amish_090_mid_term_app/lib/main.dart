import 'package:amish_090_mid_term_app/View%20%20Screens/View.dart';
import 'package:amish_090_mid_term_app/simple.dart';
import 'package:amish_090_mid_term_app/strong.dart';
import 'package:amish_090_mid_term_app/View  Screens/PasswordsList.dart';
import 'package:flutter/material.dart';
import 'package:amish_090_mid_term_app/View  Screens/Update.dart';
import 'package:amish_090_mid_term_app/strong.dart';
import 'package:amish_090_mid_term_app/View  Screens/View.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dashboard',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Dashboard'),
    );
  }
}

class MyHomePage extends StatefulWidget {
   MyHomePage({Key key,  this.title}) : super(key: key);



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        // CHeck for Errors
        if (snapshot.hasError) {
          print("Something went Wrong");
        }
        // once Completed, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return Scaffold(appBar: AppBar(
            backgroundColor: Colors.deepPurpleAccent,
            title: Text('Dashboard'),
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
                  SizedBox(height: 100,),
                  Row(

                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Simple()),
                          );
                        },
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



                  Row(

                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Strong()),
                            );
                          },
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
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ViewPage()),
                          );
                        },
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
          );
        }
        return CircularProgressIndicator();
      },
    );
  }
}
