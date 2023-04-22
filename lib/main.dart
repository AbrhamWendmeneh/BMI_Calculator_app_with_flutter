// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:bmicalculator/screen/input_page.dart';

void main() {
  runApp(const BMICaluculator());
}

class BMICaluculator extends StatelessWidget {
  const BMICaluculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
          primaryColor: const Color(0xFF0A0E21),
          scaffoldBackgroundColor: const Color(0xFF0A0E21)),
      debugShowCheckedModeBanner: false,
      home: const InputPage(),
    );
  }
}
