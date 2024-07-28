import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:respiro_projectfltr/AQI/AQIscale.dart';
import 'package:respiro_projectfltr/AQI/graph.dart';

import 'package:respiro_projectfltr/custom_round.dart';
import 'package:respiro_projectfltr/frame.dart';
import 'package:respiro_projectfltr/AQI/pollutedcities.dart';

class Aqipage extends StatefulWidget {
  const Aqipage({super.key});

  @override
  State<Aqipage> createState() => _AqipageState();
}

class _AqipageState extends State<Aqipage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        SizedBox(
          // height: 300,
          child: Stack(children: [
            CustomPaint(
              size: const Size(double.maxFinite, 200),
              painter: RPSCustomPainter(),
            ),
            const CustomRound(),
            Positioned(
                top: 120,
                left: 29,
                child: Container(
                  height: 169,
                  width: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: HexColor("F4EAB6"),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.only(top: 25, left: 25),
                    child: Text(
                      "Universal Air Quality",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 120, 83, 70),
                      ),
                    ),
                  ),
                )),
            Padding(
              padding: const EdgeInsets.only(top: 200, left: 199),
              child: Container(
                height: 65,
                width: 65,
                color: const Color.fromARGB(255, 224, 195, 149),
                child: Center(
                    child: Text(
                  "47",
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: HexColor("F4EAB6")),
                )),
              ),
            ),
          ]),
        ),
        const SizedBox(
          height: 30,
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 129,
                  width: 335,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: HexColor("F4EAB6"),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Container(
                                height: 75,
                                width: 75,
                                color: Colors.black12,
                                child: Image.asset("assets/images/res.jpg"),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => PollutedCities()),
                                  );
                                },
                                child: const Text(
                                  "Polluted Cities",
                                  style: TextStyle(
                                      color: Colors.brown,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22),
                                ),
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        HexColor("F4BE6D"))),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 80,
                        ),
                        child: Text(
                          "Top Polluted Cities List",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black.withOpacity(0.5)),
                        ),
                      )
                    ],
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.all(15),
                //   child: Container(
                //     height: 129,
                //     width: 335,
                //     decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(12),
                //       color: HexColor("F4EAB6"),
                //     ),
                //     child: Column(
                //       children: [
                //         Padding(
                //           padding: const EdgeInsets.only(top: 15),
                //           child: Row(
                //             children: [
                //               Padding(
                //                 padding: const EdgeInsets.only(left: 15),
                //                 child: Container(
                //                   height: 75,
                //                   width: 75,
                //                   color: Colors.black12,
                //                   child: Image.asset("assets/images/res.jpg"),
                //                 ),
                //               ),
                //               Padding(
                //                 padding: const EdgeInsets.only(left: 15),
                //                 child: ElevatedButton(
                //                   onPressed: () {
                //                     Navigator.push(
                //                       context,
                //                       MaterialPageRoute(
                //                           builder: (context) => graph()),
                //                     );
                //                   },
                //                   child: const Text(
                //                     "Polluted Cities",
                //                     style: TextStyle(
                //                         color: Colors.brown,
                //                         fontWeight: FontWeight.bold,
                //                         fontSize: 22),
                //                   ),
                //                   style: ButtonStyle(
                //                       backgroundColor:
                //                           MaterialStateProperty.all(
                //                               HexColor("F4BE6D"))),
                //                 ),
                //               ),
                //             ],
                //           ),
                //         ),
                //         Padding(
                //           padding: const EdgeInsets.only(
                //             left: 80,
                //           ),
                //           child: Text(
                //             "Graph",
                //             style: TextStyle(
                //                 fontSize: 18,
                //                 fontWeight: FontWeight.bold,
                //                 color: Colors.black.withOpacity(0.5)),
                //           ),
                //         )
                //       ],
                //     ),
                //   ),
                // ),

                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(1),
                  child: Container(
                    // height: 129,
                    width: 335,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: HexColor("F4EAB6"),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Container(
                                  height: 75,
                                  width: 75,
                                  color: Colors.black12,
                                  child: Image.asset("assets/images/res.jpg"),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => AQIscale()),
                                    );
                                  },
                                  child: const Text(
                                    "AQI Scale",
                                    style: TextStyle(
                                        color: Colors.brown,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22),
                                  ),
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              HexColor("F4BE6D"))),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.only(
                              left: 80,
                            ),
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Aqipage()));
                              },
                              child: Text(
                                "Air Quality Index Scale",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black.withOpacity(0.5)),
                              ),
                            ))
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        )

        //
      ]),
    );
  }
}
