import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:respiro_projectfltr/AQI/aqi.dart';
import 'package:respiro_projectfltr/general.dart';
import 'package:respiro_projectfltr/settings/Appinfo.dart';
import 'package:respiro_projectfltr/Login/welcome.dart';
import 'package:respiro_projectfltr/custom_round.dart';
import 'package:respiro_projectfltr/frame.dart';
import 'package:respiro_projectfltr/settings/invite.dart';
import 'package:respiro_projectfltr/settings/notification.dart';
import 'package:respiro_projectfltr/settings/settings_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class setting extends StatefulWidget {
  const setting({super.key});

  @override
  State<setting> createState() => _settingState();
}

class _settingState extends State<setting> {
  final _firestore = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    String id = auth.currentUser!.uid;
    print(id);
    return Scaffold(
      drawer: Drawer(
          child: StreamBuilder(
              stream:
                  _firestore.collection('user firebase').doc(id).snapshots(),
              builder: ((context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                DocumentSnapshot data = snapshot.data!;
                return ListView(
                  children: [
                    UserAccountsDrawerHeader(
                      accountName: Text("${data['name']}"),
                      accountEmail: Text("${data['email']}"),
                      currentAccountPicture: CircleAvatar(
                        backgroundImage: AssetImage("images/profile.png"),
                      ),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.person_add_alt_outlined,
                        size: 26,
                      ),
                      title: Text(
                        "Invite Friends",
                        style: TextStyle(fontSize: 22),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Invite_page()),
                        );
                      },
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.settings,
                        size: 26,
                      ),
                      title: Text(
                        "Setting",
                        style: TextStyle(fontSize: 22),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Settings_page()),
                        );
                      },
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.info_outline,
                        size: 26,
                      ),
                      title: Text(
                        "App info",
                        style: TextStyle(fontSize: 22),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Appinfo()),
                        );
                      },
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.notification_add,
                        size: 26,
                      ),
                      title: Text(
                        "Notification",
                        style: TextStyle(fontSize: 22),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => notification()),
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
                            log('Loggout Succesfully' as num);
                          },
                          child: Text(
                            "Log Out",
                            style: TextStyle(fontSize: 22, color: Colors.black),
                          )),
                    )
                  ],
                );
              }))),
      body: Column(children: [
        SizedBox(
          height: 400,
          child: Stack(children: [
            CustomPaint(
              size: Size(double.maxFinite, 200),
              painter: RPSCustomPainter(),
            ),
            Positioned(
              top: 15,
              left: 1,
              right: 1,
              child: Padding(
                padding: const EdgeInsets.only(left: 50, right: 50, top: 100),
                child: Container(
                  height: 159,
                  width: 360,
                  decoration: BoxDecoration(
                    color: HexColor("FCD594"),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, top: 33),
                    child: Text(
                      "Chech Air Quality",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 32,
                          color: HexColor("D2891B"),
                          shadows: const [
                            Shadow(
                                offset: Offset(5, 5),
                                blurRadius: 7,
                                color: Colors.black)
                          ]),
                    ),
                  ),
                ),
              ),
            ),
            const CustomRound(),
            Builder(builder: (context) {
              return Padding(
                padding: const EdgeInsets.only(left: 310, top: 7),
                child: CircleAvatar(
                  backgroundColor: HexColor("D2891B"),
                  child: IconButton(
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                      icon: Icon(
                        Icons.person,
                        color: HexColor("FCD594"),
                      )),
                ),
              );
            })
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
                      child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Aqipage()));
                          },
                          child: Text(
                            "AQI",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 32,
                                color: HexColor("D2891B")),
                          )))),
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
                      child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => General_page()));
                          },
                          child: Text(
                            "General",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 32,
                                color: HexColor("D2891B")),
                          ))))
            ],
          ),
        ),
        const SizedBox(
          height: 150,
        ),
      ]),
    );
  }
}
