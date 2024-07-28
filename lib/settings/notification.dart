import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:respiro_projectfltr/provider/firebaseprovider.dart';
import 'package:respiro_projectfltr/provider/helper.dart';
import 'package:respiro_projectfltr/utils/toast.dart';

class notification extends StatefulWidget {
  const notification({super.key});

  @override
  State<notification> createState() => _notificationState();
}

class _notificationState extends State<notification> {
  @override
  Widget build(BuildContext context) {
    final helper = Provider.of<HelperProvider>(context, listen: false);
    return Scaffold(body: Consumer<Firebaseprovider>(
      builder: (context, insatnce, child) {
        return FutureBuilder(
          future: insatnce.getnotification(auth.currentUser!.uid),
          builder: (context, snapshot) {
            final notif = insatnce.notimodel;
            return SafeArea(
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  if (helper.aqi != null)
                    Visibility(
                      visible: helper.aqi! > 51,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Icon(
                              Icons.waving_hand,
                              color: Colors.red,
                            ),
                          ),
                          SizedBox(width: 20),
                          Container(
                            height: 70,
                            width: 270,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.red,
                            ),
                            child: Center(
                                child: Text(
                              'Your danger zone ',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            )),
                          )
                        ],
                      ),
                    ),
                  notif.isEmpty
                      ? Center(
                          child: Text('no notification at the time'),
                        )
                      : Expanded(
                          child: ListView.builder(
                            itemCount: notif.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(top: 30),
                                child: Container(
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20),
                                        child: Icon(
                                          Icons.waving_hand,
                                          color: Colors.yellow,
                                        ),
                                      ),
                                      SizedBox(width: 20),
                                      Container(
                                        height: 70,
                                        width: 270,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          color: Colors.black,
                                        ),
                                        child: Center(
                                            child: Text(
                                          notif[index].msg,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18),
                                        )),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                ],
              ),
            );
          },
        );
      },
    ));
  }
}
