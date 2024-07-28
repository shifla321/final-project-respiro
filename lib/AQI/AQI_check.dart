import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:respiro_projectfltr/apiresponse/response_weather.dart';
import 'package:respiro_projectfltr/bar%20grapg/mygraph.dart';
import 'package:respiro_projectfltr/custom_round.dart';
import 'package:respiro_projectfltr/firebase/Firebase.dart';
import 'package:respiro_projectfltr/frame.dart';
import 'package:geolocator/geolocator.dart';
import 'package:respiro_projectfltr/model/wether.dart';
import 'package:respiro_projectfltr/provider/firebaseprovider.dart';
import 'package:respiro_projectfltr/provider/helper.dart';
import 'package:respiro_projectfltr/response.dart/res.dart';

class Aqicheck_page extends StatefulWidget {
  double? lat;
  double? lon;
  Aqicheck_page({
    super.key,
    this.lat,
    this.lon,
  });

  @override
  State<Aqicheck_page> createState() => _Aqicheck_pageState();
}

class _Aqicheck_pageState extends State<Aqicheck_page> {
  // late Future<void> _loctationfutur;

  // final WeatherRepositry weatherRepositry =
  //     WeatherRepositry(wetherDataProvider: WetherDataProvider());

  WetherModel? model;

  List<double> airquality = [
    60,
    100.2,
    51.5,
    2.2,
    45.1,
    54.2,
  ];

