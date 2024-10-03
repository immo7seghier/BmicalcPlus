import 'package:bmiplus/pages/homepage.dart';
import 'package:bmiplus/pages/result.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Contrl extends StatefulWidget {
  bool isMale;
  Contrl({super.key, required this.isMale});

  @override
  State<Contrl> createState() => _ContrlState();
}

class _ContrlState extends State<Contrl> {
  int weight = 25;
  int height = 125;
  @override
  Widget build(BuildContext context) {
    Color clrprem = widget.isMale ? Colors.blue : Colors.red;
    return Scaffold(
      body: Stack(children: [
        Row(
          children: [
            Expanded(
                flex: 2,
                child: Container(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: () {},
                                  child: IconButton(
                                    icon: const Icon(
                                      Icons.arrow_back_ios_new,
                                      size: 26,
                                    ),
                                    color: clrprem,
                                    onPressed: () {
                                      Navigator.push(context, MaterialPageRoute(
                                        builder: (context) {
                                          return Homepage();
                                        },
                                      ));
                                    },
                                  ),
                                ),
                                Text(
                                  "BMI PLUS",
                                  style:
                                      TextStyle(color: clrprem, fontSize: 26),
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  widget.isMale ? "MALE" : "FEMALE",
                                  style: const TextStyle(
                                    fontSize: 24,
                                  ),
                                ),
                                Icon(
                                  widget.isMale ? Icons.male : Icons.female,
                                  color: clrprem,
                                  size: 120,
                                ),
                                const Text(
                                  "WEIGHT (KG)",
                                  style: TextStyle(fontSize: 24),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              itemCount: 177,
                              itemBuilder: (BuildContext context, int index) {
                                int i = index + 5 * 5;
                                return Padding(
                                  padding: const EdgeInsets.all(18),
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        weight = i;
                                      });
                                    },
                                    child: Center(
                                      child: Text(
                                        "$i",
                                        style: TextStyle(
                                            color: weight == i
                                                ? clrprem
                                                : Colors.black,
                                            fontSize: weight == i ? 42 : 22),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          )
                        ],
                      ),
                    ))),
            Expanded(
                flex: 1,
                child: Container(
                    color: clrprem,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 45,
                          ),
                          const Text(
                            "HEIGHT",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.white),
                          ),
                          const Text(
                            "(CM)",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 20),
                          ),
                          const SizedBox(
                            height: 45,
                          ),
                          Expanded(
                            child: ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              itemCount: 77,
                              itemBuilder: (BuildContext context, int index) {
                                int i = index + 25 * 5;
                                return Padding(
                                  padding: const EdgeInsets.all(18),
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        height = i;
                                      });
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.all(12),
                                      decoration: BoxDecoration(
                                          color: height == i
                                              ? Colors.white
                                              : clrprem,
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      child: Center(
                                        child: Text(
                                          "$i",
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: height == i
                                                  ? clrprem
                                                  : Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          )
                        ],
                      ),
                    ))),
          ],
        ),
        Positioned(
          bottom: 20,
          //right: 80,
          left: MediaQuery.sizeOf(context).width * 2 / 3 - 60,

          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero),
                elevation: 4),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return Resultscreen(
                      height: height, weight: weight, isMale: widget.isMale);
                },
              ));
            },
            child: Text(
              "CALCULATE",
              style: TextStyle(color: clrprem),
            ),
          ),
        ),
      ]),
    );
  }
}
