import 'package:flutter/material.dart';
import 'package:bmicalculator/constants.dart';

class IconContent extends StatelessWidget {
  final IconData icon;
  final String lable;
  // ignore: use_key_in_widget_constructors
  const IconContent({required this.icon, required this.lable});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Icon(
          icon,
          size: 80.0,
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          lable,
          style: lableTextStyle,
        )
      ],
    );
  }
}
