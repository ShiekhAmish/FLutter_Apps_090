import 'package:flutter/material.dart';
import 'constantsFile.dart';

class TextandIconContent extends StatelessWidget {
  TextandIconContent({this.icon, this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 80.0,
        ),
        SizedBox(
          height: 15.1,
        ),
        Text(
          label,
          style: kLabelTextStyle,
        )
      ],
    );
  }
}
