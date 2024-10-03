import 'dart:math';

import 'package:bmiplus/pages/control.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Resultscreen extends StatelessWidget {
  int height;
  int weight;
  bool isMale;
  Resultscreen(
      {super.key,
      required this.height,
      required this.weight,
      required this.isMale});

  @override
  Widget build(BuildContext context) {
    double bmiCalc = weight / pow(height / 100, 2);
    String result = "";
    switch (bmiCalc) {
      case < 16:
        result = "severe thinness";
        break;
      case > 16 && < 18.5:
        result = "underweight ";
        break;
      case > 18.5 && < 25:
        result = "Normal";
        break;
      case > 25 && < 30:
        result = "overweight";
        break;
      case > 30:
        result = "Obese";
        break;
      default:
    }
    return Scaffold(
      backgroundColor: isMale ? Colors.blue : Colors.red,
      body: Expanded(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Column(children: [
              const Text(
                "Your Bmi is: ",
                style: TextStyle(color: Colors.white, fontSize: 42),
              ),
              const SizedBox(
                height: 40,
              ),
              Text(
                "${bmiCalc.toStringAsFixed(1)}",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 42,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(result,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 42,
                  )),
              IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return Contrl(isMale: isMale);
                    },
                  ));
                },
                icon: Icon(
                  Icons.repeat_rounded,
                  color: Colors.white,
                  size: 24,
                ),
              ),
            ]),
          )
        ],
      )),
    );
  }
}
