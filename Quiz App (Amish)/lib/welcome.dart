import 'package:final_quiz_app/main.dart';
import 'package:flutter/material.dart';
import 'package:mailto/mailto.dart';
import 'dart:async';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_fonts/google_fonts.dart';
void main() => runApp(SplashScreen());


class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Splash Screen',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 5),
            () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => welcome())));
  } //<- Creates an object that fetches an image.

  // var image = new Image(
  //     image: AssetImage(
  //         'asset/quiz.png'),
  //     height:300);
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Colors.amber,
                Colors.black,
              ],
            )
        ),
        child: Column(
          children: <Widget>[
            SizedBox(height: 60,),
            Image(image: AssetImage('images/p2.png'), height: 200),
            SizedBox(height: 30,),
            Text("Shiekh Amish Sabir_090", style: GoogleFonts.nunito(fontSize: 20,color: Colors.white)),

            SizedBox(
              height: 10,
            ),
            CircularProgressIndicator()
          ],
        ));
  }
}

class welcome extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("QuizApp"),
      backgroundColor: Colors.yellow.shade700,),

backgroundColor: Colors.amber,
        body: welcomepage(),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.

        child: ListView(

          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
             new UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Colors.amber,

              ),
               accountName: new Text('Shiekh Amish'),
               accountEmail: new Text('amishsabir2@gmail.com'),
               currentAccountPicture: new CircleAvatar(
                backgroundColor: Colors.amber,
                 child: Image.asset('images/profile.png'),

               ),

            ),

            ListTile(
              title: const Text('Home'),
              onTap: (

                  ) {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Source Code'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                _launchURL();
              },
            ),
            ListTile(
              title: const Text('Share'),
              onTap: (

                  ) {
                // Update the state of the app
                // ...
                // Then close the drawer
                _shareContent();
              },
            ),

            ListTile(
              title: const Text('Contact Us'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                showAlertDialog(context);

                // mailto:<email address>?subject=<subject>&body=<body>
               
              },
            ),
          ],
        ),
      ),
    );
  }
}
_launchURL() async {
  const url = 'https://github.com/ShiekhAmish/FLutter_Public-/tree/main/Final%20Quiz%20App';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
showAlertDialog(BuildContext context) {
  // Create button
  Widget okButton = FlatButton(
    child: Text("OK"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Contact US"),
    content: Text("Mail To: amishsabir2@gmail.com \n\nTel #: 03096402445"),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );}
  Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>  QuizApp(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

class welcomepage extends StatefulWidget {

  @override
  _welcomepageState createState() => _welcomepageState();
}
final String _content =
    'Made by Shiekh Amish \n\n Get Help From: https://www.youtube.com/c/0673007626pakacademy79 \n\nMail: amishsabir2@gmail.com \n\n Apk File: Hehe';

void _shareContent() {
  Share.share(_content);
}
class _welcomepageState extends State<welcomepage> {


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/back2.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 20,),
          Row(

            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/quiz.gif'),

                  ),
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
                        child: Image.asset("images/play.png"),
                        onPressed: () {

                              Navigator.of(context).push(_createRoute()
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
                        child: Image.asset("images/share.png"),
                        onPressed: _shareContent,
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