  @override
  Widget build(BuildContext context) {
    final helper = Provider.of<HelperProvider>(context);
    return DefaultTabController(
      length: 2,
      child: Scaffold(body: SingleChildScrollView(
        child:
            Consumer<WetherDataProvider>(builder: (context, provider, child) {
          return FutureBuilder(
              future: provider.getcurentweather(widget.lat, widget.lon),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }

                // log('data click ${snapshot.data}');
                WetherModel model = provider.modelObj!;

                var aqi = helper.aqi;

                return Column(
                  children: [
                  Stack(
                    children: [
                      CustomPaint(
                        size: const Size(double.maxFinite, 200),
                        painter: RPSCustomPainter(),
                      ),
                      const CustomRound(),
                      const Padding(
                        padding: EdgeInsets.only(top: 110, left: 37),
                      ),
                    ],
                  ),
                  Container(
                    // height: 170,
                    width: 330,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: const Color.fromARGB(255, 255, 255, 255),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          blurRadius: 05,
                          offset: const Offset(0.5, 0.5),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              if (helper.aqi != null)
                                Visibility(
                                  visible: helper.aqi! > 51,
                                  child: Flexible(
                                    child: Text(
                                      'Please not panic the aqi value is icrease 51 care ful',
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                model.cityname,
                                style: TextStyle(fontSize: 26),
                              ),
                            ],
                            mainAxisAlignment: MainAxisAlignment.start,
                          ),
                          const SizedBox(
                            height: 19,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Consumer<HelperProvider>(
                                builder: (context, helper, child) {
                                  return GestureDetector(
                                    onTap: () {
                                      helper.aqicalculate(
                                        model.pm25.toString(),
                                        model.pm10.toString(),
                                        model.o3.toString(),
                                        model.co.toString(),
                                        model.no2.toString(),
                                        model.s02.toString(),
                                      );
                                      log(helper.aqi.toString());
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      height: 60,
                                      width: 60,
                                      color: const Color.fromARGB(
                                          255, 177, 174, 163),
                                      child: helper.aqi == null
                                          ? Text('wait')
                                          : Text(
                                              helper.aqi.toString(),
                                              style: TextStyle(fontSize: 25),
                                            ),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                          const Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 10, top: 6),
                                child: Text(
                                  "AQI",
                                  style: TextStyle(fontSize: 19),
                                ),
                              ),
                            ],
                          ),
                          Text(model.locationtime),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 80,
                    width: 333,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: const Color.fromARGB(255, 255, 255, 255),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.5),
                              blurRadius: 05,
                              offset: const Offset(0.5, 0.5))
                        ]),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "Universal AQI:",
                            style: TextStyle(fontSize: 26),
                          ),
                        ),
                        Text(
                          "51",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Pollutions",
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                      height: 350,
                      width: 350,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: HexColor("F4EAB6"),
                      ),
                      child: Column(children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20, left: 16),
                          child: Row(children: [
                            Container(
                              height: 90,
                              width: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: HexColor("F4BE6D"),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    height: 90,
                                    width: 13,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(14),
                                      color: Colors.green,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(top: 20),
                                          child: Text("PM2.5",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 13)),
                                        ),
                                        Text(
                                          model.pm25.toString(),
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 16),
                              child: Container(
                                  height: 90,
                                  width: 150,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: HexColor("F4BE6D"),
                                  ),
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 90,
                                        width: 13,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(14),
                                          color: const Color.fromARGB(
                                              255, 206, 200, 16),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(top: 20),
                                              child: Text("PM10",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 13)),
                                            ),
                                            Text(
                                              model.pm10.toString(),
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  )),
                            )
                          ]),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 16, top: 15),
                          child: Row(
                            children: [
                              Container(
                                height: 90,
                                width: 150,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: HexColor("F4BE6D"),
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      height: 90,
                                      width: 13,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(14),
                                        color: const Color.fromARGB(
                                            255, 198, 54, 32),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(top: 20),
                                            child: Text("O3",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 13)),
                                          ),
                                          Text(
                                            model.o3.toString(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 13),
                                child: Container(
                                    height: 90,
                                    width: 150,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: HexColor("F4BE6D"),
                                    ),
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 90,
                                          width: 13,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(14),
                                            color: const Color.fromARGB(
                                                255, 149, 55, 12),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(top: 20),
                                                child: Text("CO",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 13)),
                                              ),
                                              Text(
                                                model.co.toString(),
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    )),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.only(left: 16, top: 15),
                            child: Row(
                              children: [
                                Container(
                                  height: 90,
                                  width: 150,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: HexColor("F4BE6D"),
                                  ),
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 90,
                                        width: 13,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(14),
                                          color: const Color.fromARGB(
                                              255, 205, 15, 126),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(top: 20),
                                              child: Text("NO2",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 13)),
                                            ),
                                            Text(
                                              model.no2.toString(),
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 13),
                                  child: Container(
                                      height: 90,
                                      width: 150,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: HexColor("F4BE6D"),
                                      ),
                                      child: Row(
                                        children: [
                                          Container(
                                            height: 90,
                                            width: 13,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(14),
                                              color: const Color.fromARGB(
                                                  255, 230, 23, 203),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Column(
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                    top: 20,
                                                  ),
                                                  child: Text("SO2",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 13)),
                                                ),
                                                Text(
                                                  model.s02.toString(),
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 15),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      )),
                                )
                              ],
                            ))
                      ])),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 55,
                      width: MediaQuery.of(context).size.width/2,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        // color: const Color.fromARGB(255, 255, 255, 255),
                         color: HexColor("F4BE6D"),
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(255, 142, 128, 128)
                                .withOpacity(0.5),
                            blurRadius: 5.0,
                            spreadRadius: 2.0,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      // child: Container(width: 400,
                        // child: TabBar(
                        //     indicatorSize: TabBarIndicatorSize.tab,
                        //     indicator: BoxDecoration(
                        //         borderRadius: BorderRadius.circular(14),
                        //         color: HexColor("F4BE6D")),
                        //     tabs: [
                        //       const Tab(
                        //         text: "Hourly",
                        //       ),
                        //       const Tab(
                        //         text: "Daily",
                        //       ),
                        //     ]),
                        // child: Text('Hourly'),
                        // decoration: BoxDecoration(
                        //         borderRadius: BorderRadius.circular(14),
                        //         color: HexColor("F4BE6D")), 
                        child: Center(child: Text('Hourly',style: TextStyle(fontWeight: FontWeight.bold),)),
                     
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                    Container(
                      height: 400,
                      width: MediaQuery.of(context).size.width,
                      // child: TabBarView(children: [
                      //   Card(
                      //     elevation: 2,
                      //     child: Container(
                      //       height: 20,
                      //       width: 60,
                      //       color: Color.fromARGB(255, 234, 191, 105),
                      //       child: SizedBox(
                      //         child: BarChartExample(
                      //           airquality: [
                      //             model.co,
                      //             model.no2,
                      //             model.o3,
                      //             model.pm10,
                      //             model.pm25,
                      //             model.s02,
                      //           ],
                      //         ),
                      //       ),
                      //     ),
                      //   ),
                      //   Card(
                      //       child: Container(
                      //           height: 20,
                      //           width: 60,
                      //           color: Color.fromARGB(255, 234, 191, 105),
                      //           child: Text("khg"))),
                      // ]),
                      child:  Card(
                          elevation: 2,
                          child: Container(
                            height: 20,
                            width: 60,
                            color: Color.fromARGB(255, 234, 191, 105),
                            child: SizedBox(
                              child: BarChartExample(
                                airquality: [
                                  model.co,
                                  model.no2,
                                  model.o3,
                                  model.pm10,
                                  model.pm25,
                                  model.s02,
                                ],
                              ),
                            ),
                          ),
                        ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 80,
                        right: 80,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Co'),
                          Text('no2'),
                          Text('o3'),
                          Text('pm10'),
                          Text('pm25'),
                          Text('so2'),
                        ],
                      ),
                    ),
                  SizedBox(
                    height: 50,
                  ),
                ]);
              });
        }),
      )),
    );
  }
}
