import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:respiro_projectfltr/AQI/pollutioncities1.dart';
import 'package:respiro_projectfltr/custom_round.dart';
import 'package:respiro_projectfltr/frame.dart';
import 'package:respiro_projectfltr/model/polutedcity.dart';
import 'package:respiro_projectfltr/provider/firebaseprovider.dart';

class PollutedCities extends StatefulWidget {
  const PollutedCities({super.key});

  @override
  State<PollutedCities> createState() => _PollutedCitiesState();
}

class _PollutedCitiesState extends State<PollutedCities> {
  @override
  Widget build(BuildContext context) {
    final List countries = ["india", "japan", "uk", "spain"];
    String? values;
    return Scaffold(
        body: Column(children: [
      SizedBox(
        child: Stack(children: [
          CustomPaint(
            size: const Size(double.maxFinite, 200),
            painter: RPSCustomPainter(),
          ),
          const CustomRound(),
          const Padding(
            padding: EdgeInsets.only(top: 50, left: 12),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 99),
            child: Center(
              child: Container(
                height: 40,
                width: 230,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.withOpacity(0.5),
                ),
                child: const Center(child: Text("Top Polluted Cities List ")),
              ),
            ),
          ),
        ]),
      ),
      Column(
        children: [
       
          Consumer<Firebaseprovider>(
            builder: (context, instance, child) {
              print('data');
              return FutureBuilder(
                future: instance.getPolutedCity(),
                builder: (context, snapshot) {
                  log('snapshot poluted city${snapshot.data}');

                  final data = instance.polutesstate;
                 
                  return ListView.separated(
                    itemCount: data.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final polutedstate = data[index];
                      return ListTile(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => PollutionCitiesDetails(
                                  polutedState: data[index])));
                        },
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(data[index].image),
                        ),
                        title: Text(data[index].country),
                        // children: [
                        // Container(
                        //     height: 100,
                        //     child: ListView.builder(
                        //       itemCount: polutedstate.statemodel.length,
                        //       shrinkWrap: true,
                        //       itemBuilder: (context, index) {
                        //         return Column(
                        //           children: [
                        //             Padding(
                        //               padding: const EdgeInsets.symmetric(
                        //                   horizontal: 50),
                        //               child: Column(
                        //                 children: [
                        //                   Row(
                        //                     mainAxisAlignment:
                        //                         MainAxisAlignment
                        //                             .spaceBetween,
                        //                     children: [
                        //                       Text(
                        //                           'Sate: ${polutedstate.statemodel[index].state}'),
                        //                       Text(
                        //                           'Aqi value: ${polutedstate.statemodel[index].aqi}'),
                        //                     ],
                        //                   ),
                        //                 ],
                        //               ),
                        //             )
                        //           ],
                        //         );
                        //       },
                        //     )),
                        // ],
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const Divider(
                        thickness: 5,
                        color: Colors.white,
                      );
                    },
                  );
                },
              );
            },
          )
        ],
      ),
    ]));
  }
}
