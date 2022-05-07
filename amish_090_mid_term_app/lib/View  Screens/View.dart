import 'package:amish_090_mid_term_app/View%20%20Screens/PasswordsList.dart';
import 'package:flutter/material.dart';


class ViewPage extends StatefulWidget {
  const ViewPage({Key key}) : super(key: key);

  @override
  _ViewPageState createState() => _ViewPageState();
}

class _ViewPageState extends State<ViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: Text('View Passwords'),
    ),
    body: PasswordsList(),
    );
  }
}
