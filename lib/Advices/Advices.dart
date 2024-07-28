import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:respiro_projectfltr/Advices/Kids.dart';
import 'package:respiro_projectfltr/Advices/Pregnant.dart';
import 'package:respiro_projectfltr/Advices/construction.dart';
import 'package:respiro_projectfltr/Advices/outdoor.dart';
import 'package:respiro_projectfltr/custom_round.dart';
import 'package:respiro_projectfltr/Advices/farmers_page.dart';
import 'package:respiro_projectfltr/frame.dart';
import 'package:respiro_projectfltr/provider/firebaseprovider.dart';

class Advices extends StatefulWidget {
  Advices({super.key});

  @override
  State<Advices> createState() => _AdvicesState();
}

class _AdvicesState extends State<Advices> {
  @override
  Widget build(BuildContext context) {
    final List _advicelist = [
      {'title': 'Farmers', 'img': 'assets/images/farmers.png'},
      {'title': 'Kids', 'img': 'assets/images/kids.png'},
      {'title': 'Outdoor Workers', 'img': 'assets/images/outdoor.png'},
      {'title': 'Pregnant Womens', 'img': 'assets/images/pregnant.png'},
      {'title': 'Construction Sector', 'img': 'assets/images/construction.png'},
    ];
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 195,
            child: Stack(children: [
              CustomPaint(
                size: Size(double.maxFinite, 200),
                painter: RPSCustomPainter(),
              ),
              CustomRound(),
              Padding(
                padding: const EdgeInsets.only(left: 110, top: 90),
                child: Text(
                  "Advices",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                      color: HexColor("553504")),
                ),
              )
            ]),
          ),
          Expanded(child: Consumer<Firebaseprovider>(
            builder: (context, instance, child) {
              return FutureBuilder(
                future: instance.getAdvide(),
                builder: (context, snapshot) {
                  final data = instance.adv;
                  
                  return ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) { 
                      return InkWell(
                        onTap: () {
                         Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => farmers_page(data: data[index]),
                    ),
                  );
                          //  switch (index) {
                              // case 0:
                              //   Navigator.of(context).push(MaterialPageRoute(
                              //       builder: ((context) => const farmers_page())));
                              //   break;
                              // case 1:
                              //   Navigator.of(context).push(MaterialPageRoute(
                              //       builder: ((context) => const kids_page())));
                              //   break;
                              // case 2:
                              //   Navigator.of(context).push(MaterialPageRoute(
                              //       builder: ((context) => const outdoor_page())));
                              //   break;
                              // case 3:
                              //   Navigator.of(context).push(MaterialPageRoute(
                              //       builder: ((context) => const pregnant_page())));
                              //   break;
                              //   case 4:
                              //   Navigator.of(context).push(MaterialPageRoute(
                              //       builder: ((context) => const constrution_page())));
                              //   break;
                            // }
                        },
                        child: Container(
                          margin: const EdgeInsets.only(top: 50),
                          height: 100,
                          width: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: HexColor("BE8C39"),
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 12),
                                child: CircleAvatar(
                                  radius: 35,
                                  backgroundImage: NetworkImage(
                                    data[index].adviceimage,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Text(
                                data[index].Advidename,
                                style: const TextStyle(fontSize: 13),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              );
            },
          ))
        ],
      ),
    );
  }
}
