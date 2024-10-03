import 'package:bmiplus/pages/control.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const Bmipls());
}

class Bmipls extends StatelessWidget {
  const Bmipls({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Contrl(
        isMale: true,
      ),
    );
  }
}
  // This widget is the root of your appli