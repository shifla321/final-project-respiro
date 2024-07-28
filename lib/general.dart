import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:respiro_projectfltr/Advices/Advices.dart';
import 'package:respiro_projectfltr/Diseases/Diseases.dart';

import 'package:respiro_projectfltr/custom_round.dart';
import 'package:respiro_projectfltr/daily.dart';
import 'package:respiro_projectfltr/frame.dart';
import 'package:respiro_projectfltr/news.dart';

class General_page extends StatefulWidget {
  const General_page({super.key});

  @override
  State<General_page> createState() => _General_pageState();
}

class _General_pageState extends State<General_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      SizedBox(
        height: 300,
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
                height: 70,
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: HexColor("F4EAB6"),
                ),
                alignment: Alignment.center,
                child: Text(
                  "General",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 120, 83, 70),
                  ),
                ),
              )),
        ]),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 25, right: 25),
        child: Row(
          children: [
            Container(
                height: 149,
                width: 149,
                decoration: BoxDecoration(
                  color: HexColor("F4EAB6"),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                    child: TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      Diseases(indexnumber: 0)));
                        },
                        child: Text(
                          "Diseases",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                              color: HexColor("D2891B")),
                        )))
                //
                ),
            SizedBox(
              width: 9,
            ),
            Container(
                height: 149,
                width: 149,
                decoration: BoxDecoration(
                  color: HexColor("F4EAB6"),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                    child: TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Advices()));
                        },
                        child: Text(
                          "Advices",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                              color: HexColor("D2891B")),
                        ))))
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 25, right: 25, top: 30),
        child: Row(
          children: [
            Container(
                height: 149,
                width: 149,
                decoration: BoxDecoration(
                  color: HexColor("F4EAB6"),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                    child: TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      news_page(indexnumber: 0)));
                        },
                        child: Text(
                          "News",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                              color: HexColor("D2891B")),
                        )))
                //
                ),
            SizedBox(
              width: 9,
            ),
            Container(
                height: 149,
                width: 149,
                decoration: BoxDecoration(
                  color: HexColor("F4EAB6"),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                    child: TextButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => daily()));
                        },
                        child: Text(
                          "Daily",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                            color: HexColor("D2891B"),
                          ),
                        ))))
          ],
        ),
      ),
    ]));
  }
}
