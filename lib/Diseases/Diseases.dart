import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:respiro_projectfltr/Diseases/Asthma_page.dart';
import 'package:respiro_projectfltr/apiresponse/response_weather.dart';

import 'package:respiro_projectfltr/custom_round.dart';

import 'package:respiro_projectfltr/frame.dart';
import 'package:respiro_projectfltr/model/diseasesmodel.dart';
import 'package:respiro_projectfltr/model/wether.dart';
import 'package:respiro_projectfltr/provider/firebaseprovider.dart';

class Diseases extends StatefulWidget {
  int indexnumber = 0;

  Diseases({super.key, required this.indexnumber});

  @override
  State<Diseases> createState() => _DiseasesState();
}

final List<WetherModel> allelement = [];

class _DiseasesState extends State<Diseases> {
  // checkview() {
  //   switch (allelement) {
  //     case :
  //   }
  // }

  double co = 10;

  @override
  Widget build(BuildContext context) {
    final dataprvdr = Provider.of<WetherDataProvider>(context);

    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 195,
            child: Stack(children: [
              CustomPaint(
                size: const Size(double.maxFinite, 200),
                painter: RPSCustomPainter(),
              ),
              const CustomRound(),
              Padding(
                padding: const EdgeInsets.only(left: 110, top: 90),
                child: GestureDetector(
                  onTap: () {
                    log('the obj data indo  ${dataprvdr.modelObj!.co}');
                  },
                  child: Text(
                    "Diseases",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                        color: HexColor("553504")),
                  ),
                ),
              ),
            ]),
          ),
          Expanded(
            child: Consumer<Firebaseprovider>(
              builder: (context, instnce, child) {
                return FutureBuilder(
                  future: instnce.checkValues(
                      Provider.of<WetherDataProvider>(context, listen: false)
                          .modelObj!),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    final data = instnce.listOfDisieses;

                    var allelement = data;

                    return data.isEmpty
                        ? Center(
                            child: Text('No diseses'),
                          )
                        : ListView.builder(
                            itemCount: data.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: ((context) => Asthmapage(
                                            singlediseas: data[index],
                                          )),),);
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
                                            data[index].Image,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 50,
                                      ),
                                      Flexible(
                                        child: Text(
                                          data[index].Name,
                                          style: const TextStyle(fontSize: 26),
                                        ),
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
            ),
          ),
        ],
      ),
    );
  }
}










                //   switch (index) {
                                //     case 0:
                                //       Navigator.of(context).push(MaterialPageRoute(
                                //           builder: ((context) => const Asthmapage())));
                                //       break;
                                //     case 1:
                                //       Navigator.of(context).push(MaterialPageRoute(
                                //           builder: ((context) => const COPD_page())));
                                //       break;
                                //     case 2:
                                //       Navigator.of(context).push(MaterialPageRoute(
                                //           builder: ((context) => const Pneumonia_page())));
                                //       break;
                                //     case 3:
                                //       Navigator.of(context).push(MaterialPageRoute(
                                //           builder: ((context) => const HeartAttack_page())));
                                //           case 4:
                                //       Navigator.of(context).push(MaterialPageRoute(
                                //           builder: ((context) => const Stroke_page())));
                                //       break;
                                //     case 5:
                                //       Navigator.of(context).push(MaterialPageRoute(
                                //           builder: ((context) => const LungCancer_page())));
                                //       break;
                                //     case 6:
                                //       Navigator.of(context).push(MaterialPageRoute(
                                //           builder: ((context) => const Dementia_page())));
                                //     case 7:
                                //       Navigator.of(context).push(MaterialPageRoute(
                                //           builder: ((context) => const ParkinsonDisease_page())));
                                //       break;
                                //     case 8:
                                //       Navigator.of(context).push(MaterialPageRoute(
                                //           builder: ((context) => const SkinDiseases_page())));
                                //       break;
                                //   }