import 'package:flutter/material.dart';

class RoudedIconButton extends StatelessWidget {
  const RoudedIconButton(
      {super.key, required this.icon, required this.clicked});
  final IconData icon;
  final Function clicked;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () {
        clicked();
      },
      elevation: 5,
      constraints: const BoxConstraints.tightFor(
        width: 56,
        height: 56,
      ),
      shape: const CircleBorder(),
      fillColor: const Color(0xFF4C4F5E),
      child: Icon(icon),
    );
  }
}
