import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:respiro_projectfltr/AQI/AQI_check.dart';
import 'package:respiro_projectfltr/AQI/aqi.dart';
import 'package:respiro_projectfltr/Login/welcome.dart';
import 'package:respiro_projectfltr/custom_round.dart';
import 'package:respiro_projectfltr/frame.dart';
import 'package:respiro_projectfltr/general.dart';
import 'package:respiro_projectfltr/home2.dart';
import 'package:respiro_projectfltr/provider/firebaseprovider.dart';
import 'package:respiro_projectfltr/provider/helper.dart';
import 'package:respiro_projectfltr/settings/Appinfo.dart';
import 'package:respiro_projectfltr/settings/invite.dart';
import 'package:respiro_projectfltr/settings/notification.dart';
import 'package:respiro_projectfltr/settings/settings.dart';
import 'package:respiro_projectfltr/settings/settings_page.dart';
import 'package:respiro_projectfltr/utils/toast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class home1 extends StatefulWidget {
  const home1({super.key});

  @override
  State<home1> createState() => _demoState();
}

class _demoState extends State<home1> {
  @override
  void initState() {
    super.initState();
    _handleLocationPermission();
  }

  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();  
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location services are disabled. Please enable the services')));
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Location permissions are denied')));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location permissions are permanently denied, we cannot request permissions.')));
      return false;
    }
    return true;
  }

  double? lat;
  double? lon;
  final _firestore = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;
  // String id = auth.currentUser!.uid;

  drawer() {
    final prvdr = Provider.of<Firebaseprovider>(context, listen: false);
    return Drawer(
        child: FutureBuilder(
            future: prvdr.getuser(auth.currentUser!.uid),
            builder: ((context, snapshot) {
              log('this drawer data${snapshot.data}');
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              // DocumentSnapshot data = snapshot.data!;
              final siguser = prvdr.usermodel;
              return ListView(
                children: [
                  UserAccountsDrawerHeader(
                    accountName: Text(siguser!.name),
                    accountEmail: Text(siguser.email),
                    currentAccountPicture: const CircleAvatar(
                      backgroundImage: AssetImage("assets/images/profile.png"),
                    ),
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.person_add_alt_outlined,
                      size: 26,
                    ),
                    title: const Text(
                      "Invite Friends",
                      style: TextStyle(fontSize: 22),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Invite_page()),
                      );
                    },
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.settings,
                      size: 26,
                    ),
                    title: const Text(
                      "Setting",
                      style: TextStyle(fontSize: 22),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Settings_page()),
                      );
                    },
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.info_outline,
                      size: 26,
                    ),
                    title: const Text(
                      "App info",
                      style: TextStyle(fontSize: 22),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Appinfo()),
                      );
                    },
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.notification_add,
                      size: 26,
                    ),
                    title: const Text(
                      "Notification",
                      style: TextStyle(fontSize: 22),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const notification()),
                      );
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 300),
                    child: TextButton(
                        onPressed: () async {
                          SharedPreferences preferences =
                              await SharedPreferences.getInstance();
                          auth.signOut().then((value) => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => const login()))));
                          preferences.clear();
                        },
                        child: const Text(
                          "Log Out",
                          style: TextStyle(fontSize: 22, color: Colors.black),
                        )),
                  )
                ],
              );
            })));
  }

  Future latlog() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    setState(() {
      lat = position.latitude;
      lon = position.longitude;
    });

    log('user lat cehck click ${position.latitude} log ${position.longitude}  ===========================');
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        drawer: drawer(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // SizedBox(
              //   height: 30,
              // ),
              SizedBox(
                height: 400,
                child:
                 Stack(children: [
                  CustomPaint(
                    size: const Size(double.maxFinite, 200),
                    painter: RPSCustomPainter(),
                  ),

                  Positioned(
                    top: 15,
                    left: 1,
                    right: 1,
                    child: Padding(
                        padding: const EdgeInsets.only(
                            left: 50, right: 50, top: 100),
                        child: Consumer<HelperProvider>(
                          builder: (context, value, child) {
                            return GestureDetector(
                              onTap: () async {
                                // await _handleLocationPermission();
                                await latlog();

                                if (lat != null)
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Aqicheck_page(
                                              lat: lat,
                                              lon: lon,
                                            )),
                                  );
                              },
                              child: Container(
                                height: 159,
                                width: 360,
                                decoration: BoxDecoration(
                                  color: HexColor("FCD594"),
                                ),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(left: 20, top: 33),
                                  child: Text(
                                    "Chech Air Quality",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 32,
                                        color: HexColor("D2891B"),
                                        shadows: [
                                          const Shadow(
                                              offset: Offset(5, 5),
                                              blurRadius: 7,
                                              color: Colors.black)
                                        ]),
                                  ),
                                ),
                              ),
                            );
                          },
                        )),
                  ),
                  const CustomRound(),
                  // Padding(
                  //   padding: const EdgeInsets.only(left: 310, top: 7),
                  //   child: CircleAvatar(
                  //       backgroundColor: HexColor("D2891B"),
                  //       child: IconButton(
                  //         onPressed: () {
                  //           // Navigator.push(
                  //           //     context,
                  //           //     MaterialPageRoute(
                  //           //         builder: (context) => setting()));
                  //           Scaffold.of(context).openDrawer();
                  //           log('click drawer');
                  //         },
                  //         icon: Icon(
                  //           Icons.person,
                  //           color: HexColor("FCD594"),
                  //         ),
                  //       )),
                  // )

                  // Align(
                  //   alignment: Alignment.topRight,
                  //   child: Container(height: 100,width: 170,
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.only(bottomLeft: Radius.elliptical(200, 150)),color: HexColor("FCD594"),
                  //   ),),),
                ]),
              ),
              const SizedBox(
                height: 3,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30),
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
                                          builder: (context) => const Aqipage()));
                                },
                                child: Text(
                                  "AQI",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 32,
                                      color: HexColor("D2891B")),
                                )))
                        //
                        ),
                    const SizedBox(
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
                                    builder: (context) => const General_page()));
                          },
                          child: Text(
                            "General",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 32,
                                color: HexColor("D2891B")),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 150,
              ),
              Container(
                height: 38,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: HexColor("F4BE6D"),
                    borderRadius: BorderRadius.circular(12)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
