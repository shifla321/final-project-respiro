import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:respiro_projectfltr/AQI/AQI_check.dart';
import 'package:respiro_projectfltr/custom_round.dart';
import 'package:respiro_projectfltr/frame.dart';
import 'package:respiro_projectfltr/location.dart';
import 'package:respiro_projectfltr/provider/helper.dart';

class daily extends StatefulWidget {
  const daily({super.key});

  @override
  State<daily> createState() => _dailyState();
}

class _dailyState extends State<daily> {
  @override
  Widget build(BuildContext context) {
    final prvdr = Provider.of<HelperProvider>(context);
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: Column(children: [
          Stack(
            children: [
              CustomPaint(
                size: Size(double.maxFinite, 200),
                painter: RPSCustomPainter(),
              ),
              CustomRound(),
              Padding(
                padding: const EdgeInsets.only(top: 110, left: 37),
                child: Container(
                  height: 70,
                  width: 290,
                  child: Column(
                    children: [
                      Center(
                          child: Text(
                        "DAILY",
                        style: TextStyle(
                            fontSize: 36,
                            color: HexColor("553504"),
                            fontWeight: FontWeight.bold),
                      )),
                    ],
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: HexColor("F4EAB6"),
                  ),
                ),
              ),
            ],
          ),
          Container(
            height: 55,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              color: Color.fromARGB(255, 255, 255, 255),
              boxShadow: [
                BoxShadow(
                  color:
                      const Color.fromARGB(255, 142, 128, 128).withOpacity(0.5),
                  blurRadius: 5.0,
                  spreadRadius: 2.0,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: TabBar(
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: HexColor("F4BE6D")),
                tabs: [
                  const Tab(
                    text: "HOME",
                  ),
                  const Tab(
                    text: "WORK",
                  ),
                  const Tab(
                    text: "OTHER",
                  )
                ]),
          ),
          Expanded(
            child: TabBarView(children: [
              Container(
                color: const Color.fromARGB(255, 255, 255, 255),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            height: 120,
                            width: 290,
                            color: const Color.fromARGB(255, 186, 182, 171),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Locationview()),
                                    );
                                  },
                                  icon: Icon(Icons.add_circle_outline),
                                  iconSize: 40,
                                ),
                                Text(
                                  'SET HOME',
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            )),
                      ],
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    if (prvdr.isclick)
                      Consumer<HelperProvider>(
                        builder: (context, prvdr, child) {
                          return SizedBox(
                            width: 300,
                            height: 200,
                            child: GoogleMap(
                              // onMapCreated: _onmapCreated,
                              onTap: (argument) async {
                                // await instance
                                //     .handleLocationPermission(context)
                                //     .then((value) => instance.latlog());

                                // log('this map lat lon ${instance.lat.toString()},${instance.lon.toString()}');
                              },
                              initialCameraPosition: CameraPosition(
                                target: LatLng(
                                  // 11.1202668,
                                  // 76.1198972,
                                  prvdr.searchlatti!,
                                  prvdr.searchlont!,
                                ),
                                zoom: 13,
                              ),
                              markers: {
                                Marker(
                                  markerId: MarkerId('marker'),
                                  position: LatLng(
                                    // 11.1202668,
                                    // 76.1198972,
                                    prvdr.searchlatti!,
                                    prvdr.searchlont!,
                                  ),
                                ),
                              },
                            ),
                          );
                        },
                      )
                  ],
                ),
              ),
              Container(
                color: const Color.fromARGB(255, 255, 255, 255),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        height: 120,
                        width: 290,
                        color: const Color.fromARGB(255, 186, 182, 171),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.add_circle_outline),
                              iconSize: 40,
                            ),
                            Text(
                              'SET WORK',
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold),
                            )
                          ],
                        )),
                  ],
                ),
              ),
              Container(
                color: const Color.fromARGB(255, 255, 255, 255),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        height: 120,
                        width: 290,
                        color: const Color.fromARGB(255, 186, 182, 171),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.add_circle_outline),
                              iconSize: 40,
                            ),
                            Text(
                              'SET OTHER',
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold),
                            )
                          ],
                        )),
                  ],
                ),
              ),
            ]),
          ),
        ]),
      ),
    );
  }
}
