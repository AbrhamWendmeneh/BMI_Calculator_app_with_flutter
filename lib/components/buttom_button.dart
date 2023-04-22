import 'package:flutter/material.dart';
import 'package:bmicalculator/constants.dart';

class ButtomButton extends StatelessWidget {
  // ignore: prefer_const_constructors_in_immutables, use_key_in_widget_constructors
  ButtomButton({required this.cliked, required this.buttonTitle});
  final VoidCallback cliked;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: cliked,
      // () {
      //   Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //       builder: (context) => const ResultPage(),
      //     ),
      //   );
      // },

      child: Container(
        color: bottomContainerColor,
        margin: const EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: bottomContainerHeight,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20.0),
          child: Center(
            child: Text(
              // 'Calculate'.toUpperCase(),
              buttonTitle.toUpperCase(),
              style: largeButtonTextStyle,
            ),
          ),
        ),
      ),
    );
  }
}
