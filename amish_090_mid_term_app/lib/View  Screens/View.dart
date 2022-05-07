import 'package:amish_090_mid_term_app/View  Screens/PasswordsList.dart';
import 'package:flutter/material.dart';
import 'package:amish_090_mid_term_app/View  Screens/Update.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ViewPage());
}

class ViewPage extends StatefulWidget {


  @override
  _ViewPageState createState() => _ViewPageState();
}

class _ViewPageState extends State<ViewPage> {

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
          title: Text('View Passwords'),
        ),
          body: PasswordsList(),
        );
      }
      return CircularProgressIndicator();
        },
    );
  }
}
